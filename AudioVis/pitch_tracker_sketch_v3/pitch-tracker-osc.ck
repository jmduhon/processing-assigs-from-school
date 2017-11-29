// osc stuff
OscOut osc;
osc.dest("127.0.0.1", 12001);

//////////***********Sound Stuff**************///////////////
adc => FFT fft => blackhole; // Microphone to FFT
// FM oscillators
    SinOsc s => LPF lpf => Pan2 master;
    SinOsc a=>s;
    SinOsc d=>s;
    SinOsc f=>a;
    ///oscillator sync modes
    2 => s.sync;
    2 => a.sync;
    2 => d.sync;
    2 => f.sync;
    ///Gain management
    master => dac;
    0.1 => master.gain;
    // FM gain Parameters
    500 => a.gain;
    450 => d.gain;
    800 => f.gain;
   //filter parameters
    1000 => lpf.freq;
    5.5 => lpf.Q;
second / samp => float sample_rate; // calculate sample rate

4096 => fft.size => int fft_size; // Set FFT Size
1024 => int window_size; // Set Window Size
window_size/2 => int hop_size; // Calculate Hop Size


Windowing.hamming(window_size) => fft.window; // set window with window size

while(true)
{
    ///////////////////////////////////// osc sending
    
    
    
	fft.upchuck(); // Perform FFT
    float Z[fft_size/2]; // Create Array to store bin values
    
	for(0 => int i ; i < Z.cap(); i++)
    {
        fft.fval(i) => Z[i]; // store bin values
    }
    
    maxBin(Z) => int max_bin; // find biggest bin
    bin2Freq(max_bin) => float freq; // convert to frequency
    ////make a band to eliminate some unwanted frequencies
    if(freq < 150){
        0 => s.gain;
    }
    else if (freq > 2000){
        0 => s.gain;
    }
    else{
        .5 => s.gain;
    }
    freq => s.freq; // set our oscillator frequency
    ///set up FM frequency bidness
            s.freq() * 2.0 => a.freq;
            s.freq() * Math.random2f(1.0,4.0) => d.freq;
            a.freq() * 2.0 => f.freq;
            //advance time

    <<< freq, s.freq() >>>;
    oscOut("/frequency", s.freq());
    hop_size::samp => now; // move time by hop size
}

fun int maxBin(float A[])
{
	// initialize variables to store max value and index
    0.0 => float tempMaxValue;
    0 => int tempMaxIndex;
    
    for(0 => int i; i < A.cap(); i++)
    {
		// If current bin value is greater than stored value, update value and index
        if(tempMaxValue < A[i])
        {
            i => tempMaxIndex;
            A[i] => tempMaxValue;
        }
    }
    return tempMaxIndex;
}

fun float bin2Freq(int bin)
{
	// We want to convert bin to frequency so we multiply by the sample rate
	// which is maximum value of our bins (though we ignore everything above Nyquist)
	// and divide by the size of our FFT
    (bin * sample_rate)/fft_size => float freq;
    return freq;
}


// osc sending function
fun void oscOut(string addr, float val) {
    osc.start(addr);
    osc.add(val);
    osc.send();
}