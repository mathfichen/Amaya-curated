class Hanoi
   extends Test
{
    private int numDisks;
    private int maxDisks;
    private Peg peg1;
    private Peg peg2;
    private Peg peg3;

    public Hanoi()
    {
        super("Towers of Hanoi");
    }

    public void setData(long num, long max)
    {
        numDisks = (int)num;
        maxDisks = (int)max;

        peg1 = new Peg(1, numDisks);
        peg2 = new Peg(2, numDisks);
        peg3 = new Peg(3, numDisks);
    }

    public final void performTest()
    {
        if(numDisks > maxDisks)
        {
            numDisks = maxDisks;
        }

        for(int i = numDisks; i > 0; i--)
        {
            peg1.addDisk(i);
        }

        moveDisks(numDisks, peg1, peg3, peg2);
    }


    public static void moveDisks(int numDisks, Peg fromPeg, Peg toPeg, Peg usingPeg)
    {
        if(numDisks == 1)
        {
            toPeg.addDisk(fromPeg.removeDisk());
        }
        else
        {
            moveDisks(numDisks - 1, fromPeg, usingPeg, toPeg);
            moveDisks(1, fromPeg, toPeg, usingPeg);
            moveDisks(numDisks - 1, usingPeg, toPeg, fromPeg);
        }
    }
}


class Peg
{
    int pegNum;
    int disks[] = new int[64];
    int nDisks;

    public Peg(int n, int numDisks)
    {
        pegNum = n;

        for(int i = 0; i < numDisks; i++)
        {
            disks[i] = 0;
        }

        nDisks = 0;
    }

    public int pegNum()
    {
        return pegNum;
    }

    public void addDisk(int diskNum)
    {
        disks[nDisks++] = diskNum;
    }

    public int removeDisk()
    {
        return disks[--nDisks];
    }
}