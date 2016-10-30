class stack_gui extends Stack
{
  int x,y,w,h;
  public stack_gui()
  {
    x=200;y=400;
    w=50;h=20;
  }
  public void render()
  {
    for(int i=0;i<size();i++)
    {
      fill(0,200,0);
      rect(x,y-i*h,w,h);
      fill(0,0,100);
      text(buf[i].toString(),x,y-i*h+h);
    }
  }
}
