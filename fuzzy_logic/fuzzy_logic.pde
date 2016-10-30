import java.text.DecimalFormat;
int move_id=-1;
color fs[]=new color[5];
ArrayList<PVector> tris;
void setup()
{
  size(400, 400);
  smooth();  
  tris=new ArrayList<PVector>();
  tris.add(new PVector(width/2, height/3));
  tris.add(new PVector(width/3, height*2/3));
  tris.add(new PVector(width*2/3, height*2/3));
  fs[0]=color(255, 0, 0,100);
  fs[3]=color(0, 255, 0,100);
  fs[2]=color(0, 0, 255,100);
  fs[1]=color(0, 255, 255);
  fs[4]=color(255, 255, 0);
}
void mouseReleased()
{
  move_id=-1;
  background(208);
}
void mousePressed()
{
  for (int i=0;i<tris.size();i++)
  {
    if (dist(mouseX, mouseY, tris.get(i).x, tris.get(i).y)<10)
    {
      move_id=i;
      return;
    }
  }
}
float[] calc_prop(PVector p0, PVector p1, PVector p2)
{
  PVector l1=new PVector(p1.x-p0.x, p1.y-p0.y);
  PVector l2=new PVector(p2.x-p0.x, p2.y-p0.y);
  PVector l3=new PVector(p2.x-p1.x, p2.y-p1.y);  
  float a=degrees(PVector.angleBetween(l1, l2));
  float b=degrees(PVector.angleBetween(l3, l2));
  float c=180-a-b;
  // println(a,b,c);
  float d=max(a, b, c);
  float e=min(a, b, c);
  return judge_triangles(d, 180-d-e, e);
}
int lx=120,ly=90,bx=280,by=220;
int gx=lx, gy=ly;
int det=5;
void calc()
{
  //  float x=random(width);
  //  float y=random(height-20)+20;

  gx+=det;

  if (gx>bx)
  {
    gx=lx;
    gy+=det;
    if (gy>by) 
    {
      gy=ly;
      det/=2;
      if(det==0)return;
      gy+=det;
      gx+=det;
    }
  }

  float ans[]=calc_prop(new PVector(gx, gy), tris.get(1), tris.get(2));
  int id=0;
  for (int i=1;i<5;i++)
  {
    if (ans[i]>ans[id])
    {
      id=i;
    }
  }
  fill(red(fs[id])*(ans[id]*3-1.95), green(fs[id])*(ans[id]*3-1.95), blue(fs[id])*(ans[id]*3-1.95));
  noStroke();
  ellipse(gx, gy, 5, 5);
  stroke(0);
  line(tris.get(1).x, tris.get(1).y, tris.get(2).x, tris.get(2).y);
  ellipse(tris.get(1).x, tris.get(1).y, 5, 5);
  ellipse(tris.get(2).x, tris.get(2).y, 5, 5);
}
void draw()
{
  //
  calc();
  //  stroke(0, 0, 128);
  for (int i=0;i<tris.size();i++)
  {
    if (dist(mouseX, mouseY, tris.get(i).x, tris.get(i).y)<10)
    {
      ellipse(tris.get(i).x, tris.get(i).y, 10, 10);
      break;
    }
  }  
  if (move_id>=0)
  {
    tris.get(move_id).x=mouseX;
    tris.get(move_id).y=mouseY;
    background(208);
  }
  fill(0, 0, 0);
  textSize(14);
  float ans[]=calc_prop(tris.get(0), tris.get(1), tris.get(2));
  DecimalFormat df=new DecimalFormat("0.00");
  int id=0;
  for (int i=0;i<5;i++)
  {
    noStroke();
    fill(fs[i]);
    ellipse(20+i*width/5, 10, 10, 10);
    fill(0);
    text(names[i], 10+i*width/5, 30);
    text("p: "+df.format(ans[i]), 10+i*width/5, 45);
    if (ans[i]>ans[id])
    {
      id=i;
    }
  }
  textSize(18);
  fill(200, 20, 200);
  text(names[id], (tris.get(0).x+tris.get(1).x+tris.get(2).x)/3.0-30, 
  (tris.get(0).y+tris.get(1).y+tris.get(2).y)/3.0);
  strokeWeight(1);
  stroke(100, 10, 0, 20);
  for (int i=0;i<tris.size();i++)
  {
    ellipse(tris.get(i).x, tris.get(i).y, 5, 5);
    line(tris.get(i).x, tris.get(i).y, 
    tris.get((i+1)%tris.size()).x, tris.get((i+1)%tris.size()).y);
  }
}

