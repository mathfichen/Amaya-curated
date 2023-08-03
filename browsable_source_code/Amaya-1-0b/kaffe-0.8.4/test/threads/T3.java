public class T3 extends Thread {
  String name;
  long counter, delay;

  public T3 ( String name, long delay, int priority ) {
    this.name=name;   this.delay=delay;
    setPriority( priority); start();
  }

  public void run () {
    while (true) {
      if ( (++counter % 100) == 0 ){
	System.out.println( name + " : " + counter);
	try { Thread.sleep( delay); }
	catch ( Exception x ) { x.printStackTrace(); }
      }
    }
  }

  public static void main ( String[] args ) {
    new T3( "A", 500, Thread.NORM_PRIORITY);
    new T3( "  B", 100, Thread.MIN_PRIORITY);
  }
}
