public class inf {
    public static void main(String[] args)
    {
        double big = Double.POSITIVE_INFINITY, small = Double.NEGATIVE_INFINITY;
        System.out.println("Does this interpreter work for positive infinity?");
        if (1.0 < big)
        {
            System.out.println("Yes!");
        }
        else
        {
            System.out.println("No!");
        }
        System.out.println("How about negative infinity?");
        if (1.0 > small)
        {
            System.out.println("Yes!");
        }
        else
        {
            System.out.println("No!");
        }
        if (Double.isNaN(big))
        {
            System.out.println("+Inf is NaN");
        }
        if (Double.isNaN(small))
        {
            System.out.println("-Inf is NaN");
        }
    }
}
