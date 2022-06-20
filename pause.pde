void pause(){
  
  image(gif[f], 0, 0, width, height);
  println(frameCount);
  if (frameCount%3==0) f=f+1;
  if (f==nof)f=0;
  textSize(100);
  text("PAUSE",400,400);
     
}

void pauseClicks(){
  mode=GAME;
}
