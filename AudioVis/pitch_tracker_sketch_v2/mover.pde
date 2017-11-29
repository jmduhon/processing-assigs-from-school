class Mover
{
  //PVectors
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  
  //constructor
  Mover()
  {
    location = new PVector(0, 0);
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
    //location.set(0, freq);
    acceleration.mult(0);
  }
  //display function
  void display()
  {
    smooth();
    fill(255,0,0);
    ///shapes
    for(int i = 25; i < (width); i +=(width/10)){
    ellipse(i, (freq*height), 40, 40);
    }
  }
  
  void bounce()
  {
    if (location.y > height)
    {
      location.y = 250;
      freq = -10;
    }
    else if (location.y <0)
    {
      location.y = 0;
      freq = 10;
    }
  }
}










