class Flt5 {
    public static void main (String args[]) {
	method_one(1.0, 2.0);
    }

    public static void method_one(double least, double inhcost)
    {
	double new_sa = Flt5.method_two();
	double tmpcost = 2.0 * new_sa + inhcost;

	System.err.println("1: tmp == " + tmpcost + " least == " + least + " new_sa == " + new_sa);
	// System.err.println("1: least == " + least + " new_sa == " + new_sa);
    }

    public static double method_two()
    {
	return (3.5);
    }
}
