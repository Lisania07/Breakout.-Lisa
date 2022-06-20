void intro() {

  image(gif[f], 0, 0, width, height);
  println(frameCount);
  if (frameCount%3==0) f=f+1;
  if (f==nof)f=0;
  fill(yellow);
  textFont(HAHA,5);
  textSize(130);
  text("Breakout",400,400);
}



void introClicks() {
mode=GAME;
}
