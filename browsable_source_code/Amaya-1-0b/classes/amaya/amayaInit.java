package amaya;
import thotlib.*;

public class amayaInit {
   public static void main (String arg) {
      //System.out.println("amayaInit.main()");

      String properties = 
           thotlib.APIRegistry.TtaGetEnvString("JAVA_PROPERTIES");
      HTTPAccess.Initialize(properties);
   }

   public static void Stop () {
      HTTPAccess.Stop();
   }
}

