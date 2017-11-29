class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  int topSpeed;
  int r, g, b;


  Mover()
  {
    location = new PVector(30, 30);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 10);
    //topSpeed = 10;
    r = b = 0;
    g = 255;
  }
  
  Mover(float m, float x, float y, float vx, float vy)
  {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0, 0);
    r = g = b = 100;
  }

  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    bounce();
  }

  void display()
  {
    stroke(0);
    fill(r, g, b, 100);
    ellipse(location.x, location.y, mass*3, mass*3);
  }

  void checkEdges()
  {
    if (location.x > width+mass)
    {
      location.x = -mass;
    }
    else if (location.x < -mass)
    {
      location.x = width+mass;
    }
    if (location.y > height+mass)
    {
      location.y = -mass;
    }
    else if (location.y < -mass)
    {
      location.y = height+mass;
    }
  }
  
  void bounce()
  {
    if (location.x > width) 
    {
      velocity.x *= -1;
    } 
    else if (location.x < 0) 
    {
      velocity.x *= -1;
    }
    if (location.y > height) 
    {
      velocity.y *= -1;
    }
    else if( location.y < 0)
    {
      velocity.y *= -1;
    }
    
  }

  void hitTest(Mover v)
  {
    if (location.dist(v.location) < mass)
    {
      velocity.mult(-1);
      r = int(random(0, 255));
      g = int(random(0, 255));
      b = int(random(0, 255));
    }
  }
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
}

