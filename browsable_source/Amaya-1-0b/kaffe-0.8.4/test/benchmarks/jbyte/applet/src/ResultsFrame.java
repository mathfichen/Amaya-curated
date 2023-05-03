/**
* ResultsFrame
*
* A Frame class to run and display jBYTEmark test results.
*/

import java.awt.*;

class ResultsFrame extends Frame
{


// Declare controls, including arrays for labels and textfields.
// Also other variables.

Label [] testLabel = new Label [10];          // Labels for 10 tests.
TextField [] testResult = new TextField [10]; // Ten result fields.
Label intIndexLabel;                          // Label, integer result.
TextField intIndexResult;                     // Integer result field.
Label FPIndexLabel;                           // Label, floating point.
TextField FPIndexResult;                      // Fl.Pnt. result field.
Button startButton;                           // Button to start test.
Button closeButton;                           // Button, close window.
Label timeToTestLabel;                        // Label, estimated time.
Label indexInfoLabel1;                        // Info on indexing.
Label indexInfoLabel2;                        // Info on indexing.
Label separatorLabel1;                         // "horizontal rule"
Label separatorLabel2;                         // "horizontal rule"

long clock_tick;                              // Accuracy of Java timer.
long time_estimate;                           // Estimated test time.
String time_msg;                              // Msg to display time est.

BmarkTest test;         // The current test object.

/**
* constructor (dummy version)
*/

ResultsFrame(boolean dummy)
{
}

/**
* constructor
*/

ResultsFrame()
{
    super("jBYTEmark");

    // Set up frame.

    setLayout(null);
    setResizable(false);            // Don't resize this window.
    addNotify();                    // Create native peer.
    resize(insets().left + insets().right + 299, insets().top
        + insets().bottom + 350);

    // Set up labels and result textfields for ten tests and two indices.

    int from_top = 10;

    for (int i = 0; i < 10; i++)
    {
        testResult[i] = new TextField(8);
        testResult[i].setEditable(false);       // No editing textfield.
        add(testResult[i]);
        testResult[i].reshape(insets().left + 10, insets().top
            + from_top, 55, 18);

        testLabel[i] = new Label(BMglobals.testnames[i]);
        add(testLabel[i]);
        testLabel[i].reshape(insets().left + 70, insets().top
            + from_top, 125, 18);
        from_top += 20;
    }

    // Label with "-------------" separator.

    separatorLabel1 = new Label("------------");
    add(separatorLabel1);
    separatorLabel1.reshape(insets().left + 0, insets().top
        + from_top - 3, 65, 9);

    separatorLabel2 = new Label("---------------------");
    add(separatorLabel2);
    separatorLabel2.reshape(insets().left + 70, insets().top
        + from_top - 3, 172, 9);

    // Create two index result fields with labels.

    from_top += 10;
    intIndexResult = new TextField(8);
    intIndexResult.setEditable(false);       // No editing textfield.
    add(intIndexResult);
    intIndexResult.reshape(insets().left + 10, insets().top
        + from_top, 55, 18);

    intIndexLabel = new Label("Integer Index");
    add(intIndexLabel);
    intIndexLabel.reshape(insets().left + 70, insets().top
        + from_top, 172, 18);
    from_top += 20;

    FPIndexResult = new TextField(8);
    FPIndexResult.setEditable(false);       // No editing textfield.
    add(FPIndexResult);
    FPIndexResult.reshape(insets().left + 10, insets().top
        + from_top, 55, 18);

    FPIndexLabel = new Label("Floating Point Index");
    add(FPIndexLabel);
    FPIndexLabel.reshape(insets().left + 70, insets().top
        + from_top, 172, 18);

    // Create start test and close window buttons.

    startButton = new Button("Start");
    add(startButton);
    startButton.reshape(insets().left + 220, insets().top + 40,
                        50,20);
    startButton.disable();          // Disable until ready.

    closeButton = new Button("Close");
    add(closeButton);
    closeButton.reshape(insets().left + 220, insets().top + 80,
                        50,20);

    // Determine accuracy of Java timer on test system and
    // set test run time for 100 times that minimum tick.

    clock_tick = ClockTest.getClockTick();
    BMglobals.minTicks = 100 * clock_tick;

    // Estimate time to test. Timer tick * 100 for each test,
    // around 7 executions of each test including adjustment,
    // and ten tests in all. Divide by 1000 to get seconds
    // from milliseconds

    time_estimate = clock_tick * 100 * 7 * 10 / 1000;
    time_estimate /= 60;        // Convert to minutes.
    time_estimate += 1;         // One minute fudge factor.

    // Display message about time to test.

    time_msg = "Java timer accuracy: " + String.valueOf(clock_tick)
                + " ms.";
    time_msg = time_msg + " Estimated test time: "
                + String.valueOf(time_estimate) + " min.";

    timeToTestLabel = new Label(time_msg);
    add(timeToTestLabel);
    from_top += 30;
    timeToTestLabel.reshape(insets().left, insets().top
        + from_top, 300, 18);

    // Display index system information.

    time_msg = "Index of 1.0 based on a Dell XPS 90-MHz Pentium";
    indexInfoLabel1 = new Label(time_msg);
    add(indexInfoLabel1);
    from_top += 18;
    indexInfoLabel1.reshape(insets().left, insets().top
        + from_top, 300, 18);

    time_msg = "running Symantec Cafe 1.0 under Windows 95.";
    indexInfoLabel2 = new Label(time_msg);
    add(indexInfoLabel2);
    from_top += 18;
    indexInfoLabel2.reshape(insets().left, insets().top
        + from_top, 300, 18);

    show();             // Show window with disabled "Start" button
                        // while first test class is about to load.

    // Make sure first test is ready to go with all necessary classes
    // delivered over the wire (by instantiating and accessing a variable).

    ErrorDialog ed = new ErrorDialog(this, ""); // Make sure class is loaded.
    ed = null;
    double d = BMglobals.NUMTESTS;
    RandNum random = new RandNum();
    random = null;
    test = new NumericSortTest();
    d = test.mean;

    startButton.enable();          // Enable now that first test ready.

}

public synchronized void show()
{
    move(50, 50);
    super.show();
}

public boolean handleEvent(Event event)
{
    if (event.id == Event.ACTION_EVENT && event.target == startButton)
    {
        setCursor(WAIT_CURSOR); // Usually the hour glass.
        runTest();           // Start test.
        setCursor(DEFAULT_CURSOR);
        return true;
    }
   	else
    	if (event.id == Event.ACTION_EVENT
    	    && event.target == closeButton)
	    {
	        dispose();
   	        return true;
   	    }
   	else
    	if (event.id == Event.WINDOW_DESTROY)
	    {
	        dispose();
   	        return true;
   	    }

   	return super.handleEvent(event);
}

/*
* runTest()
*
* Run all ten tests five times (more if results not consistent)
* and put results in appropriate textfields in this frame.
*/

private void runTest()
{
    double rsltIndex;       // Resulting index of test.
    double intIndex;        // Integer index.
    double FPIndex;         // Floating-point index.
    int testtype;           // 0=Integer; 1=FP.
    boolean showIndexes;    // True if we can show indexes.

    // Initialize the index values.

    intIndex = 1.0;
    FPIndex = 1.0;
    rsltIndex = 0;
    testtype = 0;
    test = null;
    showIndexes = true;     // Assume we can report two indexes.

    // Disable "Start" and "Close" buttons for duration of test.

    startButton.disable();
    closeButton.disable();

    // Clear out text fields (for reruns).

    for (int i = 0; i < 10; i++)
    {
        testResult[i].setText("");
        testResult[i].setBackground(Color.lightGray);
    }

    intIndexResult.setText("");
    intIndexResult.setBackground(Color.lightGray);
    FPIndexResult.setText("");
    FPIndexResult.setBackground(Color.lightGray);

    // Loop through all the tests to perform.

    for (int i = 0; i < BMglobals.NUMTESTS; i++)
    {
        // Highlight result field for running test. The event
        // passing seems to miss occasionally, so we set the
        // background color twice.

        testResult[i].setBackground(Color.white);
        testResult[i].setText("run...");

        switch (i)
        {   case BMglobals.TF_NUMSORT:
                test = new NumericSortTest();
                testtype = 0;                // Integer.
                break;

            case BMglobals.TF_SSORT:
                test = new StringSortTest();
                testtype = 0;                // Integer.
                break;

            case BMglobals.TF_BITOP:
                test = new BitOpsTest();
                testtype=0;                  // Integer.
                break;

            case BMglobals.TF_FPEMU:
                test = new EMFloatTest();
                testtype = 0;                // Integer.
                break;

            case BMglobals.TF_FFPU:
                test = new FourierTest();
                testtype = 1;                // FP.
                break;

            case BMglobals.TF_ASSIGN:
                test = new AssignmentTest();
                testtype = 0;                // Integer.
                break;

            case BMglobals.TF_IDEA:
                test = new IDEATest();
                testtype = 0;                // Integer.
                break;

            case BMglobals.TF_HUFF:
                test = new HuffmanTest();
                testtype = 0;                // Integer.
                break;

            case BMglobals.TF_NNET:
                test = new NeuralNetTest();
                testtype = 1;                // FP.
                break;

            case BMglobals.TF_LU:
                test = new LuTest();
                testtype = 1;                // FP.
                break;
        }

        try
        {
            test.benchWithConfidence();     // Start test.
        }
        catch (OutOfMemoryError e)  // Handle test errors/exceptions.
        {
            String msg = e.getMessage();
            ErrorDialog ed = new ErrorDialog(this, msg);
            ed.show();
        }

        if (test.testConfidence)
        {
            // Calculate results and accumulate indexes.

            rsltIndex = test.mean / test.base_iters_per_sec;
            // testResult[i].setText(Double.toString(test.scores[4]));
            testResult[i].setText(Double.toString(rsltIndex));

            if (testtype == 0)
                intIndex *= rsltIndex;
            else
                FPIndex *= rsltIndex;
        }
        else
        {
            testResult[i].setText("NOCONF");
            showIndexes = false;
        }

        // Destroy current test object and invoke garbage collection.

        test = null;
        System.gc();
    }

    // Show indexes if allowed (only if all ten tests successful).

    if (showIndexes)
    {
        try
        {
            intIndex = Math.pow(intIndex,.1428571); // 7th root
            FPIndex = Math.pow(FPIndex,.3333333);
        }

        catch (ArithmeticException e)
        {
            String msg = "Error calculating test index -- Math.pow().";
            ErrorDialog ed = new ErrorDialog(this, msg);
            ed.show();
        }

        // Display two result indexes.

        intIndexResult.setText(Double.toString(intIndex));
        intIndexResult.setBackground(Color.white);
        FPIndexResult.setText(Double.toString(FPIndex));
        FPIndexResult.setBackground(Color.white);
    }

    // Enable "Start" and "Close" buttons now that test is over.

    startButton.enable();
    closeButton.enable();
}

}
