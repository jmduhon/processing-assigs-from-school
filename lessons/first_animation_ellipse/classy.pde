class DrunkEllipse
{
  //variables
 float x;
 float y;
 int diameter;
 float speed = 0.5;
 
 //constructor
 DrunkEllipse(float tempX, float tempY, int tempDiameter)
 {
   x = tempX;
   y = tempY;
   diameter = tempDiameter;
 }
  //methods
  void move()
  {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  
  void display()
  {
    ellipse(x,y,diameter,diameter);
  }
}

