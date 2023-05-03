class Fibonacchi
   extends Test
{
    private long outer;
    private long inner;

    public Fibonacchi()
    {
        super("Fibonacchi");
    }

    public void setData(long out, long in)
    {
        outer = out;
        inner = in;
    }

    public final void performTest()
    {
        long _inner = inner;
        long _outer = outer;

        for(int iter = 0; iter < _outer; ++iter)
        {
            long a1 = 1;
            long a2 = 0;
            long an = 0;

            for(long n = 1; n <= _inner; ++n)
            {
                an = a1 + a2;
                a2 = a1;
                a1 = an;
            }
        }
    }
}