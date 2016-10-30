class Nodes
{
  ArrayList<Nodes> lower;
  ArrayList<Nodes> deeper;
  ArrayList<Nodes> similar;
  public int x, y;
  public int sz, c;
  public String text;
  public boolean is_visited;
  public boolean is_selected;
  public boolean is_moveable;
  public Nodes()
  {
    lower=new ArrayList<Nodes>();
    deeper=new ArrayList<Nodes>();
    similar=new ArrayList<Nodes>();
  }
  public void add_lower(Nodes n)
  {
    lower.add(n);
  }
  public void add_deeper(Nodes n)
  {
    deeper.add(n);
  }
  public void add_similar(Nodes n)
  {
    similar.add(n);
  }
  public void update()
  {
    if (is_moveable)
    {
      x=mouseX;
      y=mouseY;
    }
  }
  public void render()
  {
    is_visited=true;
    update();

    //
    stroke(0, 220, 0);
    for (Nodes n:lower)
    {
      line(x, y, n.x, n.y);
      if (n.is_visited)break;
      n.render();
    }
    stroke(0, 200, 200);
    for (Nodes n:deeper)
    {
      int det=abs(n.x-x); //to right
      int d=int(n.x>x)*2-1;
      int offset=0;
      if(det<sz+n.sz && n.y<y)offset=sz+n.sz;
      noFill();
      bezier(x, y+sz/2, x+d*(det/2+offset*2), y+sz, n.x-d*(det/2+offset*2), n.y-n.sz, n.x, n.y-n.sz/2);
      fill(255, 0, 0);
      ellipse(n.x, n.y-n.sz/2, 8, 8);
      if (n.is_visited)break;
      n.render();
    }
    stroke(0, 0, 200);
    for (Nodes n:similar)
    {
      int det=abs(n.x-x); //to right
      int d=1;
      int offset=0;
      if(det<sz+n.sz)offset=(sz+n.sz)/2;
      d=int(n.x>x)*2-1;
      noFill();
      bezier(x+d*sz/2, y, x+d*(det/2+offset), y, n.x-d*(det/2+offset), n.y-n.sz/2, n.x-d*n.sz/2, n.y);
      fill(0, 255, 200);
      ellipse( n.x-d*n.sz/2, n.y, 8, 8);
      if (n.is_visited)break;
      n.render();
    }

    fill(c);
    ellipse(x, y, sz, sz);
    fill(255);
    text(text, x-sz/3, y);
  }
}

