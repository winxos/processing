import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import java.awt.event.KeyEvent;
AudioPlayer player1, player2;
Minim minim;
XML xml;
int zwidth=440;
int zheight=640;
PFont f;
int state=1;
PImage img;

void setup()
{
  noCursor();
  size(440, 640);
  img=loadImage("1.jpg");
  frameRate(60);
  f=loadFont("Serif-48.vlw");
  minim=new Minim(this);
  player1=minim.loadFile("bgmusic.mp3");
  player2=minim.loadFile("bump.wav");
  player1.play();
  player1.loop();
  textFont(f, 12);
  noStroke();
  xml=loadXML("score.xml");
  smooth();
  for (int i=0;i<cars;i++) {
    cars_life[i]=false;
  }
}
void draw() {
  switch(state) {
  case 1 :
    menus();
    break;
  case 2:
    startgame();
    break;
  case 3:
    aboutgame();
    break;
  case 4:
    highscores();
    break;
  case 5:
    inputname();
    break;
  case 6:
    gameover();
    break;
  }
}

