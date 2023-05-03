import java.io.*;
import java.net.*;

class whatip2 {

  public static void main(String a[]) throws IOException {

    try {
      System.out.println("hostname is " + a[0] );

      InetAddress InetAddr = InetAddress.getByName (a[0]);
      System.out.println("inet address is " + InetAddr.toString() );
    }
    catch (Throwable t) {
      System.out.println("Catched error " + t.toString() );
    }
  }  
}
