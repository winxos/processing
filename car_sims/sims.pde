world w=new world();
void setup()
{
  size(400,400);
  background(0);
  fill(255);
  smooth();
  noStroke();
  robot r=new robot(100,100,10,20);
//  r._vx=0.1;
//  r._vy=0.13;
  w.add_robot(r);
}
void draw()
{
  background(255);
  w.render();
  w.update();
}
