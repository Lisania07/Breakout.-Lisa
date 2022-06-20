void game() {
  background(brown);

  //paddles
  circle(paddlex, paddley, paddled);

  //balls

  circle(bx, by, bd);

  //move paddles
  if (paddlex<paddled/2) {
    paddlex=paddled/2;
  }
  if (paddlex>width-paddled/2) {
    paddlex=width-paddled/2;
  }

  if (akey==true)paddlex=paddlex-5;
  if (dkey==true)paddlex=paddlex+5;

  //move ball
  bx=bx+vx;
  by=by+vy;

  //bouncing
  if (by<=bd/2) {
    by=bd/2;
    vy=vy*-1;
  }//bouncing off the top
  if (by>=height-bd/2) {
    by=height-bd/2;
    vy=vy*-1;
    life=life-1;
  }//bouncing off the bottom

  if (bx<=bd/2) {
    bx=bd/2;
    vx=vx*-1;
  }//bouncing of left
  if (bx>=width-bd/2) {
    bx=width-bd/2;
    vx=vx*-1;
  }//bouncing the right
  if (dist(bx, by, paddlex, paddley)<bd/2+paddled/2) {
    vx=(bx-paddlex)/10;
    vy=(by-paddley)/10;
  }//ball cllision with paddle

  //bricks--------------------------------------

  int i=0;
  while (i<n) {
    if (alive[i]==true) {
      manageBrick(i);
    }
    i=i+1;
  }

  //scoreboard
  textSize(35);
  text("Score:"+score, 75, 780);
  text("Life:"+life, 725, 780);

  if (life==0||score==60) {
    mode=GAMEOVER;
  }
}

void manageBrick(int i) {

  if (y[i]==100)fill(darkgreen);
  if (y[i]==300)fill(green);
  if (y[i]==500)fill(yellowgreen);
  if (y[i]==700)fill(yellow);
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i])<bd/2+brickd/2) {
    vx=(bx-x[i])/5;
    vy=(by-y[i])/5;
    alive[i]=false;
    score++;
  }
}

void gameClicks() {
  mode=PAUSE;
}
