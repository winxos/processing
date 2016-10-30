class obstacle
{
  public color c;
  public int line_width;
  ArrayList<point> ap=new ArrayList<point>();
  public obstacle()
  {
    ap.add(new point(100,100));
    ap.add(new point(100,200));
    ap.add(new point(300,200));
    ap.add(new point(300,100));
    ap.add(new point(100,100));
    line_width=10;
    c=color(255,0,0);
  }
  public void render()
  {
    fill(c);
    stroke(c);
    strokeWeight(line_width);
    for(int i=1;i<ap.size();i++)
    {
      line(ap.get(i).x,ap.get(i).y,
      ap.get(i-1).x,ap.get(i-1).y);
    }
  }
}
