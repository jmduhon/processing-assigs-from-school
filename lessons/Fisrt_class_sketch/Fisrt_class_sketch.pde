//making arrays
int num = 20;
int[] dx = new int[num];
int[] dy = new int[num];



void setup()
{
  size(300, 250);
  for(int i = 0; i < num; i++)
  {
    dx[i] = i * 5;
    dy[i] = 12 + (i * 6);
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < num; i++)
  {
    dx[i] = dx[i]+1;
    if(dx[i] > width)
    {
      dx[i] = -100;
    }
  }
  lines(dx[i], dy[i]);
}

//declaring function
/*void lines( int x, int y)
{
  
}*/







