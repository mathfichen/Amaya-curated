class NullTest {
	int val;
	static NullTest obj;
	public static void main (String args[]) {
		try {
			obj.val = 10;
		}
		catch (Exception c) {
			System.out.println("Catch");
		}
	}
}

