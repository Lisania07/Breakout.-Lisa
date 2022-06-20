//Breakout
//Lisa Dai

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


color brown=#49423D;
color darkgreen=#40866A;
color green=#879D6F;
color yellowgreen=#BCB77B;
color yellow=#F1D186;

//brick variable
int []x;//each page can store an X
int []y;
boolean[]alive;
int brickd;
int n, u;
int tempx, tempy;


//mode framework
int mode;
final int INTRO=1;
final int GAME=2;
final int PAUSE=3;
final int GAMEOVER=4;

//entity variables
float paddlex, paddley, paddled;
float bx, by, bd;
float vy, vx;

//key variables
boolean akey, dkey;

//score,life
int score, life;

PImage[]gif;
int nof;
int f;

//font
PFont HAHA;


void setup() {
  textAlign(CENTER,CENTER);
  size(800, 800);
  brickd=50;
  n=60;
  x=new int[n];//tell us how many int we want in an array list
  y=new int[n];
  alive=new boolean[n];

  tempx=85;
  tempy=100;
  int i=0;
  while (i<n) {

    x[i]=tempx;
    y[i]=tempy;
    alive[i]=true;
    tempx=tempx+70;
    if (tempx==785) {
      tempx=85;
      tempy=tempy+100;
    }
    i=i+1;
  }

  mode=INTRO;
  ;

  //initialize paddle
  paddlex=width/2;
  paddley=height;
  paddled=200;

  //initialize ball
  bx=width/2;
  by=height/3*2;
  bd=15;
  vx=random(-2, 2);
  vy=random(2, 4);

  //initialize keyboard variables
  akey=dkey=false;

  //gif----------------------------
  nof=5;
  gif= new PImage[nof];

  int u=0;
  while (u<nof) {
    gif[u]=loadImage("frame_"+u+"_delay-0.06s.gif");

    u=u+1;
  }

  //score,life
  score=0;
  life=3;
  //font
  HAHA=createFont("Mabook",50);

  reset();
}

void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode==PAUSE) {
    pause();
  } else if (mode==GAMEOVER) {
    gameover();
  } else {
    println("Mode error:"+mode);
  }
}
