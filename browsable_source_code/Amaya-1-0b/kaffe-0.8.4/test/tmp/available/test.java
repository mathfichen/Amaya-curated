import java.io.*;

class test {

  public static void main (String[] argv) throws FileNotFoundException,
IOException
  {
    FileInputStream in = new FileInputStream(argv[0]);
    while (in.available() > 0) {
      System.out.println(in.read());
    }   
  }
}

