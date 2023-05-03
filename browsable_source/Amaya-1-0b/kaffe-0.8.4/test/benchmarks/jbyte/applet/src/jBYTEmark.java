import java.awt.*;

/**
*jBYTEMmark
*
* The applet that serves as a shell for running jBYTEmark
* on the BYTE Site. It's basically just a button that fills
* the applet window.
* BYTEmark port to Java by Rick Grehan and Dave Rowell, BYTE
* Magazine.
*/

/**
* DISCLAIMER
* The source, executable, and documentation files that comprise the
* jBYTEmark benchmarks are made available on an "as is" basis. This means
* that we at BYTE Magazine have made every reasonable effort to verify
* that there are nor errors in the source and executable code. We cannot,
* however, guarantee tha the programs are error-free. Consequently, McGraw-Hill
* and BYTE Magazine make no claims in regard to the fitness of the source
* code, executable code, and documentation of the BYTEmark. Furthermore,
* BYTE Magazine, McGraw-Hill, and all employees of McGraw-Hill cannot be
* held responsible for any damages resulting from the use of this code
* or the results obtained from using this code.
*/

public class jBYTEmark extends java.applet.Applet
{

// Declare controls.

Button TestButton;
int app_width = 150;        // Width of applet and button
int app_height = 25;        // Height of same.
BmarkTest test;             // Test object (here only to affect
                            // how applet displays while loading.
ResultsFrame testFrame;     // Windows that displays actual test.

/**
* init()
*
* Set up controls in applet window, a label and a button you
* "push" to start the test.
*/

public void init()
{
    // Setup controls.


    setLayout(null);
    resize(app_width,app_height);        // Size applet.
    TestButton = new Button("Loading jBYTEmark v.0.9");
    add(TestButton);
    TestButton.disable();
    TestButton.reshape(0,0,app_width,app_height);
    this.show();

    new ResultsFrame(false);        // Call dummy constructor to so that.
                                    // class will be loaded before "Run
                                    // Test" button activates.
    double d = ClockTest.getClockTick();   // Same with ClockTest class.

    // Enable Run button.

    TestButton.setLabel("Run jBYTEmark v.0.9");
    TestButton.enable();
}

/**
* ShowResultsFrame()
*
* Display frame for test results.
*/

public void ShowResultsFrame()
{
    testFrame = new ResultsFrame(); // Instantiate popup window for test.
    testFrame.show();
}

/**
* handleEvent()
*
* Display frame to run test and show results.
*/

public boolean handleEvent(Event event)
{
    // Was test button pressed?

    if (event.id == Event.ACTION_EVENT && event.target == TestButton)
    {
        ShowResultsFrame();     // Button pressed, run test frame.
        return true;
    }

    return super.handleEvent(event);    // Some other event.
}

}
