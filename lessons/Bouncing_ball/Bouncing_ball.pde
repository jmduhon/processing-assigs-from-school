float x = 200;
float y = 300;
float speedx = 4;
float speedy = 2;

void setup()
{
  size(600,400);
}

void draw()
{
  background(255);
  fill(0);
  ellipse(x,y,20,20);
  
  x += speedx;
  y += speedy;
  
  if (x>width || x<0)
  {
    speedx = -speedx;
  }
  if (y>height || y<0)
  {
    speedy = -speedy;
  }
}
