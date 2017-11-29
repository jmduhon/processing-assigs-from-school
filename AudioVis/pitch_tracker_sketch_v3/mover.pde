class Mover
{
  //PVectors
  PVector location;  
  
  //constructor
  Mover()
  {
    location = new PVector(0, 0);
  }
  //display function
  void display()
  {
    smooth();
    fill(255,0,0);
    ///shapes
    for(int i = 25; i < (width); i +=(width/10)){
    ellipse(i, (average*height), 40, 40);
    }
  }
  
  void bounce()
  {
    if (location.y > height)
    {
      location.y = 250;
    }
    else if (location.y <0)
    {
      location.y = 250;
    }
  }
}










