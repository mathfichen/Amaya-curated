/*
 * This is an Applet for Amaya.
 *
 * It lauches an user specified action when the New menu option
 * is used.
 */

import thotlib.*;
import amaya.*;

class TestApplet {
    static public int main(String[] args) {
	if (args == null) {
	    System.out.println("TestApplet.main(null)");
	} else {
	    int i;
	    System.out.print("TestApplet.main([");
	    for (i = 0;i < args.length;i++) {
	        if (i != 0) System.out.print(", ");
	        System.out.print(args[i]);
	    }
	    System.out.println("])");
	}
	return(0);
    }
}

