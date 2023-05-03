public class ThreadFreeBug
{
    public static void main(String args[])
    {
        MemoryHog hog;
 
        while (true)
        {
            hog = new MemoryHog();
            hog.start();
            Thread.yield();
            hog.stop();
        }
    }
}
 
class MemoryHog extends Thread
{
    MemoryUser mem = new MemoryUser();
 
    public void run()
    {
        while (true)
            try { Thread.sleep(1000); } catch (InterruptedException ie) { }
    }
}

class MemoryUser
{
    byte[] arr = new byte[100000];
}
