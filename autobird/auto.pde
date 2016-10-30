import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.awt.AWTException;
class auto_drive
{
  Robot robot;
  int i=0;
  public auto_drive()
  {
    try {
      robot=new Robot();
    }
    catch(AWTException a)
    {
    }
  }
  public void drive(obs o, bird b)
  {
    if (i==0)
    {
      //robot.keyPress(KeyEvent.VK_SPACE);
    }
    float n=b.x;
    int ox=0, oy=0;
    for (int i=0;i<o.ap.size();i++)
    {
      if (o.ap.get(i).x+o.ap.get(i).sz+20>n)
      {
        ox=o.ap.get(i).x+o.ap.get(i).sz+20;
        oy=o.ap.get(i).sy+o.ap.get(i).len;
        break;
      }
    }
    //stroke(color(0, 0, 200));
    //           
    line(b.x, b.y, ox, oy);
    if (b.y+b.sz>oy-20)
    {
      robot.keyPress(KeyEvent.VK_SPACE);
    }
  }
}

