class NullTest2 {
	public static void main (String args[])
	{
		NullTest2 t = new NullTest2();
		t.handleRequest("one");
		t.handleRequest("two");
	}
	int handleRequest(String site)
	{
		try {
			determineGroup(site).hashCode();
		}
		catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return (0);
	}
	Object determineGroup(String s)
	{
	 // Try to find the appropriate group.  Return NULL if a garbled
	  // request has been sent.
		return (null);
	}
}
