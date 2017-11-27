void setup()
{
  size(600,800);
}

void draw()
{
  background(255);
  smooth();
  PVector mouse  = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
    mouse.sub(center);

  translate(width/2,height/2);

  line(0,0,mouse.x,mouse.y);
}
