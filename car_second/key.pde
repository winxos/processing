int [] keybuf=new int[7];
int cur_menu=0;
void keyPressed() {

  if (keyCode==KeyEvent.VK_LEFT) {
    keybuf[0]=1;
  }
  if (keyCode==KeyEvent.VK_RIGHT) {
    keybuf[1]=1;
  }
  if (keyCode==KeyEvent.VK_UP) {
    keybuf[2]=1;
    if (state==1)
    {
      cur_menu--;
      if (cur_menu<0) cur_menu=2;
    }
  }
  if (keyCode==KeyEvent.VK_DOWN) {
    keybuf[3]=1;
    if (state==1)
    {
      cur_menu++;
      if (cur_menu>2) cur_menu=0;
    }
  }
  if (keyCode==KeyEvent.VK_BACK_SPACE)
  {
    name_s=name_s.substring(0, max(0, name_s.length()-1));
  }
  if (keyCode==KeyEvent.VK_ENTER) {
    keybuf[4]=1;

    if (state==1)
    {
      if (cur_menu==0)state=2;
      if (cur_menu==1)
      {
        xml=loadXML("data/score.xml");
        state=4;
      }
      if (cur_menu==2)state=3;
      init_game();
    }
    else if (state==5)
    {
      println(scores);
      save_score(name_s, scores);
      xml=loadXML("data/score.xml");
      state=4;
    }
    else if (state!=2)
    {
      state=1;
    }
  }
  if (state==5) {
    if (keyCode>=KeyEvent.VK_SPACE && keyCode <='z')
      name_s+=key;
  }
}
void keyReleased() {
  if (keyCode==KeyEvent.VK_LEFT) {
    keybuf[0]=0;
  }
  if (keyCode==KeyEvent.VK_RIGHT) {
    keybuf[1]=0;
  }
  if (keyCode==KeyEvent.VK_UP) {
    keybuf[2]=0;
  }
  if (keyCode==KeyEvent.VK_DOWN) {
    keybuf[3]=0;
  }
  if (keybuf[5]==1) {
    keybuf[4]=0;
  }
  if (keyCode==KeyEvent.VK_SPACE) {
    keybuf[5]=0;
  }
}

