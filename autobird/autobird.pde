auto_drive ad=new auto_drive();
obs o=new obs();
bird b=new bird();

class SimpleThread extends Thread {

  boolean running;           // Is the thread running?  Yes or no?
  int wait;                  // How many milliseconds should we wait in between executions?
  // Constructor, create the thread
  // It is not running by default
  SimpleThread (int w) {
    wait = w;
    running = false;
  }

  // Overriding "start()"
  void start () {
    running = true;
    super.start();
  }


  // We must implement run, this gets triggered by start()
  void run () {
    // Ok, let's wait for however long we should wait
    while (running)
    {
      try {
        sleep((long)(wait));
        ad.drive(o, b);
      } 
      catch (Exception e) {
      }
    }
  }


  // Our method that quits the thread
  void quit() {
    running = false;  // Setting running to false ends the loop in run()
    interrupt();
  }
}

void setup()
{
  size(400, 400);
  smooth();
  frameRate(60 );
  SimpleThread t1=new SimpleThread(1);
  t1.start();
}
void keyPressed()
{
  if (keyCode==32)
  {
    b.vy=-8;
  }
}
void draw()
{
  clear();
  o.render(b);
  b.render();
}

