import java.net.URL;

class Stock
{

        public static void main(String args[]) throws Throwable
        {
                System.out.println( "One" );
                getQuote( "PARQ" );
                System.out.println( "Two" );
        }

        public static void getQuote( String sym ) throws Throwable
        {
                URL url;

                System.out.println( "Got here with arg " + sym );

                try {
                        url = new URL( "http://www.village.org/" );
                        System.out.println( "Hi\n" );
                        System.out.println( url.getContent().toString() );
                        System.out.println( "Bye\n" );
                }
                catch (java.io.IOException e) {
                }
                catch (java.net.MalformedURLException e) {
                }
        }
}
