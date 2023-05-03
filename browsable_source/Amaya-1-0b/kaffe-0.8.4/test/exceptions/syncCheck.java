public class syncCheck {
    syncCheck()
    { }
    synchronized public void f(int i)
    {
        syncCheck s;
        s = (i == 0) ? null : this;
        s.f(i - 1);
    }
    synchronized public void l()
    {
	System.out.println("Sync okay");
    }
    public static void main(String[] args)
    {
        syncCheck s = new syncCheck();

	try {
		s.f(10);
	}
	catch (Exception e) {
		s.l();
	}
    }
}
