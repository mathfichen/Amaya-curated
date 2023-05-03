import java.lang.*;
import java.io.*;
import java.util.*;

class TestEx extends Exception
{
}

class TestExMain extends Object
{

public static void 
main(String argv[]) throws java.io.IOException
{
	
	for(int i=0;i<1000000;i++)
	{
		try 
		{
			throw new TestEx();
		}
			
		catch (TestEx e)
		{
			System.out.println(i);		
		}
	}
}

}
