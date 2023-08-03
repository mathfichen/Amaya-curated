package test;
import java.util.Vector;
public final class TestArray
{
        public static final void
        main( String argv[] )
        {
                String buf[];
                System.out.println( "init" );
                Vector v = new Vector();
                v.addElement( "one" );
                v.addElement( "two" );
                v.addElement( "three" );
                buf = new String[v.size()];
                System.out.println( "about to call copyinto" );
                v.copyInto( buf );
                for ( int i = 0; i < buf.length; i++ )
                        System.out.println(buf[i]);
                System.out.println( "copyinto with three strings passed" );
                System.out.println( "adding Integer" );
                v.addElement( new Integer( 4 ) );
                System.out.println( "about to call copyinto" );
                buf = new String[v.size()];
                v.copyInto( buf );
                for ( int i = 0; i < buf.length; i++ )
                        System.out.println(buf[i]);
                System.out.println( "ending O.K." );
        }
}
