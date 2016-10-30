class Stack
{
  Object buf[];
  private int top;
  public Stack()
  {
    buf=new Object[100];
    top=0;
  }
  void push(Object n)
  {
    buf[top++]=n;
  }
  int size()
  {
    return top;
  }
  Object pop()
  {
    if (top==0)return null;
    return buf[--top];
  }
  Object peek()
  {
    if (top==0)return null;
    return buf[top-1];
  }
  String toString()
  {
    String s="";
    for (int i=0;i<size();i++)
    {
      s+=buf[i]+" ";
    }
    return s;
  }
  String [] toArray()
  {
    String [] ret=new String[size()];
    arrayCopy(buf,0,ret,0,size());
    return ret;
  }
}
