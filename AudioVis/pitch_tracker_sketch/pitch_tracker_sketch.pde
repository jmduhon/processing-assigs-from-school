//Import OSC libraries
import oscP5.*;
import netP5.*;

//create OSC objects
OscP5 oscP5; //controls OSC inputs
NetAddress myRemoteLocation; //sets OSC output

//OSC variables from ChucK
float freq;
//Make Mover
Mover mover = new Mover();

// native osc function
void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/frequency") == true) {
    freq = msg.get(0).floatValue();
  }
}

//setup function
void setup()
{
  size(500,500);
  //receive OSC
  oscP5 = new OscP5(this,12001);
  //address Im sending to. 127.0.0.1 is my computers IP address
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  //initial parameters
  //colorMode(HSB, 360);
  //background(0);
}

void draw()
{
  //make frequency the force applied to acceleration
  PVector frequency = new PVector(0, freq);
  ///Mover functions
  mover.applyForce(frequency);
  mover.update();
  mover.display();
}










