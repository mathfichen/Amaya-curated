class BidirectionalBubbleSortAlgorithm
    extends SortAlgorithm
{
    public BidirectionalBubbleSortAlgorithm()
    {
        super("Bidirectional Bubble Sort");
    }

    public final void performTest()
    {
	    int j;
    	int limit = a.length;
	    int st = -1;
	    int _a[] = a;

    	while(st < limit)
    	{
	        boolean flipped = false;
    	    st++;
	        limit--;

	        for (j = st; j < limit; j++)
	        {
		        if (_a[j] > _a[j + 1])
		        {
        		    int T = _a[j];

		            _a[j] = _a[j + 1];
        		    _a[j + 1] = T;
		            flipped = true;
        		}
	        }

	        if(!flipped)
	        {
        		return;
	        }

	        for(j = limit; --j >= st;)
	        {
		        if(_a[j] > _a[j + 1])
		        {
        		    int T = _a[j];

		            _a[j] = _a[j + 1];
        		    _a[j + 1] = T;
        		    flipped = true;
        		}
	        }

	        if(!flipped)
	        {
        		return;
    	    }
	    }
    }
}
