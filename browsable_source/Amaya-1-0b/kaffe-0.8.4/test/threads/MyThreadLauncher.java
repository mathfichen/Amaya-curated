class MyThread implements Runnable
{
   String name;
   MyThread (String s)
   {
      System.out.println ("construct");
      name = s;
   }
   public void start()
   {
      System.out.println ("Start called.");
   }
   public void run()
   {
      System.out.println ("MyThread.run() enter");
      System.out.println (name);
      System.out.println ("MyThread.run() exit");
   }
}

public class MyThreadLauncher
{
   public static void main (String args[])
   {
      System.out.println ("main start");
      MyThread mt = new MyThread("this is the arg");
      System.out.println ("object made");
      Thread t = new Thread (mt, "MyThread");
      System.out.println ("thread made");
      t.start();
      System.out.println ("Thread started");
   }
}
