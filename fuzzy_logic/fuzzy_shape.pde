String names[]={"zheng","dengzhi","zhijiao","dengyao","yiban"};
float[] judge_triangles(float a,float b,float c)
{
  float ans[]=new float[5];
  ans[0]=1-abs(a-c)/180.0;
  ans[1]=1-max(min(abs(a-b),abs(b-c))/60.0,abs(a-90)/90.0);
  ans[2]=1-abs(a-90)/90.0;
  ans[3]=1-min(abs(a-b),abs(b-c))/60.0;
  ans[4]=min(min(3*abs(a-b),3*abs(b-c)),min(abs(a-c),2*abs(a-90)))/180.0;
  return ans;
}

