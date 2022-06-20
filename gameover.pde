void gameover() {
  image(gif[f], 0, 0, width, height);
  println(frameCount);
  if (frameCount%3==0) f=f+1;
  if (f==nof)f=0;
  textSize(100);
  textAlign(CENTER, CENTER);
  if (life==0) {
    text("YOU LOSE!", 400, 400);
  }

  if (score==60) {
    text("YOU WIN!", 400, 400);
  }
}

void gameoverClicks() {
  if (life==0) {
    mode=INTRO;
  }
  if (score==60) {
    mode=INTRO;
  }
}
