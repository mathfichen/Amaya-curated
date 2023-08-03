class Sieve
   extends Test
{
    private int  size;
    private long times;

    public Sieve()
    {
        super("Sieve");
    }


    public void setData(long sz, long tm)
    {
        size  = (int)sz;
        times = tm;
    }

    public final void performTest()
    {
        boolean flags[];
        int i;
        int prime;
        int k;
        int count;
        int iter;
        long _times = times;
        int _size = size;

        flags = new boolean[size + 1];
        count = 0;

        for(iter = 1; iter <= _times; iter++)
        {
            for(i = 0; i <= _size; i++)
            {
                flags[i] = true;
            }

            for(i = 0; i <= _size; i++)
            {
                if(flags[i])
                {
                    prime = i + i + 3;

                    for(k = i + prime; k <= _size; k += prime)
                    {
                        flags[k] = false;
                        count++;
                    }
                }
            }
        }
    }
}