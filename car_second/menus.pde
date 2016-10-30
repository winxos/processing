int button_x;
int button_y;
String content;
void buttons(int button_x, int button_y, String content, color c) {
  fill(c);
  noStroke();
  rectMode(CENTER);
  rect(button_x, button_y, 200, 50);
  textSize(24);
  fill(255, 0, 0);
  text(content, button_x-75, button_y+5);
}
String[] menus=new String[] {
  "Start Game", "High Score", "About Game"
};
color bg_btn1=color(50, 10, 150, 200);
color bg_btn2=color(100, 100, 100, 100);
void menus() {
  color btn;
  image(img, -350, 0);
  for (int i=0;i<3;i++)
  {
    if (cur_menu==i) btn=bg_btn1;
    else btn=bg_btn2;
    buttons(zwidth/2, zheight/2-80+i*80, menus[i], btn);
  }
}
