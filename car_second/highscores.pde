int index_c=100;
int d=1;
void highscores() {
  clear();
  fill(50, 150, 100, 10);
  rect(zwidth/2, zheight/2, 360, 360);
  XML[]children=xml.getChildren("highscore");
  fill(index_c, 0, (int)random(10, 200));
  index_c+=d;
  if(index_c>400 || index_c<50) d=-d;
  textSize(48);
  pushMatrix();
  translate(200, 10+index_c);
  rotate(0.1-random(PI)*0.05);
  text("High Scores",-100+random(3), 0);
  popMatrix();
  textSize(24);
  fill(0,255,255,100);
  text("rank    name       score", 50, 250);
  fill(255);
  textSize(24); 
  for (int i=0;i<children.length;i++) 
  {
    int id=children[i].getInt("id");
    String name=children[i].getString("name");
    int value=children[i].getInt("value");
    text(id+1, 50, 280+i*30);
    text(name, 120, 280+i*30);
    text(value, 220, 280+i*30);
  }
}

