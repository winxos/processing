interface raw_sensor
{
  public int get_data();
}
class color_sensor implements raw_sensor
{
  public int sz;
  public int x, y;
  public color_sensor()
  {
    sz=20;
  }
  public void set_loc(int x_, int y_)
  {
    x=x_;
    y=y_;
  }
  public int get_data()
  {
    int sum=0;
    loadPixels();
    for (int j=y-sz/2;j<y+sz/2;j++)
    {
      if (j<0 || j>=height)continue;
      for (int i=x-sz/2;i<x+sz/2;i++)
      {
        if (i<0 || i>=width)continue;
        if (dist(i, j, x, y)<sz/2)
        {
          if (pixels[j*width+i]==color(255, 0, 0))
          {
            sum++;
          }
        }
      }
    }
    return sum;
  }
  int c=0;
  public void render()
  {
    stroke(c);
    strokeWeight(2);
    noFill();
    c+=MAX_INT<<15;
    ellipse(x, y, sz, sz);
  }
}
