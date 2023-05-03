import java.util.Date;
import java.io.*;


class DateTest{
    public static final String value = "this is a test";
    public static final int value2 = 123;
    public static final double value3 = 123.456;
    public static final char value4 = 'a';

    public static void main(String args[]) 
    {
        Date d = new Date();

        System.out.println ("Today is " + d.toString());
        System.out.println ("Today is " + d.toLocaleString());
        System.out.println ("Today is " + d.toGMTString());
    }
}
