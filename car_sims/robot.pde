class robot
{
  public int _w, _h;
  public float _x, _y, _vx, _vy;
  ArrayList<color_sensor> css=new ArrayList<color_sensor>();
  ArrayList<point> css_loc=new ArrayList<point>();
  public robot(int x, int y, int w, int h)
  {
    _x=x;
    _y=y;
    _w=w;
    _h=h;
    css_loc.add(new point(-7, -20));
    css_loc.add(new point(7, -20));
    css.add(new color_sensor());
    css.add(new color_sensor());
  } 
  public void render()
  {
    rectMode(CENTER);
    fill(0, 255, 0);
    noStroke();
    rect(_x, _y, _w, _h);
    for (color_sensor cs:css)
    {
      cs.render();
    }
  }
  public void update()
  {
    _x=mouseX;
    _y=mouseY;
    for (int i=0;i<css.size();i++)
    {
      css.get(i).set_loc((int)_x+css_loc.get(i).x, (int)_y+css_loc.get(i ).y);
      print(css.get(i).get_data());
      print(",");
    }
    println();
    _x+=_vx;
    _y+=_vy;
  }
}
