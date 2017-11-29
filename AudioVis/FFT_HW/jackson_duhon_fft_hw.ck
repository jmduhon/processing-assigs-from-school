// sound chain
///sending dac to FFT to do FFT on a composition
dac => FFT fft;
fft =^ Centroid cent => blackhole;
fft =^ RMS rms => blackhole;
fft =^ RollOff roff50 => blackhole;
fft =^ RollOff roff85 => blackhole;

// osc stuff
OscOut osc;
osc.dest("127.0.0.1", 12001);

// set parameters
256 => fft.size;

// set hann window
Windowing.hann(256) => fft.window;

// find our sampling rate
second / samp => float srate;

// set rolloff percentages
.5 => roff50.percent;
.85 => roff85.percent;

spork ~ composition();

// main loop where we extract our features
while( true )
{
    // takes our features
    cent.upchuck();
    rms.upchuck() @=> UAnaBlob blob;
    roff50.upchuck();
    roff85.upchuck();
    
    // osc sending
    oscOut("/rms", Std.rmstodb(blob.fval(0)));
    oscOut("/centroid", cent.fval(0) * 360);
    oscOut("/rolloff50", roff50.fval(0));
    oscOut("/rolloff50", roff85.fval(0));
    
    // advance time
    fft.size()::samp => now;
}

////composition function
fun void composition()
{
    ////Global Variables and Sound bidness for while loops
    ///Waveloop for first while loop
    WaveLoop dope =>PitShift pitch => Pan2 master;
    ///FM for second while loop
    SinOsc sine1 => master;
    SinOsc mod1 => sine1;
    SinOsc mod2 => sine1;
    SinOsc mod3 => mod1;
    //SndBuf for Third While loop
    SndBuf soundBuf=>Pan2 pan => master;
    ///
    "special:dope" =>dope.path;
    0.0=>float x;
    ///Gain Management
    master => dac;
    1.0 => master.gain;
    0.9=>sine1.gain;
    ///set time parameter
    10 => int vignette;
    
    now + vignette::second => time later1;
    ////first composition
    while(now < later1)
    {
        250+250*Math.sin(x) => dope.freq;x+.1 =>x;
        Math.random2f(0.5,1.0)=>pitch.mix;
        Math.random2f(1.0,5.0)=>pitch.shift;
        150::ms => now; 
    }
    0.0 => dope.gain;
    now + vignette::second => time later2;
    ////second composition
    while(now < later2)
    {
        for(45 => int i; i<500; 30+=> i)
        {
            Math.random2(1,7)=>int x;
            i => sine1.freq;
            i*x => mod1.freq;
            i*x => mod2.freq;
            i*x => mod3.freq;
            99 => mod1.gain;
            250 => mod2.gain;
            250 => mod3.gain;
            100::ms => now;
        }
    }
    0.0 => sine1.gain;
    now + vignette::second => time later3;
    ///third composition
    while(now < later3)
    {
        //try changing the time chucked to now for different effects.
        Math.random2f(-1.0,1.0)=>pan.pan;
        Math.sin((4::ms=>now)/pi::ms)=>soundBuf.rate;
        Math.random2(0,1)=>int x;
        if(x==0){
            "special:twopeaks"=>soundBuf.read;
        }
        else{
            "special:dope"=>soundBuf.read;
        }
        25::ms=>now;
    }
}


// osc sending function
fun void oscOut(string addr, float val) {
    osc.start(addr);
    osc.add(val);
    osc.send();
}