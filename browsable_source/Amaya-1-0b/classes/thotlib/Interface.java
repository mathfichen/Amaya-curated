package thotlib;

/*
 * Stub classes to interface the Thotlib interface function from Java
 */

public class Interface {
   public static void main (String arg) {
      // Startup the interface thread.
      Application.Initialize();
      userThreadPool.Initialize();
      new InterfaceThread().InterfaceThread();

      // Sleep for ever
      while (true) {
	 try {
	    Thread.sleep(1000);
	 }
	 catch (InterruptedException e) {}
	 catch (Exception e) {}
	 catch (Throwable e) {}
      }
   }
}

class InterfaceThread extends Thread {

   public void InterfaceThread() {
      this.start();
   }

   public void run() {
      // System.out.println("Thotlib Java Startup ...");
      APIInterface.TtaMainLoop();
      System.out.println("Thotlib Java Stopped");
   }
}

