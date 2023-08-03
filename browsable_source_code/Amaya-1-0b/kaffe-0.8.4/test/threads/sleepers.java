public class sleepers implements Runnable
{
 int time;

 public static void main(String args[])
 {
  sleepers s = new sleepers();
  Thread t1 = new Thread(s, "1");
  Thread t2 = new Thread(s, "2");
  t1.start();
  t2.start();
 }

 public void run()
 {
  for (;;) {
    System.out.println(Thread.currentThread().getName());
    try {
      time += 1000;
      Thread.sleep(time);
    }
    catch (Exception e) {
    }
  }
 }
}
