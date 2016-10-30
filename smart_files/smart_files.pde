import java.util.Date;
Nodes a=new Nodes();
Nodes b=new Nodes();
Nodes c=new Nodes();
ArrayList<Nodes> al=new ArrayList<Nodes>();
void bind(Nodes a)
{
  if (!a.is_visited)
  {
    al.add(a);
    a.is_visited=true;
    for (Nodes b:a.deeper)
    {
      bind(b);
    }
  }
}
Nodes [] bb=new Nodes[10];
void setup() {
  size(600, 600);
  // Path
  //  String path = "E:/Documents/Tencent Files/89768679";
  //  ArrayList<File> allFiles = listDirsRecursive(path);
  //  
  //  for (File f: allFiles) {
  //    println("Name: " + f.getName());
  //    println("Full path: " + f.getAbsolutePath());
  //    println("Is directory: " + f.isDirectory());
  //    println("Size: " + f.length());
  //    String lastModified = new Date(f.lastModified()).toString();
  //    println("Last Modified: " + lastModified);
  //    println("-----------------------");
  //  }
  textSize(14);
  background(255);
  smooth();
  stroke(0, 0, 0);
  strokeWeight(2);
  for(int i=0;i<10;i++)
  {
    bb[i]=new Nodes();
    bb[i].x=int(random(300))+200;
    bb[i].y=int(random(300))+200;
    bb[i].c=color(random(200),random(200),random(200));
    bb[i].text=String.valueOf(i+1);
    bb[i].sz=30;
  }
  for(int i=1;i<10;i++)
  {
    bb[i].add_deeper(bb[i-1]);
    bb[i].add_similar(bb[i-1]);
  }
  a.x=100;
  a.y=100;
  a.sz=50;
  a.c=color(0, 255, 0);
  a.text="hello";

  b.text="world";
  b.y=200;
  b.x=100;
  b.sz=30;
  b.c=color(128, 0, 0);

  c.text="good";
  c.y=200;
  c.x=200;
  c.sz=30;
  c.c=color(128, 128, 0);
  c.add_deeper(a);
  c.add_deeper(b);
  b.add_deeper(c);
  a.add_deeper(b);
  a.add_deeper(bb[9]);
  bind(a);
}

// Nothing is drawn in this program and the draw() doesn't loop because
// of the noLoop() in setup()

void draw() {
  clear();
  for (Nodes a:al)
  {
    a.is_visited=false;
  }
  c.render();
}
void mouseReleased()
{
  for (Nodes a:al)
  {
    a.is_moveable=false;
  }
}

void mousePressed()
{
  for (Nodes a:al)
  {
    if (dist(mouseX, mouseY, a.x, a.y)<a.sz/2)
    {
      a.is_moveable=true;
      return;
    }
  }
}

