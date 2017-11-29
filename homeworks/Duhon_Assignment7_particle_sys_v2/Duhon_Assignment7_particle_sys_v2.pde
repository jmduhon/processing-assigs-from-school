int num = 1000;
arrowParticle particleController;
float radius = 1.2;

void setup()
{
  size (1000, 1000);
  particleController = new arrowParticle();
}


void update()
{
  if (mousePressed) 
  {
    PVector m = new PVector(mouseX, mouseY);
    particleController.addParticles(5, m);
  }
  particleController.update();
  particleController.draw();
}

void draw()
{
  background(0);
  noCursor(); 
  update();
}
