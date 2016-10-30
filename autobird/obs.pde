class pipe
{
  int x;
  Boolean is_die;
  int len, sy, sz;
  public pipe(int n)
  {
    x=n;
    len=120;
    sy=50+(int)random(20)*10;
    sz=60;
    is_die=false;
  }
  void update( )
  {
    if (is_die)return;
    x-=2;
    if (x<-sz)
    {
      is_die=true;
    }
  }
  public Boolean is_hit_ball(bird b)
  {
    if (b.x>x-b.sz && b.x<x+sz+b.sz)
    {
      if (b.y>sy+len-b.sz || b.y<sy+b.sz)
      {
        return true;
      }
    }
    return false;
  }
  void render()
  {
    fill(color(0, 200, 0));
    rect(x, 0, sz, sy);
    rect(x, sy+len, sz, 400-sy-len);
  }
}
class obs
{
  ArrayList<pipe> ap;
  public obs()
  {
    ap=new ArrayList<pipe>();
    ap.add(new pipe(400));
    ap.add(new pipe(600));
    ap.add(new pipe(800));
  }
  public void addp()
  {
    ap.add(new pipe(ap.get(ap.size()-1).x+200));
  }
  void render(bird b)
  {
    noStroke();
    for (int i=0;i<ap.size();i++)
    {
      ap.get(i).update();
      if (ap.get(i).is_hit_ball(b))
      {
        return;
      }
      if (ap.get(i).is_die)
      {
        addp();
        ap.remove(i);
      }
      ap.get(i).render();
    }
  }
}

