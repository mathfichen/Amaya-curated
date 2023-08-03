class Array
   extends Test
{
    private int array[];

    public Array()
    {
        super("Array Insert");
    }

    public void setData(long p1, long p2)
    {
        array = new int[(int)p1];
    }

    public final void performTest()
    {
        int length = array.length;

        java.util.Random r = new java.util.Random();

        for(int i = 0; i < length; i++)
        {
            array[i] = Math.abs(r.nextInt());
        }
    }
}