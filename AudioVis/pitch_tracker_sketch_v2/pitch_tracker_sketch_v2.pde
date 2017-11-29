//Import OSC libraries
import oscP5.*;
import netP5.*;

//create OSC objects
OscP5 oscP5; //controls OSC inputs
NetAddress myRemoteLocation; //sets OSC output

//OSC variables from ChucK
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
  //initial parameters
  //colorMode(HSB, 360);
}

void draw()
{
  background(0);
  //make frequency the force applied to acceleration
  PVector frequency = new PVector(0, freq);
  //Mover functions
  for(int i=0; i < 10; i++){
  //mover[i].applyForce(frequency);
  //mover[i].update();
  mover[i].display();
  mover[i].bounce();
  }
}

