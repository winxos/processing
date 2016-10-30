class bird
{
  float x, y, vy;
  int sz;
  public bird()
  {
    x=50;
    sz=10;
    vy=0;
    y=100;
  }
  void update()
  {
    vy+=0.5;
    y+=vy;
    if (y>400-sz)
    {
      y=400-sz;
    }
    if (y<sz)
    {
      y=sz;
    }
  }
  void render()
  {
    update();
    noStroke();
    fill(color(200, 0, 0));
    ellipse(x, y, sz*2, sz*2);
  }
}

