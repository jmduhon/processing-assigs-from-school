//Import libraries
import oscP5.*;
import netP5.*;

//create osc objects
OscP5 oscP5; //controls OSC inputs
NetAddress myRemoteLocation; //sets OSC output

//Mover object from previous classes
Mover mover = new Mover(20, 100, 100, -1, 3);


//setup function
void setup()
{
  size(500,500);
  //receive OSC
  oscP5 = new OscP5(this,12001);
  //address Im sending to. 127.0.0.1 is my computers IP address
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
}

void draw()
{
  background(0);
  //use our own function to send OSc
  //cast our PVector values as ints
  sendOSC(int(mover.location.x), int(mover.location.y));
  //mover functions
  mover.update();
  mover.display();
  mover.checkEdges();
  mover.bounce();
}

void sendOSC(int x, int y)
{
  //create message with address
  OscMessage msg = new OscMessage("/mover");
  //add data
  msg.add(x);
  msg.add(y);
  //seend message to location
  oscP5.send(msg, myRemoteLocation);
}
