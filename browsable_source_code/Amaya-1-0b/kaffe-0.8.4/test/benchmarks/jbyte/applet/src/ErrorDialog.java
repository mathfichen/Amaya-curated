/**
* ErrorDialog
*
* A dialog to notify of exceptions and other errors.
*/

import java.awt.*;

class ErrorDialog extends Dialog
{

int msg_width;          // Width of String message.
FontMetrics fMetrics;   // To get width of message in pixels.


ErrorDialog(Frame parent, String message)
{

    super(parent, "jBYTEmark", true);

    // Use FontMetrics to find width of string for window sizing.

    fMetrics = getFontMetrics(getFont());
    msg_width = fMetrics.stringWidth(message);
    if (msg_width < 125)
        msg_width = 125;
    reshape(100, 100, insets().left + insets().right + msg_width + 30,
            100);

    add("Center", new Label(message));
    Panel OKPanel = new Panel();
    OKPanel.add(new Button("OK"));
    add("South", OKPanel);

}

public boolean action(Event event, Object arg)
{
    if ("OK".equals(arg))
    {
        dispose();
        return true;
    }

   	return super.handleEvent(event);
}

public boolean handleEvent(Event event)
{
    if (event.id == Event.WINDOW_DESTROY)
    {
        dispose();
    	return true;
    }

    return super.handleEvent(event);
}

}
