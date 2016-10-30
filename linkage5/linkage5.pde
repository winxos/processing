//linkage-five simulation.
//winxos 2014-03-02

//calculate the intersect points of two circle.
ArrayList<Float> calc_intersect(float x1, float y1, float x2, float y2, float r1, float r2) 
{
  float d=dist(x1, y1, x2, y2);
  float e=sqrt((d+r1+r2)*(d+r1-r2)*(d-r1+r2)*(-d+r1+r2))/4;

  float nx1=(x1+x2)/2+(x2-x1)*(r1*r1-r2*r2)/(2*d*d)-2*(y1-y2)*e/(d*d);
  float nx2=(x1+x2)/2+(x2-x1)*(r1*r1-r2*r2)/(2*d*d)+2*(y1-y2)*e/(d*d);
  float ny1=(y1+y2)/2+(y2-y1)*(r1*r1-r2*r2)/(2*d*d)+2*(x1-x2)*e/(d*d);
  float ny2=(y1+y2)/2+(y2-y1)*(r1*r1-r2*r2)/(2*d*d)-2*(x1-x2)*e/(d*d);
  ArrayList<Float> ans=new ArrayList<Float>();
  ans.add(nx1);
  ans.add(ny1);
  ans.add(nx2);
  ans.add(ny2);
  return ans;
}
//dynamic forehead solver
//input angles of two motor, update the middle point's location
void update_fore(float ang0, float ang1)
{
  ps[1].x=ps[0].x+l1*cos(radians(ang0));
  ps[1].y=ps[0].y+l1*sin(radians(ang0));
  ps[3].x=ps[4].x+l4*cos(radians(ang1));
  ps[3].y=ps[4].y+l4*sin(radians(ang1));
  ArrayList<Float> ans=calc_intersect(ps[1].x, ps[1].y, ps[3].x, ps[3].y, l2, l3);  
  line(ps[1].x, -ps[1].y, ans.get(0), -ans.get(1));
  line(ps[3].x, -ps[3].y, ans.get(0), -ans.get(1));
  stroke(color(0, 0, 200));
  line(ps[1].x, -ps[1].y, ans.get(2), -ans.get(3));
  line(ps[3].x, -ps[3].y, ans.get(2), -ans.get(3));
  ps[2].x=ans.get(0);
  ps[2].y=ans.get(1);
}
//dynamic backward solver
//input excutor's location, update motors angle.
void update_back(mp p)
{
  ArrayList<Float> ans;
  ans=calc_intersect(ps[0].x, ps[0].y,p.x,p.y, l1, l2);
  ps[1].x=ans.get(0);
  ps[1].y=ans.get(1);
  line(ps[1].x, -ps[1].y, p.x,-p.y);
  ans=calc_intersect(p.x,p.y, ps[4].x, ps[4].y,l3, l4);
  ps[3].x=ans.get(0);
  ps[3].y=ans.get(1);  
  line(ps[3].x, -ps[3].y, p.x,-p.y);
  
}
float l1, l2, l3, l4;
float ang0, ang1;
int offx, offy;
mp[] ps=new mp[5];

void setup()
{
  size(800, 800);
  smooth();
  background(0);
  frameRate(60);
  for (int i=0;i<5;i++)
  {
    ps[i]=new mp();
  }
  offx=400;
  offy=500;
  ps[0].x=0;
  ps[0].y=0;
  ps[4].x=180;
  ps[4].y=0;
  l1=100;
  l2=200;
  l3=180;
  l4=100;
  ang0=90;
  ang1=80;
}
int d1=1, d2=1;

void update()
{
  update_fore(ang0,ang1);
  mp p=new mp();
  p.x=mouseX-offx;
  p.y=offy-mouseY;
  update_back(p);
  ang0+=1.3*d1;
  ang1-=1.7*d2;
  // if (ang0>180 || ang0<80)d1=-d1;
  //if (ang1>110 || ang1<-30)d2=-d2;
}
void draw()
{
  clear();
  noFill();
  stroke(color(0, 200, 0));
  strokeWeight(10);
  pushMatrix();
  translate(offx, offy);
  update();
  line(ps[0].x, -ps[0].y, ps[1].x, -ps[1].y);
  line(ps[3].x, -ps[3].y, ps[4].x, -ps[4].y);
  strokeWeight(1);
  ellipse(ps[0].x, -ps[0].y, 2*(l1+l2), 2*(l1+l2));
  ellipse(ps[4].x, -ps[4].y, 2*(l3+l4), 2*(l3+l4));
  popMatrix();
}
