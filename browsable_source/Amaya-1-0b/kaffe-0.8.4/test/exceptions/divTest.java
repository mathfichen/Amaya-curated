class divTest {
	public static void main (String args[]) {
		try {
			int one = 1;
			int zero = 0;
			int result = one / zero;
		}
		catch (Exception c) {
			System.out.println("Catch");
			c.printStackTrace();
		}
	}
}

