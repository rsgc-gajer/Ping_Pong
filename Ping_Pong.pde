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

  x = width/2; // place x position of ball in middle of screen
  y = height/2; // place y position of ball in middle of screen
  w = 50; // ball width 
  h = 50; // ball height
  speedX = 3; // x speed of ball
  speedY = 4; // y speed of ball
}

void draw() {
  background(0);
  fill(0, 255, 0);
  ellipse(x, y, w, h);

  if ( x > width - w/2) { // send ball left if it hits right edge
    speedX = -speedX;
  } else if ( x < 0 + w/2) { // send ball right if it hits left edge
    speedX = -speedX;
  } else if ( y > height - h/2) { // send ball down if it hits top edge
    speedY = -speedY;
  } else if ( y < 0 + h/2) { // send ball up if it hits bottom edge
    speedY = -speedY;
  }
  
  x = x + speedX; // x speed of ball
  y = y + speedY; // y speed of ball
}