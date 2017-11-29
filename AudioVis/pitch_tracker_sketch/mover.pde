class Mover
{
  //PVectors
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  //constructor
  Mover()
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  //Adding forces function
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
    //noStroke();
    smooth();
    fill(100,0,0);
    ///shape
    ellipse(location.x, location.y, 40, 40);
  }
}









