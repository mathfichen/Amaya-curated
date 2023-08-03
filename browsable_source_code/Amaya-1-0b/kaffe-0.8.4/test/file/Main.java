import java.lang.*;
import java.io.*;
import java.util.*;

class Main extends Object
{

public static void 
main(String argv[]) throws java.io.IOException
{       

// BUG 2: Valid for kaffe 0.5.5

        System.in.read(); 
        
        /*
        
        This doesn't occur in kaffe-0.5-p4-nx
        
java/io/IOException
        at java/io/FileInputStream.read(0x11c662)
        at java/io/BufferedInputStream.fill(0x11c52f)
        at java/io/BufferedInputStream.read(0x11bfcd)
        at Main.main(0x1005fe)

        */
}
}
