//Import OSC libraries
import oscP5.*;
import netP5.*;

//create OSC objects
OscP5 oscP5; //controls OSC inputs
NetAddress myRemoteLocation; //sets OSC output

//OSC variables from ChucK
int numReadings = 10;
float frequency[] = new float[numReadings];
int index = 0;
float total = 0;
float average = 0;
float freq;
//Make Mover
Mover[] mover = new Mover[10];
///gravity
float grav = 0.01;

// native osc function
void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/frequency") == true) {
    freq = msg.get(0).floatValue();
  }
  //mapping OSC value
  freq = norm(freq, 150, 2000);
  println(freq);
}

//setup function
void setup()
{
  size(500,500);
  //receive OSC
  oscP5 = new OscP5(this,12001);
  //address Im sending to. 127.0.0.1 is my computers IP address
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  //populating array
  for (int i = 0; i < 10; i++){
    mover[i] = new Mover();
  }
  ///array for frequency averaging
  for (int thisReading = 0; thisReading < numReadings; thisReading++){
   frequency[thisReading]=0; 
  }
}

void draw()
{
  background(0);
  ////averaging values to make things smoother
  total = total-frequency[index];///subtract the last reading
  frequency[index] = freq; //take OSC value
  total = total + frequency[index]; // add freq to the total
  index = index + 1; // advacne to next pos in the array
  /////if we're at the end of the array
  if (index >= numReadings){
    index=0;
  }
  average = total / numReadings;//find the average
  
  //Mover functions
  for(int i=0; i < 10; i++){
  mover[i].display();
  mover[i].bounce();
  }
}

