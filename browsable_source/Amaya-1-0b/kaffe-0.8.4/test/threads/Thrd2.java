import java.util.*;

public class Thrd2 implements Runnable {

        int Count;
        int Id, Pri;

        public void run () {
                try {
                        Thread.currentThread().setPriority( Pri);
                        System.out.println( "starting: " + Id);
                        while ( true ) {
                                if ( (++Count % 100) == 0 ) {
                                        System.out.println( Id + " : " +
Count);
                                }

                                for ( int i = 0; i<1000; i++ ){
                                        Vector v = new Vector(20);
                                }
                                Thread.sleep( (9 - Id) * 10 );
                        }
                }
                catch ( Exception x ) { x.printStackTrace(); }
        }

        public static void main ( String args[] ) {
                Thread t[] = new Thread[8];
                int   pri = Thread.MAX_PRIORITY;

                for ( int i=0; i<t.length; i++ ) {
                        Thrd2 obj = new Thrd2();
                        obj.Id = i;
                        obj.Pri = pri--;

                        t[i] = new Thread( obj);
                        t[i].start();
                }
        }
}
