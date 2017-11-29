//import processing.opengl.*
//built on particle engine of Flexiline by Xiaohan Zhang

float[] x;
float[] y;
float[] dx;
float[] dy;
int num = 1500;
int a;
float ang;
float pow = 1;
//static final int sWidth = 500,
//sHeight = 500;, inset = 100;
//PGraphics colorArray;

static final color white = 0xFFFFFFFF, black = 0xFF000000;
//color c0 = color(255, 255, 255), c1 = color(0, 0, 0), cCurrent = c0;
//float lerp = 0;

//void initColorArray() {
// 
//}

void setup() {
 // noCursor();
  //  size(sWidth, sHeight+inset);
  //size(displayWidth, displayHeight,OPENGL);
  noSmooth();
  size(720, 450, OPENGL);
  //  initColorArray();
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  for ( a = 0; a < num; a++) {
    int b = a % 2;
    if (b == 0)
      x[a] = a*float(width)/num;
    else
      x[a] = width-a*float(width)/num;
    y[a] = height/2;
  }
  background(0);
}


void mousePressed() {
  if (mouseButton == CENTER)
    setup();
}

void draw() {
  background(0);
  stroke(50);
  strokeWeight(5);
  //line(mouseX,0,mouseX,height);
  /*int n = (int)random(num);
   int m = (int)random(num);
   line(x[n],y[n],x[m],y[m]);*/
  if (mouseX > 0 & mouseX < width & mouseY > 0 & mouseY < height) {
    if (mousePressed & mouseButton != CENTER) {
      float k = pow;
      if (mouseButton == LEFT) k *= pow;
      else if (mouseButton == RIGHT) k *= pow;
      for (a = 0; a < num; a++) {
        ang = atan2((height/2)-y[a], (width/2)-x[a]);
        if (mouseButton == LEFT) ang += .2;
        if (mouseButton == RIGHT) ang -= .2;
        dx[a] += k*cos(ang);
        dy[a] += k*sin(ang);
      }
    }
  }
  //loadPixels();
  //uncolor your previous places
  /*for(a = 0; a < num; a++) {
   setAt(x[a], y[a], black);
   }*/
  //color new places
  for (a = 0; a < num; a++) {
    x[a] += dx[a] *= .98;
    y[a] += dy[a] *= .98;
    float s = (float)Math.sqrt(dx[a]*dx[a]+dy[a]*dy[a])/10;
    //setAt(x[a], y[a], color(125,255*s,255*s));
    //float s = map(a,0,num,0,255);
    //setAt(x[a], y[a], color(125,s,s));

    //COLOR CONTROLS
    stroke(color(220, 230*s, 80*s));
    //stroke(color(230*s,80*s,220));
    //WEIGHT CONTROLS
    strokeWeight(s*(map(mouseX, 0, 3000, 1, 50))+1);

    line(x[a]+dx[a]*s*3, y[a]+dy[a]*s*3, x[a]-dx[a]*s*3, y[a]-dy[a]*s*3);
  }
  //updatePixels();
  stroke(white);
  //  line(0, sHeight, sWidth, sHeight);
  //  line(sWidth / 2, sHeight, sWidth/2, height);
  //  showColorArray(0, sHeight, width/2, inset);
}

void keyPressed() {
  if (key == ' ') {
    for (a = 0; a < num; a++) {
      dx[a] = dy[a] = 0;
    }
  } else if (key == 'r') {
    setup();
  }
} 

//void showColorArray(int x, int y, int w, int h) {
//}

void setAt(int x, int y, int c) {
  if (x < 0 | x > width-1 | y < 0 | y > height-1) return;
  pixels[y*width+x] = c;
}

void setAt(float x, float y, int c) {
  setAt(int(x), int(y), c);
}
