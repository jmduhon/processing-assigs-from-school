class Snow
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  int topSpeed;
  //color variables
  int h, s, b, a;
  //subsection variable
  float subSection;


  //constructor
  Snow()
  {
    location = new PVector(random(0,width), random(0, height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0,0);
  }
  
  //Adding forces function
  void applyForce(PVector force)
  {
    PVector f = force;
    acceleration.add(f);
  }
  //update function
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  
   //display function
  void display()
  {
     

    ///random ellipse size variables
    float n1 = random(1.0,5.0);
    float n2 = random(1.0,5.0);
    //stroke weight and color
    strokeWeight(0);
    colorMode(HSB, 360);
    fill(h,s,b,a);
    ///actual shape
    rect(location.x, location.y, rms, rms/2);
  }
  //color function
  void colorChange()
  {
    subSection = random(0.47,0.52); 
    //left side
    if (location.x < width*subSection && location.y < height){
      h= int((rms*random(0, 360))%360);
      s= int((centroid * random(0,50))%360); 
      b=int (random(250,360));
      a= 360;  
    }
    ///right side
    if (location.x > width*subSection && location.y < height){
      h=int(random(200,310));
      s=int(random(200,360));
      b=int(random(150,360));
      a=int((rms*random(0,360))%360);
    }
    subSection = subSection +0.1;
  }
  //make ellipses repopulate at top of screen or bottom of screen
  void bringUp()
  {
     ///////////bring to top of screen
    if (location.x > width){
    location.x = 0;}
    ////////////bring to bottom of screen
     ///////////Y Axis
    if (location.x < 0){
    location.x = width;}
     ///////////bring to top of screen
    if (location.y > height){
    location.y = 0;}
    ////////////bring to bottom of screen
     ///////////Y Axis
    if (location.y < 0){
    location.y = height;}
  }
}  

