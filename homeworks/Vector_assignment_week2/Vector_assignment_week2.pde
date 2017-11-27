int numb = 60; //number of objects in arrays
int noom = 20; // number of triangles
//Declaring Objects
Derp[] derpies = new Derp[numb];
Herp[] herpies = new Herp[noom];

void setup()
{
  size(600,800);
  for (int i = 0; i < numb; i++)
  {
    derpies[i] = new Derp();
  }
  for (int w = 0; w < noom; w++)
  {
    herpies[w] = new Herp();
  }
}

void draw()
{
  background(255);
  if(mousePressed)
  {
    //moving triangles
    for(int e = 0; e<noom;e++)
    {
    herpies[e].display();
    }
    //derpies bidness
    for (int i = 0; i < numb; i++)
  {
    derpies[i].update();
    derpies[i].display();
    // Nested for loop to do hit test
    for(int j = 0; j < numb; j++)
    {
      // Make sure we aren't checking a mover's
      // location against itself
      if( i != j)
      {
        derpies[i].hitTest(derpies[j]);
      }
    }
  }
  /////Text Stuff
  
  String s2 = "CHAOS REIGNS!";
  fill(random(0,255),random(0,150),random(0,150));
  textSize(80);
  text(s2, 0, height/4, width/0.5, height/2);
  }
  else
  {
    String q = "please don't click me";
    fill(0);
    textSize(48);
    text(q, width/11, height/4, width/1.2, height/2);
    
  }
}
