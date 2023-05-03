public class Matrix {
  private double data[][];
  private int size_x;
  private int size_y;

  public Matrix(int rows, int cols) {
    size_x=cols;
    size_y=rows;
    data=new double[size_y][size_x];
  }

  public static Matrix Identity(int n) {
    Matrix ret=new Matrix(n,n);
    for(int m=0;m<n;m++)
      ret.data[m][m]=1.0;
    return ret;
  }

  public String toString(){
    String ret=new String();
    int n,m;
    for(n=0;n<size_y;n++){
      for(m=0;m<size_x;m++)
        ret+=(data[n][m]+" ");
      ret+="\n";
    }
    return ret;
  }

  public static void main(String args[]){
    Matrix a=Matrix.Identity(20);
    System.out.println(a);
  }
}
