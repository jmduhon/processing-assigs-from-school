// Jackson Duhon
//import libraries
import oscP5.*;
import netP5.*;

//set OSC send and receive locations
OscP5 oscP5;
NetAddress myRemoteLocation;

//FFT variables
float centroid;
float rms;
float rolloff50;
float rolloff85;

///create snow objects
int objects = 5000;
Snow[] snow = new Snow[objects];

////GLOBAL VARIABLES
float time = 0.0;
float increment = 0.01;
float gravScale = 0.1;


// native osc function
void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/centroid") == true) {
    centroid = msg.get(0).floatValue();
  }
  if (msg.checkAddrPattern("/rms") == true) {
    rms = msg.get(0).floatValue();
  }
  if (msg.checkAddrPattern("/rolloff50") == true) {
    rolloff50 = msg.get(0).floatValue();
  }
  if (msg.checkAddrPattern("/rolloff85") == true) {
    rolloff85 = msg.get(0).floatValue();
  }
}

void setup() 
{
  size(500, 500);
  background(0);

//setup OSC objects
  oscP5 = new OscP5(this, 12001);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  //populating array
  for (int i = 0; i < objects; i++){
    snow[i] = new Snow();
  }
  colorMode(HSB, 360); 
  noCursor();
}

void draw()
{
   //use our own function to send OSC
  //cast our PVector values as ints
  for (int i = 0; i < objects; i++){
  }
  //adding forces
  PVector grav = new PVector(gravScale,gravScale);
  PVector antiGrav = new PVector(-gravScale*3,-gravScale*3);

  //applying methods to array members
  for(int i = 0; i < objects; i++){
    snow[i].update();
    snow[i].display();
    snow[i].applyForce(grav);
    if(mousePressed){
    snow[i].applyForce(antiGrav);
    }
    snow[i].bringUp();
    snow[i].colorChange();
  }
}
