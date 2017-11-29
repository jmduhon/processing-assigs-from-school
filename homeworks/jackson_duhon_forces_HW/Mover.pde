class Mover
{
  //PVectors
  PVector location;
  PVector velocity;
  PVector acceleration;
  //color variables
  int r;
  int g;
  int b;
  
  //constructor
  Mover()
  {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  //Newton's Laws and shizz
  void applyForce(PVector force)
  {
    PVector f = force;
    acceleration.add(f);
  }
  //update function
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  //display function
  void display()
  {
    stroke(255);
    strokeWeight(0);
    fill(r,g,b);
    rect(location.x,location.y,2,20);
  }
  //make snow fall from the top of the screen
  void bringUp()
  {
    ///change color
    if (location.y > 0){
    r=int(random(0,100));
    g=int(random(0,100));
    b=int(random(0,255));
    }
    ////////////X Axis
    if (location.x > width){
    location.x=0;
    }
    else if (location.x < 0){
    location.x=width;
    }
    ///////////Y Axis
    if (location.y > height){
    location.y = 0;
    }
  }
}
