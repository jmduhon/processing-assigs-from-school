float val = 0;

void setup()
{
  size(600,400);
}

void draw()
{
  background(random(0,150), random(75,100), random(150,255));
  fill(255,0,0);
  noStroke();
  ellipse((cos(val)*60)+ width / 2, (sin(val)*60)+ height / 2, 60, 60);
  ellipse((sin(val)*90)+ width / 3.5, (cos(val)*90)+ height / 2, 60, 60);
  ellipse((sin(val)*30)+ width / 1.5, (cos(val)*30)+ height / 2, 60, 60);
  val = val + 0.1;
}
