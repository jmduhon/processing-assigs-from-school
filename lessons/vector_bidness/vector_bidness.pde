Mover move;

void setup()
{
  size(800,800);
  Mover move = new Mover();

}

void draw()
{
  background(255);
  move.update;
  move.display();
}
