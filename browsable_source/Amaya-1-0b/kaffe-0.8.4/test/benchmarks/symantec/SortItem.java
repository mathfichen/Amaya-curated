public class SortItem
{
    int arr[];
    int h1 = -1;
    int h2 = -1;
    String algName;
    SortAlgorithm algorithm;
    int size;

    void scramble(int s)
    {
        size = s;
        java.util.Random r = new java.util.Random();

	    int a[] = new int[size / 2];
      	double f = Math.abs(r.nextDouble()) / (double) size;


	    for(int i = size; --i >= 0;)
	    {
	        a[i] = (int)(i * f);
    	}

	    for(int i = size; --i >= 0;)
	    {
	        int j = (int)(i * Math.random());
    	    int t = a[i];

	        a[i] = a[j];
    	    a[j] = t;
	    }

    	arr = a;
    }
}