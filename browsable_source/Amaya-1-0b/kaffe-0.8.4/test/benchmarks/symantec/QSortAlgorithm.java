public class QSortAlgorithm
    extends SortAlgorithm
{
    public QSortAlgorithm()
    {
        super("Quick Sort");
    }

    private final void QuickSort(int a[], int lo0, int hi0)
    {
        int lo = lo0;
        int hi = hi0;
        int mid;
        int _a[] = a;

        if( hi0 > lo0)
        {
            mid = _a[(lo0 + hi0 ) / 2];

            while(lo <= hi)
            {
                while((lo < hi0) && (_a[lo] < mid))
                {
                    ++lo;
                }

                while((hi > lo0) && (_a[hi] > mid))
                {
                    --hi;
                }

                if(lo <= hi)
                {
                    swap(a, lo, hi);
                    ++lo;
                    --hi;
                }
            }

            if(lo0 < hi)
            {
                QuickSort(a, lo0, hi);
            }

            if(lo < hi0)
            {
                QuickSort(a, lo, hi0);
            }
        }
    }

    private final void swap(int _a[], int i, int j)
    {
        int T;

        T = _a[i];
        _a[i] = _a[j];
        _a[j] = T;
    }

    public final void performTest()
    {
        QuickSort(a, 0, a.length - 1);
    }
}