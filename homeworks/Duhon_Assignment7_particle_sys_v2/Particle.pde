
class Particle {
  PVector loc;     
  PVector vel;   
  float decay;  
  float angle;
  int age;       
  int lifeSpan;   
  boolean isDead;
  float colorScale = norm(mouseX, 0, width);

  Particle(PVector l) {
    loc = l;
    vel = new PVector(random(-1, 1), random(-1, 1));  
    decay = 0.5;                                     
    age = 0;                                          
    lifeSpan = (int)random(50, 450);                  
    isDead = false;           
  }

  void update() {
    age++;       
    loc.add(vel); 
    angle = atan2(vel.x, vel.x);
    // check if the age is greater than it's life span, OR if particle is offscreen
    if (age > lifeSpan){
      isDead = true; 
    }
    /////make boundary condition
 
    if(loc.x > width){
      loc.x = 0;
    }
    else if(loc.y > height){
      loc.y =0;
    }
    else if(loc.x < 0){
       loc.x = width;
    }
    else if(loc.y < 0){
      loc.y = height;
    }
  }
  
  void draw()
  {
    stroke((colorScale*255), random(50,150), (colorScale*255));
    pushMatrix();
    translate(150.0, mouseY);
    rotate(angle);
    ///Make Arrows
    line(loc.x, loc.y, loc.x+15, loc.y+15);
    line(loc.x, loc.y, loc.x+5, loc.y);
    line(loc.x, loc.y, loc.x, loc.y+5);
    popMatrix();
  }
}
