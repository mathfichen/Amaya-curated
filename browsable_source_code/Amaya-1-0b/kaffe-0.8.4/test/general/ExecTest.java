import java.lang.*;
import java.io.*;

class ExecTest {
    public static void main(String args[]) 
    {
	try {
		Process child = Runtime.getRuntime().exec("/bin/ls");
		InputStream child_in = child.getInputStream();
		int c;
		while ((c = child_in.read()) != -1) {
			System.out.print((char)c);
		}
		child_in.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	System.out.println("DONE!");
    }
}
