//THis is pretty simlar to the class example. I wanted to just screw with
//some of the parameters to make sure I knew exactly what was going on.

class Derp
{
  // Vectors for movement and junk
  PVector location;
  PVector velocity;
  PVector acceleration;
  // Radius variable
  int radius;
  // Color variables
  int r, g, b;

  // Constructor
  Derp()
  {
    // Start Locations
    location = new PVector(random(0, width), random(0, height));
    // Velocity vector
    velocity = new PVector(0, 0);
    // Acceleration Vector
    acceleration = new PVector(0, 0);
    // Radius
    radius = 30;
  }

  // Movin' and bouncin' function
  void update()
  {
    // Mousy
    PVector mouse = new PVector(mouseX, mouseY);
    // subtracting mouse vector from direction vector
    PVector direction = PVector.sub(mouse, location);
    // Scaling values
    direction.normalize();
    direction.mult(.2);
    // Acceleration is direction vector
    acceleration = direction; 

    // Adding our physics vectors to make movement
    location.add(velocity);
    velocity.add(acceleration); 
    // Bouncy function
    checkEdges();
  }

  // Drawing our ellipses
  void display()
  {
    stroke(0);
    strokeWeight(1);
    fill(r, g, b);
    //make the height and width of elipses a bit more random
    ellipse(location.x, location.y, random(1,2)*radius, random(1,2)*radius);
  }

  //The boundary detection function that Collin Wrote.
  //I wrote and rewrote this thing in order to understand it.
  void checkEdges()
  {
    if (location.x > width+radius)
    {
      location.x = -radius;
    }
    else if (location.x < -radius)
    {
      location.x = width+radius;
    }
    if (location.y > height+radius)
    {
      location.y = -radius;
    }
    else if (location.y < -radius)
    {
      location.y = height+radius;
    }
  }

  // Hit test function Colin wrote
  //still getting the hang of vector math in processing.
  void hitTest(Derp v)
  {
    if (location.dist(v.location) < radius)
    {
      velocity.mult(-1);
      r = int(random(0, 255));
      g = int(random(0, 255));
      b = int(random(0, 255));
    }
  }
}

