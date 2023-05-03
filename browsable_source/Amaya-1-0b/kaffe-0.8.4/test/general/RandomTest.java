
import java.util.*;


class RandomTest
{
    static final int runs=10000;
    static final int numIntervals=10;
    
    RandomTest()
    {
        double mean=0;
        Random r=new Random();
        int O[]=new int[100];
        int E=runs/numIntervals;
        
        for(int i=0;i<runs;i++)
        {
            double d=r.nextDouble();
            mean+=d;

            O[(int)(d*10)]++;
        }

        System.out.println("Mean is " + mean/runs);

        System.out.println("Expected no per Interval: " + E);
        System.out.println("Values of Oi");
        for(int i=0;i<numIntervals;i++)
            System.out.println(O[i]);

        double chi=0;
        
        for(int i=0;i<numIntervals;i++)
        {
            double e=(O[i]-E);
            chi+=(e*e)/E;
        }

        System.out.println("Chi: " + chi);
    }

    public static final void main(String args[])
    {
        RandomTest r=new RandomTest();

    }
}
