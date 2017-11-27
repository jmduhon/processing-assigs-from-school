int numberFrames = 60;
EggRing er1, er2;


void setup() {
  size(640, 360);
  er1 = new EggRing(width*0.45, height*0.5, 0.1, 120);
  er2 = new EggRing(width*0.65, height*0.8, 0.05, 180);
}


void draw() {
  background(0);
  er1.transmit();
  er2.transmit();
  if (frameCount<=numberFrames) saveFrame("image-###.gif");

}

