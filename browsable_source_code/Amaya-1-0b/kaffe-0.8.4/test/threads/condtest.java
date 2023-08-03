import java.util.*;

public class condtest {

  public static void main(String args[]) {
    TestThread obj = new TestThread(0, null);
    TestThread t1 = new TestThread(1, obj);
    TestThread t2 = new TestThread(2, obj);
    t2.start();
    t1.start();
  }
}

class TestThread extends Thread {
  int nr;
  TestThread lock;

  TestThread(int id, TestThread obj) {
	nr = id;
	lock = obj;
  }

  public void run() {
	for (;;) {
		System.out.println(nr);
		lock.test();
	}
  }

  public synchronized void test() {
	try {
		wait(1000);
	}
	catch (Exception e) {
		System.out.println("BANG!");
		e.printStackTrace();
	}
  }
}
