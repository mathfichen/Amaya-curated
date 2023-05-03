import java.util.Random;

class Tree
   extends Test
{
    private int data;
    private Tree left = null;
    private Tree right = null;
    private long numInserts;

    public Tree()
    {
        super("Binary Tree Inserts");
    }

    public void setData(long p1, long p2)
    {
        numInserts = (int)p1;
    }

    public Tree(int d)
    {
        super("");
        data = d;
    }

    public final void performTest()
    {
        Random r = new Random();
        Tree t = null;
        long _numInserts = numInserts;

        for (int i = 0; i < _numInserts; i++)
        {
            int m = Math.abs(r.nextInt() % 1000);

            if(t == null)
            {
                t = new Tree(m);
            }
            else
            {
                t.insert(m);
            }
        }

        t.infix();
    }

    private final void insert(int n)
    {
        Tree node;

        if(n < data)
        {
            node = left;

            if(node != null)
            {
                node.insert(n);
            }
            else
            {
                node = new Tree(n);
            }
        }
        else if(n > data)
        {
            node = right;

            if(node != null)
            {
                node.insert(n);
            }
            else
            {
                node = new Tree(n);
            }
        }
    }

    private final void infix()
    {
        Tree node = left;

        if(node != null)
        {
            node.infix();
        }

        node = right;

        if(node != null)
        {
            node.infix();
        }
    }
}