class world
{
  ArrayList <robot>robs=new ArrayList<robot>();
  ArrayList <obstacle> obs=new ArrayList<obstacle>();
  public world()
  {
    obs.add(new obstacle());
  }
  public void add_robot(robot r)
  {
    robs.add(r);
  }
  public void add_obstacle(obstacle o)
  {
    obs.add(o);
  }
  public void render()
  {
    for(obstacle o:obs)
    {
      o.render();
    }
  }
  public void update()
  {
    for (robot r:robs)
    {
      r.update();
      r.render();
    }
  }
}

