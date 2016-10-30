void setup()
{
  size(400, 400);
  smooth();

  expression exp=new expression();
  println("ans=", exp.calc_infix("(12-3)  *  (3+3)"));
  exp.calc_suffix("2 3 5 + -");
}
void draw()
{
  clear();
}
