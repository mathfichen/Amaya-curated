class BubbleSortAlgorithm
    extends SortAlgorithm
{
    public BubbleSortAlgorithm()
    {
        super("BubbleSortAlgorithm");
    }

    public final void performTest()
    {
        int _a[] = a;
        int length = _a.length;

    	for(int i = length; --i >= 0;)
    	{
	        for(int j = 0; j < i; j++)
	        {
    		    if(_a[j] > _a[j+1])
	    	    {
		            int T = _a[j];

	    	        _a[j]   = _a[j+1];
    	    	    _a[j+1] = T;
	    	    }
	        }
        }
    }
}
