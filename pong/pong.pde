/*

Harry Sadleir Pong project. February 1st 2018

Welcome to my project and thanks for playing!

Controls:

  Pause: spacebar

  Player 1
    -W and S to move up and down
    -D to use special
    
  Player 2
    -UP and DOWN to move up and down (duh)
    -LEFT to use special


sound effects and png images --- royalty free sources
music credit                 --- bit8music on youtube: Metallica - Master of the
                                    Puppets 8-bit

*/




import ddf.minim.*;

Minim minim;
AudioPlayer bounce;
AudioPlayer die;
AudioPlayer end;
AudioPlayer pup1;
AudioPlayer pup2;
AudioPlayer pup3;
AudioPlayer start;
AudioPlayer playAgain;
AudioPlayer pause;
AudioPlayer music;

int mode = 0;

float rx = 45;
float x=400, y = 300;
float vx = 4, vy = 0;

float p1y = 300, p2y = 300;
float p1m, p2m;
float p1v = 7, p2v = 7;
float p1size = 75, p2size = 75;
color p1c = color(255), p2c = color(255);

int p1Score = 0, p2Score = 0;

int p1s = 1, p2s = 1;
float p1r = 1, p2r = 1; 
boolean p1SPEED, p1BOUNCE, p1CURVE, p2SPEED, p2BOUNCE, p2CURVE;
boolean notp1CURVE; //just for making the background flash work
boolean p1wins;

PImage CURVE;
PImage BOUNCE;
PImage SPEED;

boolean w, a, s, d, up, left, right, down;

int respawnCount = 120;

void setup() {
  size(800, 600);
  imageMode(CENTER);
  CURVE = loadImage("CURVE.png");
  BOUNCE = loadImage("BOUNCE.png");
  SPEED = loadImage("SPEED.png");
  
  minim = new Minim(this);
  bounce = minim.loadFile("Beep2.wav");
  die = minim.loadFile("Emerge6.wav");
  end = minim.loadFile("Explosion5.wav");
  pup1 = minim.loadFile("Power_Up1.wav");
  pup2 = minim.loadFile("Power_Up2.wav");
  pup3 = minim.loadFile("Power_Up3.wav");
  start = minim.loadFile("Space_Alert3.wav");
  playAgain = minim.loadFile("Danger2.wav");
  pause = minim.loadFile("Beep17.wav");
  music = minim.loadFile("music.mp3");
}

void draw() {
  background(0);

  if (mode == 0) intro(); 
  if (mode == 1) playing();
  if (mode == 2) pause();
  if (mode == 3) gameOver();
}

void keyPressed() {
  if (key == 'w')           w = true;
  if (key == 'a')           a = true;
  if (key == 's')           s = true;
  if (key == 'd')           d = true;
  if (keyCode == UP)       up = true;
  if (keyCode == LEFT)   left = true;
  if (keyCode == RIGHT) right = true;
  if (keyCode == DOWN)   down = true; 

  float pauseTime = 0;
  if (pauseTime > 0) {
    pauseTime = pauseTime - .5;
  }
  if (key == ' ' && mode == 1 && pauseTime == 0) {
    mode = 2; 
    pauseTime = 60;
    pause.rewind();
    pause.play();
  }
  if (key == ' ' && mode == 2 && pauseTime == 0) {
    mode = 1;
    pauseTime = 60;
    pause.rewind();
    pause.play();
  }
}

void keyReleased() {
  if (key == 'w')           w = false;
  if (key == 'a')           a = false;
  if (key == 's')           s = false;
  if (key == 'd')           d = false;
  if (keyCode == UP)       up = false;
  if (keyCode == LEFT)   left = false;
  if (keyCode == RIGHT) right = false;
  if (keyCode == DOWN)   down = false;
}