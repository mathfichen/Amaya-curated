package thotlib;
import java.util.*;

/*
 * Stub classes to interface the Thotlib application accesses from Java
 */


public class Application {
    /*
     * The persistancy_table is needed to be sure that object
     * otherwise only referenced from the C code won't be
     * garbage-collected.
     */
    private static Hashtable persistancy_table = null;
    private static int counter = 0;

    static void makePersistant(Object obj) {
        if (persistancy_table == null) Initialize();

	persistancy_table.put(String.valueOf(counter++), obj);
    }

    static public void Initialize() {
        if (persistancy_table != null) return;
	persistancy_table = new Hashtable();
    }
}

