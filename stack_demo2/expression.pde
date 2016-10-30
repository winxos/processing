/*
processing expression calculate
Stack is self stack structure.
winxos 2014-03-24
*/
class expression
{
  //state machine to splite string to elements.
  String[] split_expression(String expr)
  {
    Stack s=new Stack();
    int npos=0, flag=0;
    println("in split...");
    for (int i=0;i<expr.length();i++)
    {
      if (Character.isDigit(expr.charAt(i ) )) //number
      {
        if (flag==0) //number start
        {
          flag=1;
          npos=i;
        }
      }
      else
      {
        if (flag==1) //number end
        {
          s.push(expr.substring(npos, i));
          flag=0;
        }
        if (expr.charAt(i )!=' ') //skip white space
          s.push(expr.substring(i, i+1));
      }
    }
    println(s);
    return s.toArray();
  }
  //infix to suffix, parameter is string[]
  String[] infix2suffix(String[] ss)
  {
    Stack in_buf=new Stack();
    Stack out_buf=new Stack();
    for (String s:ss)
    {
      if (is_op(s )<0) //number put into out_buf straight
      {
        out_buf.push(s );
      }
      else //
      {
        if (in_buf.size()==0) //first operator 
        {
          in_buf.push(s );
          continue;
        }
        if (s.equals("(" ) || in_priority(s.charAt(0 ) )>in_priority(((String)in_buf.peek()).charAt(0) )) //
        {
          in_buf.push(s );
        }
        else if (s.equals(")" )) //calculate the "("
        {
          while (!in_buf.peek ().equals("(" ))
          {
            out_buf.push((in_buf.pop() ));
          }
          in_buf.pop();
        }
        else
        {
          while (in_priority (s.charAt (0 ) )<=in_priority(((String)in_buf.peek()).charAt(0) )) //+ meet *
          {
            out_buf.push((in_buf.pop() ));
          }
        }
      }
    }
    for (int i=0;i<in_buf.size();i++) //put all the remainder to the out_buf
    {
      out_buf.push(in_buf.pop() );
    }
    println(out_buf);
    return out_buf.toArray();
  }
  //calculate string express
  public double calc_infix(String s)
  {
    println("calc :",s);
    return calc_suffix(infix2suffix(split_expression(s ) ) );
  }
  //
  public double calc_suffix( String s)
  {
    println("calc :",s);
    return calc_suffix(split_expression(s ) );
  }
  //suffix calculation parameter is String[]
  private double calc_suffix(String ss[])
  {
    Stack buf=new Stack();
    double a, b;
    println("in calc suffix");
    for (String s:ss)
    {
      switch(is_op(s ))
      {
      case 0:
        a=Double.parseDouble(buf.pop().toString());
        b=Double.parseDouble(buf.pop().toString());
        buf.push(a+b);
        break;
      case 1:
        a=Double.parseDouble(buf.pop().toString());
        b=Double.parseDouble(buf.pop().toString());
        buf.push(b-a);
        break;
      case 2:
        a=Double.parseDouble(buf.pop().toString());
        b=Double.parseDouble(buf.pop().toString());
        buf.push(a*b);
        break;
      case 3:
        a=Double.parseDouble(buf.pop().toString());
        b=Double.parseDouble(buf.pop().toString());
        buf.push(b/a);
        break;
      default:
        buf.push(s);
        break;
      }
    }
    return Double.parseDouble(buf.pop().toString());
  }
  private int is_op(String s)
  {
    String ops[]= {
      "+", "-", "*", "/", "(", ")"
    };
    for (int i=0;i<ops.length;i++)
    {
      if (s.equals(ops[i])) 
        return i;
    }
    return -1;
  }
  //operators priority for in_buf
  private int in_priority(char c)//
  {
    switch(c)
    {
    case '(':
      return 1;
    case '+':
    case '-':
      return 2;
    case '*':
    case '%':
    case '/':
      return 3;
    }
    return 0;
  }
}
