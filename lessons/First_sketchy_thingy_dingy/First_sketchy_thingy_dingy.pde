//set size of window
size(900,900);
//anti-aliasing
smooth();
//set background black
background(0);

//get rid of lines to make code more sensible
fill(74,59,137);//make rectangle purple
rect(150,300,600,300);

//Triangles
stroke(150);//make line of triangles grey
strokeWeight(6);//make pines 6 pixels big
fill(255);
triangle(150,150,750,150,450,300);
triangle(150,750, 750,750,450,600);

//ellipse
stroke(0);//make circle straoke black
strokeWeight(40);//stroke weight of 6 pixels
noFill();//make circle transparent
ellipse(450,450,100,100);

