import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float centroid;
float rms;
float rolloff50;

void setup()
{
  size(500,500);
  
  oscP5 = new OscP5(this, 12001);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  
  colorMode(HSB, 360);
  noCursor();
  background(0);
}

//native osc function
void oscEvent(OscMessage msg)
{
  if (msg.checkAddrPattern("/centroid") == true){
    centroid = msg.get(0).floatValue();
  }
  if (msg.checkAddrPattern("/rms") == true){
    rms = msg.get(0).floatValue();
  }
  if (msg.checkAddrPattern("/rolloff50") == true){
    rolloff50 = msg.get(0).floatValue();
  }
}

void draw()
{
  translate(width*0.5, height*0.5);
  rotate(rolloff50*2.0);
  fill(centroid % 360, 360, 360, 20);
  rect(0,0, rms*5.0, rms*5.0);
}
