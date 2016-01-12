// Name - Ryan Gajer
// Purpose - To make ping pong for Computer Science course

// interesting note - can't add variables to fist paddle because program doesn't work


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

int paddleX2; // second paddle X position
int paddleY2; // second paddle Y position

boolean up, down; // up and down of first paddle
boolean up2, down2; // up and down of second paddle

int score = 0; // track the first score
int score1 = 0; // track the second paddle score

final int p = keyCode; // final variable for pausing the game

boolean gameOn, help; // makes the game begin and creates a starting screen and creates help screen


void setup() {
  size(800, 600);

  x = width/2; // place x position of ball in middle of screen
  y = height/2; // place y position of ball in middle of screen
  w = 50; // ball width 
  h = 50; // ball height
  speedX = 5; // x speed of ball
  speedY = 6; // y speed of ball

  // left paddle
  rectMode(CENTER); // center the rectangle
  paddleX = 40;
  paddleY = height/2;
  paddleW = 30;
  paddleH = 100;
  paddleS = 5;

  paddleX2 = width-40;
  paddleY2 = height/2;
}

void draw() {
  if (gameOn == true) {
    noStroke();
    frameRate(60);
    background(0);

    // draw rect in middle
    fill(255);
    rect(width/2, height, 5, 1250);

    // draw the ball 
    fill(255, 0, 0);
    ellipse(x, y, w, h);

    // score
    textSize(20);
    fill(255);
    text(score, 100, 50);
    text(score1, width-100, 50);


    if ( x > width - w/2) { // send ball left if it hits right edge
      score++;
      setup(); // retsrat the paddle and the ball
      speedX = -speedX;
    } else if ( x < 0 + w/2) { // send ball right if it hits left edge
      score1++;
      setup(); // restart the paddle and the ball
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
    fill(0, 255, 0);
    rect(paddleX2, paddleY2, paddleW, paddleH);

    // restrict paddle from leaving the board
    if (paddleY - paddleH < 0) { // prevent paddle y from leaving top of screen
      paddleY = paddleY + paddleS;
    } else if (paddleY + paddleH > height) { // prevent paddle y from leaving bottom of screen
      paddleY = paddleY - paddleS;
    } else if (paddleY2 - paddleH < 0) { // prevent paddle y2 from leaving top of screen
      paddleY2 = paddleY2 + paddleS;
    } else if (paddleY2 + paddleH > height) { // prevent paddle y2 from leaving bottom of screen
      paddleY2 = paddleY2 - paddleS;
    }


    // contact of paddle and ball

    // this code implements the physics of the hit detection, without the /2 the ball doesn't deflect off the paddle
    if (x - w/2 < paddleX + paddleW/2 && y - h/2 < paddleY + paddleH/2 && y + h/2 > paddleY - paddleH/2) {
      if (speedX < 0) {
        speedX = -speedX;
      }
    } else  if (x + w/2 > paddleX2 - paddleW/2 && y - h/2 < paddleY2 + paddleH/2 && y + h/2 > paddleY2 - paddleH/2) {
      if ( speedX > 0) {
      }
      speedX = -speedX;
    } 

    // move the paddle with if statement

    // + is down and - is up
    if (up) {
      paddleY = paddleY - paddleS; // move the paddle upwards
    } else if (down) {
      paddleY = paddleY + paddleS; // move the paddle downwards
    }
    if (up2) {
      paddleY2 = paddleY2 - paddleS; // move the paddle upwards
    } else if (down2) {
      paddleY2 = paddleY2 + paddleS; // move the paddle downwards
    } else if (gameOn == false && help == true) {
      background(0);
    }
  } else if (gameOn == false) {
    background(0); // make the black for the starting screen
    textSize(50); 
    text("Ping Pong", 280, 250);
    textSize(25);
    text("By: Ryan Gajer", 310, 350); 
    text("Click Space to Begin", 280, 400);
    text("Help", 375, 450);
    stroke(255);
    strokeWeight(3);
    rect(402, 440, 75, 50);
    noFill();

    // draw the mouse for rectangle
    if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
      cursor(CROSS);
    }
  } 
  if (help == true) {
    background(0);
    text("Test", 250, 500);
    stroke(255);
    strokeWeight(3);
    rect(75, 550, 100, 40);
    noFill();
  }
}
void mousePressed() {
  if ( mouseX > 402 && mouseX < 477 && mouseY > 440 && mouseY < 490) {
    help = true;
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    up = true; // move the paddle up if key 'w' is pressed
  } else if (key == 's' || key == 'S') {
    down = true; // move paddle down if key 's' is pressed
  } else   if (keyCode == UP) {  // move the paddle up if key 'up' is pressed
    up2 = true;
  } else if (keyCode == DOWN) { // move the paddle up if key 'down' is pressed
    down2 = true;
  } else if (key == 'p' || key == 'P') {
    if (looping) noLoop(); // saying if the program is running stop it
    else loop(); // if p is hit again, program will run
  } else if ( key == ' ') {
    gameOn = true; // if space key is hit, start the game
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') { 
    up = false;
  } else if (key == 's' || key == 'S') { 
    down = false;
  } else   if (keyCode == UP) { 
    up2 = false;
  } else if (keyCode == DOWN) { 
    down2 = false;
  }
}