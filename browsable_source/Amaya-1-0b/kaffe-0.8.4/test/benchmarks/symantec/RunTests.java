import java.util.Vector;


public class RunTests
{
    public static void main(String argv[])
        throws InstantiationException,
               ClassNotFoundException,
               IllegalAccessException
    {
        Vector tests;
        long totalTime = 0;

        tests = new Vector();
        tests.addElement(new TestData("BubbleSortAlgorithm", 10000, 0));
        tests.addElement(new TestData("BidirectionalBubbleSortAlgorithm", 10000, 0));
        tests.addElement(new TestData("QSortAlgorithm", 500000, 0));
        tests.addElement(new TestData("Sieve", 4095, 1000));
        tests.addElement(new TestData("Hanoi", 22, 22));
        tests.addElement(new TestData("Dhrystone", 10000, 10));
        tests.addElement(new TestData("Fibonacchi", 12000, 1500));
        tests.addElement(new TestData("Array", 1000000, 0));
        tests.addElement(new TestData("Tree", 1000000, 0));

        for(int i = 0; i < tests.size(); i++)
        {
            totalTime += runTest((TestData)tests.elementAt(i));
        }

        System.out.println("Total   Time = " + totalTime);
    }

    static long runTest(TestData data)
        throws InstantiationException,
               ClassNotFoundException,
               IllegalAccessException
    {
        Test test;
        long time;

        test = (Test)Class.forName(data.name).newInstance();
        test.setData(data.p1, data.p2);
        System.out.println("Running " + data.name + "...");
        time = test.runTest();
        System.out.println("   Test took " + time + " milliseconds to execute.\n");

        return time;
    }
}


class TestData
{
    String name;
    long p1;
    long p2;

    TestData(String s, long x, long y)
    {
        name = s;
        p1   = x;
        p2   = y;
    }
}
