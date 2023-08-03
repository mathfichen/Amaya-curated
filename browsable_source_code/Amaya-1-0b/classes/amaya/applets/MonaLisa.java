/*
 * This is an Applet for Amaya.
 *
 * It changes the icon of the Stop button to be an image fetched
 * from the local disk.
 */

import thotlib.*;
import amaya.*;

class MonaLisa {
    static public int main(int document) {
	try {
	   Thread.sleep(3000);
	}
	catch (InterruptedException e) {}
	catch (Exception e) {}
	catch (Throwable e) {}

	long mona = thotlib.APIInterface.TtaLoadImage("Mona Lisa",
		    "/tmp/mona-ssmall.gif");

	if (mona == 0) {
	       System.out.println("Cannot grab Mona Lisa");
	       return(-1);
	} else if (APIInterface.TtaGetViewFrame(document,1) != 0)
	       APIInterface.TtaChangeButton(document, 1, 1, mona);

        return(0);
    }
}

