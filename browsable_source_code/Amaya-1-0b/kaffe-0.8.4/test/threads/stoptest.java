import java.util.*;

public class stoptest {

  public static void main(String args[]) {
    TestThread t1 = new TestThread(1, null);
    TestThread t2 = new TestThread(2, t1);
    t1.start();
    t2.start();
  }
}

class TestThread extends Thread {
  int nr;
  Thread tid;

  TestThread(int id, Thread t) {
	nr = id;
	tid = t;
  }

  public void run() {
	System.out.println(nr);
	if (nr == 1) {
		test();
	}
	else {
		tid.stop();
	}
  }

  public synchronized void test() {
	try {
		wait(2000);
	}
	catch (Exception e) {
		System.out.println("BANG!");
		e.printStackTrace();
	}
  }
}
