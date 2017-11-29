//variables
int snow = 20000;
float windScale = 0.15;
float gravScale = .5
;

float t;

//creating Mover Objects
Mover[] m = new Mover[snow];

void setup()
{
  size(1300,900);
  //populating array
  for (int i = 0; i < snow; i++){
    m[i] = new Mover();
  }
  
}

void draw()
{
  background(255);
  ///adding forces here
  PVector grav = new PVector(0,(noise(t)*gravScale));//downward gravity
  PVector wind1 = new PVector(norm(mouseX,0,width)*windScale,0);//wind
  PVector wind2 = new PVector(-norm(mouseY,0,width)*windScale,0);//wind
  //applying methods to array members
  for(int i = 0; i < snow; i++){
    m[i].update();
    m[i].applyForce(grav);
    if (mousePressed){
    m[i].applyForce(wind1);
    }
    if (mousePressed){
    m[i].applyForce(wind2);
    }
    m[i].display();
    m[i].bringUp();
  }
  
  t += .01;
}
