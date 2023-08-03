import java.io.*;
import java.net.*;

public class testparent {

    public static void main(String argv[]) {
        Process child;
        Runtime r;
        try  { 
            r = Runtime.getRuntime();
            System.out.println("Starting a child.");
            child = r.exec("/bin/ls");
        } catch (IOException e) {
            System.out.println("Error:  " + e.toString());
            return;
        }
        try {
            System.out.println("Waiting for child to finish.");
	    InputStream in = child.getInputStream();
	    int c;
	    while ((c = in.read()) != -1) {
		System.out.print((char)c);
	    }
            child.waitFor();
            System.out.println("Child finished. " + child.exitValue());
        } catch (Exception e) {
            System.out.println("Error:  " + e.toString());
        }
    }

}
