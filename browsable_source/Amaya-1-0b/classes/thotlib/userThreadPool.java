package thotlib;
import java.io.*;
import thotlib.*;


public class userThreadPool {
   static protected String signatures[] = null;
   static protected ThreadGroup threadgroup = null;
   static protected int maxThreads = 10;
   static protected userThread[] Threads = null;

   /*
    * Initialize : create a Thread group and allocate a few
    *      server threads within it.
    */
   static public void Initialize() {
        // System.out.println("userThreadPool.Initialize()");

        if (threadgroup != null) return;

	threadgroup = new ThreadGroup("user Threads");
	maxThreads = 10;
	Threads = new userThread[maxThreads];

	signatures = new String[5];
	signatures[0] = "(I)I";
	signatures[1] = "(I)V";
	signatures[2] = "([Ljava/lang/String;)V";
	signatures[3] = "([Ljava/lang/String;)I";
	signatures[4] = "()V";

	for (int i = 0;i < maxThreads;i++)
            Threads[i] = null;
   }

   /*
    * Name : returns the name of one of the user given it's number.
    */
   static public String Name(int i) {
       if (threadgroup == null) Initialize();
       String res = null;

       if ((i >= 0) && (i < maxThreads)) {
	   if (Threads[i] != null) res = Threads[i].getName();
       }
       if (res != null)
	   System.out.println("userThreadPool.name(" + i + ")" + res);

       return(res);
   }

   /*
    * Kill : kills one of the threads
    */
   static public void Kill(int i) {
       if (threadgroup == null) Initialize();
       System.out.println("userThreadPool.Kill(" + i + ")");

       if ((i >= 0) && (i < maxThreads)) {
	   if (Threads[i] != null) {
	       Threads[i].suspend();
	       Threads[i].stop();
	   }
	   Threads[i] = null;
       }
   }

   /*
    * Suspend : suspends one of the threads
    */
   static public void Suspend(int i) {
       if (threadgroup == null) Initialize();
       System.out.println("userThreadPool.Suspend(" + i + ")");

       if ((i >= 0) && (i < maxThreads)) {
	   if (Threads[i] != null)
	       Threads[i].suspend();
       }
   }

   /*
    * Resume : resumes one of the threads
    */
   static public void Resume(int i) {
       if (threadgroup == null) Initialize();
       System.out.println("userThreadPool.Resume(" + i + ")");

       if ((i >= 0) && (i < maxThreads)) {
	   if (Threads[i] != null)
	       Threads[i].resume();
       }
   }

   /*
    * Stop : kill all the server threads.
    */
   static public void Kill(Thread thread) {
       if (threadgroup == null) Initialize();
       // System.out.println("userThreadPool.Kill(" + thread.getName() + ")");

       for (int i = 0;i < maxThreads;i++)
           if (Threads[i] == thread) {
	       Threads[i].suspend();
	       Threads[i].stop();
	       Threads[i] = null;
	   }
       System.out.println("userThreadPool.Kill : not found");
   }

   /*
    * Stop : kill all the users threads.
    */
   static public void StopAll() {
       if (threadgroup == null) Initialize();
       // System.out.println("userThreadPool.StopAll()");

       for (int i = 0;i < maxThreads;i++)
           Threads[i].stop();
   }

   /*
    * LaunchJavaApplet : initialize a new thread and start it on the main()
    *                    of the given class.
    */
   public static int LaunchJavaApplet(String classname, int doc, String[] args) {
        if (threadgroup == null) Initialize();

	for (int i = 0;i < maxThreads;i++)
            if (Threads[i] == null) {
	        Threads[i] = new userThread(i, classname, doc, args);
		break;
	    }
       
        return(0);
   }
}

class userThread extends Thread {
   protected int no;
   protected String classname = null;
   protected int doc = 0;
   protected String[] argv = null;

   /*
    * Initialization method, start a new thread...
    */
   public userThread(int no, String classname, int doc, String[] argv) {
      super(userThreadPool.threadgroup,
            no + " : " + classname + "(" + doc + ")");
      this.no = no;
      this.classname = classname;
      this.doc = doc;
      this.argv = argv;
      this.start();
   }

   public void run() {
        if (this.classname != null) {
	    int status = -1;
	    int attempt = 0;

	    thotlib.APIInterface.TtaSetStatus(this.doc, 1,
		"Starting " + this.classname + " applet...", "");
	    do {
		try {
		    status = Extra.JavaStartApplet(this.classname, 
				   userThreadPool.signatures[attempt],
				   this.doc, this.argv);
                    break;
		} catch (NoSuchMethodError e) {
		    attempt++;
		    if (attempt >= userThreadPool.signatures.length) {
			thotlib.APIInterface.TtaSetStatus(this.doc, 1,
			    this.classname + " : static method main() not found",
			    "");
			userThreadPool.Threads[this.no] = null;
			return;
		    }
		} catch (ClassNotFoundException e) {
		    thotlib.APIInterface.TtaSetStatus(this.doc, 1,
			this.classname + " : class not found", "");
		    userThreadPool.Threads[this.no] = null;
		    return;
		} catch (Exception e) {
System.out.println("userThread(" + no + ") : got an exception");
		    thotlib.APIInterface.TtaSetStatus(this.doc, 1,
			this.classname + " : got an exception", "");
		    userThreadPool.Threads[this.no] = null;
		    return;
		}
	    } while (attempt < userThreadPool.signatures.length);
	    thotlib.APIInterface.TtaSetStatus(this.doc, 1,
		this.classname + " applet finished : status " + status, "");
	}
	userThreadPool.Threads[this.no] = null;
   }

}

