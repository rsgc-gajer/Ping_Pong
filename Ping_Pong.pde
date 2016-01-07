// Name - Ryan Gajer
// Purpose - To make ping pong for Computer Science course

// Defined Variables
int x; // x position of ball
int y; // y position of ball
int w; // width of ball
int h; // height of ball
int speedX; // x speed of ball
int speedY; // y speed of ball

int paddleX; // first paddle x position
int paddleY; // first paddle y position 
int paddleW; // first paddle width
int paddleH; // first paddle height
int paddleS; // first paddle speed

boolean up, down;

void setup() {
  size(800, 600);

  x = width/2; // place x position of ball in middle of screen
  y = height/2; // place y position of ball in middle of screen
  w = 50; // ball width 
  h = 50; // ball height
  speedX = 3; // x speed of ball
  speedY = 4; // y speed of ball

  // left paddle
  rectMode(CENTER); // center the rectangle
  paddleX = 40;
  paddleY = height/2;
  paddleW = 30;
  paddleH = 100;
  paddleS = 5;
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

  // draw the first paddle
  fill(255);
  rect(paddleX, paddleY, paddleW, paddleH);
  
  // restrict paddle from leaving the board
  if (paddleY - paddleH < 0) { // prevent paddle y from leaving top of screen
    paddleY = paddleY + paddleS;
  } else if (paddleY + paddleH > height) { // prevent paddle y from leaving bottom of screen
    paddleY = paddleY - paddleS;
  }
  
  // contact of paddle and ball
  
  // this code implements the physics of the hit detection, without the /2 the ball doesn't deflect off the paddle
  if (x - w/2 < paddleX + paddleW/2 && y - y/2 < paddleY - paddleW/2 && y + h/2 > paddleY - paddleH/2) {
    speedX = -speedX;
  } 
  
  // move the paddle with if statement
  
  // + is down and - is up
  if(up) {
    paddleY = paddleY - paddleS; // move the paddle upwards
  } else if (down) {
    paddleY = paddleY + paddleS; // move the paddle downwards 
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    up = true; // move the paddle up if key 'w' is pressed
  } else if (key == 's' || key == 'S') {
    down = true; // move paddle down if key 's' is pressed
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    up = false; 
  } else if (key == 's' || key == 'S') {
    down = false;
  }
}