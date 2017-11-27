class Herp
{
  //variables
  PVector location1;
  PVector location2;
  PVector location3;
  
  //constructor
  Herp()
  {
    //random location bidness
    location1 = new PVector(random(0, width), random(0, height));
    location2 = new PVector(random(0, width), random(0, height));
    location3 = new PVector(random(0, width), random(0, height));

  }
  
  
  
  void display()
  {
    strokeWeight(4);
    fill(random(200,255),random(0,50),random(0,255));
    triangle(random(1,2)*location1.x,random(1,2)*location1.y,random(1,2)*location2.x,random(1,2)*location2.y,random(1,2)*location3.x,random(1,2)*location3.y);
  }
}
