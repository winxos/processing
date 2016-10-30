int car_l=60;
int car_d=40;
int car_speed=4; 
float h=0;
int x=zwidth/2;
int y=zheight-car_l/2;
int raceroad=6*car_d;
int i=0;
int line_l=100;
int line_d=10;
int line_gap=10;
int line_num=zheight/(line_l+line_gap)+1;
float line_h=0;
boolean carlive=true;
int wheel_h=15;
int wheel_d=8;
int cars=8;
float []cars_y=new float [cars];
float []cars_x=new float [cars];
boolean []cars_life=new boolean[cars];
int delay_car;
int passcar=0;
void init_game()
{
  cars_y=new float [cars];
  cars_x=new float [cars];
  cars_life=new boolean[cars];
  passcar=0;
  car_speed=4; 
  carlive=true;
  x=zwidth/2;
  y=zheight-car_l/2;
}
void update() {
  if (keybuf[0]==1) {
    x-=car_speed;
  }
  if (keybuf[1]==1) {
    x+=car_speed;
  }
  if (keybuf[2]==1) {
    y-=car_speed;
  }
  if (keybuf[3]==1) {
    y+=car_speed;
  }
  for (int i=0;i<cars;i++) {
    if (!cars_life[i] && delay_car==0) {
      cars_life[i]=true; 
      cars_x[i]=random(zwidth/2-raceroad/2+car_d/2+wheel_d, zwidth/2+raceroad/2-car_d/2-wheel_d);
      cars_y[i]=-car_l;     
      delay_car=(int)random(60, 100);
      passcar++;
      break;
    }
  }
  for (int i=0;i<cars;i++) {
    if (cars_life[i]) {
      cars_y[i]+=car_speed;
    }
  }
  if (delay_car>0) delay_car--;
}
void check_limit() {
  if (x<=zwidth/2-raceroad/2+car_d/2+wheel_d) {
    x=zwidth/2-raceroad/2+car_d/2+wheel_d;
  }
  if (x>=zwidth/2+raceroad/2-car_d/2-wheel_d) {
    x=zwidth/2+raceroad/2-car_d/2-wheel_d;
  }
  if (y>=zheight-car_l/2) {
    y=zheight-car_l/2;
  }
  if (y<=car_l/2) {
    y=car_l/2;
  }
  for (int i=0;i<cars;i++) {
    if (cars_y[i]>=zheight+car_l/2) cars_life[i]=false;
    if ((abs(y-cars_y[i])<=car_l) && (abs(x-cars_x[i])<=car_d+2*wheel_d)) {
      carlive=false;
    }
  }
  if (!carlive) {
    player2.rewind();
    player2.play();
    if (break_score(scores))
    {
      state=5;
    }
    else
    {
      state=6;
    }
  }
}
boolean break_score(int score) {
  XML[] childs=xml.getChildren("highscore");
  int i;
  for (i=0;i<childs.length;i++)
  {
    int t=childs[childs.length-1-i].getInt("value");
    if (t>=score)break;
  }
  if (i>0) 
  {
    return true;
  }
  return false;
}

void draw_othercars() {
  for (int i=0;i<cars;i++) {
    if (cars_life[i]) {
      car(cars_x[i], cars_y[i], 150, 220*cos(i), 20*sin(i));
      scores=car_speed*(passcar+30*(car_speed-4));
    }
  }
}
void car(float x, float y, float R, float G, float B) {
  noStroke();
  fill(R, G, B);
  rectMode(CENTER);
  rect(x, y, car_d, car_l);
  stroke(0);
  rect(x, y, car_d/2, car_l/4);
  noStroke();
  fill(0);
  pushMatrix();
  translate(x, y);
  rect(-(car_d/2+wheel_d/2), -car_l/4, wheel_d, wheel_h);
  rect(car_d/2+wheel_d/2, -car_l/4, wheel_d, wheel_h);
  rect(-(car_d/2+wheel_d/2), car_l/4, wheel_d, wheel_h);
  rect(car_d/2+wheel_d/2, car_l/4, wheel_d, wheel_h);
  popMatrix();
}
void middle_line() { 
  float p=0;
  stroke(255);
  strokeCap(SQUARE);
  strokeWeight(line_d);
  for (int i=line_num;i>=0;i--) {
    p=i*(line_l+line_gap)+line_h;
    line(zwidth/2, p, zwidth/2, p+line_l);
  }
  if (line_h>=0) {
    line_h=-line_l;
  }
  line_h+=2*car_speed;
}
void car_background() {
  background(50, 200, 100);
  fill(150);
  noStroke();
  rectMode(CENTER);
  rect(zwidth/2, zheight/2, raceroad, zheight);
  middle_line();
}
void accelerate() {
  if (passcar==30) {
    car_speed+=1;
    passcar=0;
  }
}
void startgame() 
{
  clear();
  car_background();
  if (carlive)
  {
    update();
    check_limit();
    car(x, y, 200, 100, 100);
    draw_othercars();
    accelerate();
    textSize(24);
    text("scores:", 10, 20);
    text(scores, 75, 20);
  }
}

