class throwTest {
	public static void main (String args[]) {
		try {
			Exception err = new Exception("Testing!!"); 
			throw err;
		}
		catch (Exception c) {
			System.out.println("Catch");
			c.printStackTrace();
		}
	}
}

