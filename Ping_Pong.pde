// Name - Ryan Gajer
// Purpose - To make ping pong for Computer Science course

// Defined Variables
int x; // x position of ball
int y; // y position of ball
int w; // width of ball
int h; // height of ball
int speedX; // x speed of ball
int speedY; // y speed of ball


void setup() {
  size(500, 500);

  x = width/2;
  y = height/2;
  w = 50;
  h = 50;
  speedX = 2;
  speedY = 3;
}

void draw() {
  background(0);
  fill(255);
  ellipse(x, y, w, h);

  if ( x > width - w/2) {
    speedX = -speedX;
  } else if ( x < 0 + w/2) {
    speedX = -speedX;
  } else if ( y > height - h/2) {
    speedY = -speedY;
  } else if ( y < 0 + h/2) {
    speedY = -speedY;
  }
  
  x = x + speedX; // x speed of ball
  y = y + speedY; // y speed of ball
}