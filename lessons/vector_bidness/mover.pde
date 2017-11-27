class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  int radius;
  
  //constructor
  Mover()
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-.001, .01);
    radius = 30;
  }
  
  //update function
  void update()
  {
    location.add(velocity);
    velocity.add(acceleration);
  }
  
  //display function
  void display()
  {
    stroke(0);
    fill(0,255,0);
    ellipse(location.x, location.y,radius,radius);
  }
  
  //check edges function
  void checkEdges()
  {
    if(location.x > width+radius)
    {
      location.x = -radius;
    }
    else if(location.x
  }
  
  
}
