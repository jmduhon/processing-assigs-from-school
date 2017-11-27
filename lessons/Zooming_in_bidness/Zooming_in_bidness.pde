float[] pos = new float[50];
void setup(){
  size(600,600, P3D);
  for(int i = 0; i < pos.length; i++){
    pos[i] = -100*i;
  }
  noFill();
}
void draw(){
  background(92);
  for(int i = 0; i < pos.length; i++){
    pushMatrix();

    rotateY(map(mouseX, 0, width, -PI/4f, PI/4f));
    rotateX(map(mouseY, 0, height, PI/4f, -PI/4f));
    translate(0, 0, pos[i]);
    rect(0, 0, 600, 600);
    //ellipse(300, 300, 600, 600);
    popMatrix();
    if(pos[i] > 500){
      pos[i] = -100*pos.length+500;
    }
    else{
      pos[i] += 4;
    }
  }
}
void mouseWheel(MouseEvent event) {
  float wheel = event.getAmount();
  for(int i = 0; i < pos.length; i++){
    if (wheel==1) pos[i] -= 20;
    else if (wheel==-1)pos[i] += 20;
  }
}
