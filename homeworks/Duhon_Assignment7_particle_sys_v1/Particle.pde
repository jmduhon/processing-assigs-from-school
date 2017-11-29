class Particle()
{
  float x, y;
  float vx, vy;
  float radius;
  float gravity = 0,1;
  
  ///Constructor
  Particle(int xpos, int ypos, float velx, float vely, float r)
  {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }
  
  void update()
  {
    vy += gravity;
    y += vy;
    x += vx;
  }
  
  void display()
  {
    ellipse(x, y, radius*2, radius*2);
  }
}
