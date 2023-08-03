abstract public class Test
{
    private String name;

    public Test(String s)
    {
        name = s;
    }

    public final long runTest()
    {
        long startTime;
        long endTime;

        startTime = System.currentTimeMillis();
        performTest();
        endTime = System.currentTimeMillis();

        return (endTime - startTime);
    }

    abstract public void setData(long p1, long p2);
    abstract public void performTest();
}
