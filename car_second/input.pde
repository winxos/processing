int scores=0;
String name;
String name_s="";
void save_score( String name, int score)
{
  xml=loadXML("score.xml");
  XML[] childs=xml.getChildren("highscore");
  int i;
  for (i=0;i<childs.length;i++)
  {
    int t=childs[childs.length-1-i].getInt("value");
    if (t>=score)break;
  }  
  if (i>0)
  {
    for (int j=1;j<i;j++) {
      childs[childs.length-j].setInt("value", childs[childs.length-j-1].getInt("value"));
      childs[childs.length-j].setString("name", childs[childs.length-j-1].getString("name"));
    }
    childs[childs.length-i].setInt("value", score);
    childs[childs.length-i].setString("name", name);
    saveXML(xml, "data/score.xml");
  }
}
String name_t;
int delay_t=0;
void inputname() {
  textSize(50);
  fill(255, 255, 50);
  text("HIGH SCORES", zwidth/2-160, zheight/2-40);
  textSize(24);
  fill(255, 200, 200);
  text("please input your name:", zwidth/2-120, zheight/2+40);
  fill(100, 120, 120, 50);
  rect(zwidth/2, zheight/2, zwidth*.8, zheight*.5);
  fill(255);
  rect(zwidth/2, zheight/2+100, zwidth*.5, zheight*0.07);
  fill(0);
  textSize(36);
  name_t=name_s+'_';
  if (delay_t<30)
    text(name_t, zwidth/2-80, zheight/2+110);
  else
    text(name_s, zwidth/2-80, zheight/2+110);
  delay_t++;
  if (delay_t>60)delay_t=0;
}

