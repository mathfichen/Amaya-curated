import java.util.Date;
import java.io.*;


class DateTest2 {
    public static void main(String args[]) 
    {
	Date d = new Date();
	System.out.println("Current: "+d.toString());
	Date d2 = new Date(Date.UTC(96, 8, 9, 13, 0, 0));
	System.out.println("UTC 13:00: "+d2.toString());
	Date d3 = new Date(96, 8, 9, 13, 0, 0);
	System.out.println("Date 13:00: "+d3.toString());
    }
}
