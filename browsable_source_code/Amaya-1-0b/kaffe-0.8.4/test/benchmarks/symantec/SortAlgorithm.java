abstract class SortAlgorithm
    extends Test
{
    protected int a[];

    SortAlgorithm(String s)
    {
        super(s);
    }

    public void setData(long p1, long p2)
    {
        a = new int[(int)p1];

        java.util.Random r = new java.util.Random();

        for(int i = 0; i < a.length; i++)
        {
            a[i] = Math.abs(r.nextInt());
        }
    }
}