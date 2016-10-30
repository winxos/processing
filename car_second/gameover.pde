void gameover()
{
  clear();
  background(0);
  fill(0, 255, 255, 100);
  rectMode(CENTER);
  rect(zwidth/2, zheight/2, 300, 250);
  fill(255);
  textSize(48);
  text("Game Over", zwidth/2-100, zheight/2-40);
  textSize(24);
  fill(255);
  text("your scores is :", zwidth/2-100, zheight/2+20);
  text(scores, zwidth/2+50, zheight/2+20);
  
  text("Try again to Win the Game!", zwidth/2-130, zheight/2+100);

}

