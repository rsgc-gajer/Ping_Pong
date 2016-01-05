// Name - Ryan Gajer
// Purpose - To make ping pong for Computer Science course

// Defined Variables
int x;
int y;
int w;
int h;


void setup() {
  size(500, 500);
  background(0); // black background
  
  x = width/2;
  y = height/2;
  w = 50;
  h = 50;
}

void draw() {
  fill(255);
  ellipse(x, y, w, h);
  
  x = x + 1;
}