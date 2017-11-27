//global variables
float var;
float angle = 0.0;
float offset = 300;
float scalar = 30;
float speed = 0.9;

//declaring objects
DrunkEllipse drunk;
DrunkEllipse lush;
DrunkEllipse tipsy;
DrunkEllipse bombed;

//array
int[] xpos;

//setup
void setup()
{
  size(600,600);
  smooth();
  //setting up array to draw lines
  xpos = new int[width];
  //creating object and passing in parameters
  drunk = new DrunkEllipse(width/2, height/2, 40);
  lush = new DrunkEllipse(width/4, height/4, 25);
  tipsy = new DrunkEllipse(width/1.5, height/4, 25);
  bombed = new DrunkEllipse(width/2, height/1.5, 60);

}
//draw
void draw()
{
  background(0);
  fill(#A5399A);
  noStroke();
  /////////////////first ellipse////////////////////
  ellipse(width/2, height/2 , sin(var)*150, 100);
  var += .02;
  //////////////////second ellipse//////////////////
  for(int i = 0; i <205; i+=10)
  {  
  stroke(0);
  fill(100,i/2,i+50);
  float x = offset + cos(angle)*scalar;
  float y = offset + sin(angle)*scalar;
  ellipse(x,y,40,40);
  angle += speed;
  /////////////////drawing DrunkEllipses/////////////////
  fill(50,i,i+20);
  drunk.move();
  drunk.display();
  lush.move();
  lush.display();
  tipsy.move();
  tipsy.display();
  bombed.move();
  bombed.display();
  }
  ////////////////drawing lines//////////////
  for(int v = 0; v <width; v++)
  {
    if(mousePressed)
    {
      stroke(255);
    }
    else
    {
      stroke(0);
    }
    if(v<width/2)
    {
      line(v,20,v-10,50);
    }
    else
    {
      line(v,20,v+10,50);
    }
  }
}

