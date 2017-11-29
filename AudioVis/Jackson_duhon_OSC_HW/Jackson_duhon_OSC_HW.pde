//Import OSC libraries
import oscP5.*;
import netP5.*;

//create OSC objects
OscP5 oscP5; //controls OSC inputs
NetAddress myRemoteLocation; //sets OSC output

///create snow objects
int objects = 5000;
Snow[] snow = new Snow[objects];

////GLOBAL VARIABLES
float time = 0.0;
float increment = 0.01;
float gravScale = 0.001;

//setup function
void setup()
{
  size(500,500);
  //receive OSC
  oscP5 = new OscP5(this,12001);
  //address Im sending to. 127.0.0.1 is my computers IP address
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  //populating array
  for (int i = 0; i < objects; i++){
    snow[i] = new Snow();
  }
  //initial parameters
  colorMode(HSB, 360);
  background(0);
}
//draw function
void draw()
{
   //use our own function to send OSC
  //cast our PVector values as ints
  for (int i = 0; i < objects; i++){
    sendOSC(int(snow[i].location.x), int(snow[i].location.y), random(0.4,0.7));
  }
  //adding forces
  PVector grav = new PVector(0,gravScale);//downward gravity
  //interactivy
  if (mousePressed){
    gravScale += 0.1;
  }
  //applying methods to array members
  for(int i = 0; i < objects; i++){
    snow[i].update();
    snow[i].applyForce(grav);
    snow[i].display();
    snow[i].bringUp();
    snow[i].colorChange();
  }
}

void sendOSC(int x, int y, float z)
{
  //create message with address
  OscMessage msg = new OscMessage("/snow");
  //add data
  msg.add(x);
  msg.add(y);
  msg.add(z);
  //seend message to location
  oscP5.send(msg, myRemoteLocation);
}
