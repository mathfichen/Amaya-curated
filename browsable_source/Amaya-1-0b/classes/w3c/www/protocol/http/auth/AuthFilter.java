// AuthFilter.java
// $Id: AuthFilter.java,v 1.2 1997/03/27 13:57:49 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http.auth;

import java.awt.*;
import java.io.*;

import w3c.tools.codec.*;
import w3c.www.protocol.http.*;
import w3c.www.http.*;

class UserField extends TextField {
    PasswordPrompter prompter = null;

    public boolean keyDown(Event evt, int key) {
	if ( key == '\t' ) {
	    prompter.focusPassword();
	    return true;
	}
	return super.keyDown(evt, key);
    }

    UserField(PasswordPrompter prompter, String txt, int len) {
	super(txt, len);
	this.prompter = prompter;
    }

}

class PasswordField extends TextField {
    PasswordPrompter prompter = null;

    public boolean keyDown(Event evt, int key) {
	if ((key == '\n') || (key == '\r')) {
	    prompter.done(PasswordPrompter.EVT_OK);
	    return true;
	}
	return super.keyDown(evt, key);
    }

    PasswordField(PasswordPrompter prompter, String txt, int len) {
	super(txt, len);
	setEchoCharacter('*');
	this.prompter = prompter;
    }
}

class PasswordPrompter extends Panel {
    TextField txtUser     = null;
    TextField txtPassword = null;
    Button    butOk       = null;
    Button    butCancel   = null;

    String user     = null;
    String password = null;

    static final int EVT_OK     = 1;
    static final int EVT_CANCEL = 2;
    int evt = -1;

    protected synchronized boolean waitForCompletion() {
	while ( true ) {
	    // Wait for next event:
	    while ( evt < 0 ) {
		try {
		    wait();
		} catch (InterruptedException ex) {
		}
	    }
	    // Handle the event:
	    switch(evt) {
	      case EVT_OK:
		  return true;
	      case EVT_CANCEL:
		  return false;
	    }
	}
    }

    protected synchronized void done(int evt) {
	this.evt = evt;
	notifyAll();
    }

    protected void focusPassword() {
	txtPassword.requestFocus();
    }

    public boolean action(Event evt, Object what) {
	int e = -1;
	if ( evt.target == butOk ) {
	    e = EVT_OK;
	} else if ( evt.target == butCancel ) {
	    e = EVT_CANCEL;
	} else {
	    return super.action(evt, what);
	}
	// We are done with this dialog:
	done(e);
	return true;
    }

    /**
     * Get the entered user name.
     * @return The user name as a String.
     */

    public String getUser() {
	return user;
    }

    /**
     * Get the entered password.
     * @return The password as a String.
     */

    public String getPassword() {
	return password;
    }

    /**
     * Run the dialog, as if modal.
     * @return A boolean <strong>false</strong> if interaction was canceled,
     * <strong>true</strong> otherwise.
     */

    public boolean prompt() {
	Frame toplevel = new Frame("Authentication Required");
	toplevel.add("Center", this);
	toplevel.pack();
	toplevel.show();
	// Set focus to the user name:
	txtUser.requestFocus();
	// Wait for completion, pack up the result, and delete GUI:
	boolean result = waitForCompletion();
	this.user      = txtUser.getText();
	this.password  = txtPassword.getText();
	toplevel.hide();
	toplevel.dispose();
	return result;
    }

    PasswordPrompter(Request request, Reply reply) {
	// Setup the layout:
	super();
	GridBagLayout gb = new GridBagLayout();
	setLayout(gb);
	// Create the title label:
	HttpChallenge challenge = (request.hasProxy()
				   ? reply.getProxyAuthenticate()
				   : reply.getWWWAuthenticate());
	Label label = new Label(challenge.getScheme()
				+ " authentication for "
                                + challenge.getAuthParameter("realm"));
	GridBagConstraints row = new GridBagConstraints();
	row.gridwidth = GridBagConstraints.REMAINDER;
	row.anchor    = GridBagConstraints.WEST;
	gb.setConstraints(label, row);
	add(label);
	// Create the entries:
	GridBagConstraints ct = new GridBagConstraints();
	ct.gridx   = GridBagConstraints.RELATIVE ;
	ct.anchor  = GridBagConstraints.EAST ;
	ct.weighty = 1.0 ;
	GridBagConstraints cv = new GridBagConstraints() ;
	cv.gridx     = GridBagConstraints.RELATIVE ;
	cv.gridwidth = GridBagConstraints.REMAINDER ;
	cv.fill      = GridBagConstraints.HORIZONTAL ;
	cv.anchor    = GridBagConstraints.WEST ;
	cv.weightx   = 1.0 ;
	cv.weighty   = 1.0 ;
	// Create user entry:
	label = new Label("User:", Label.LEFT);
	gb.setConstraints(label, ct);
	add(label);
	txtUser = new UserField(this, "", 32);
	gb.setConstraints(txtUser, cv);
	add(txtUser);
	// Create password entry:
	label = new Label("Password:", Label.LEFT);
	gb.setConstraints(label, ct);
	add(label);
	txtPassword = new PasswordField(this, "", 32);
	gb.setConstraints(txtPassword, cv);
	add(txtPassword);
	// Add the row of buttons:
	butOk = new Button("Ok");
	row.anchor    = GridBagConstraints.EAST;
	row.weightx   = 1.0;
	row.gridwidth = GridBagConstraints.RELATIVE;
	gb.setConstraints(butOk, row);
	add(butOk);
	butCancel = new Button("Cancel");
	row.anchor    = GridBagConstraints.WEST;
	row.gridwidth = GridBagConstraints.REMAINDER;
	gb.setConstraints(butCancel, row);
	add(butCancel);
    }
}

public class AuthFilter implements PropRequestFilter {
    /**
     * the HttpManager that installed us.
     */
    protected HttpManager manager = null;

    /**
     * PropRequestFilter implementation - Initialize the filter.
     * Time to register ourself to the HttpManager.
     * @param manager The HTTP manager that is initializing ourself.
     */

    public void initialize(HttpManager manager) {
	this.manager = manager;
	// We install ourself as a global filter, we are cool !
	manager.setFilter(this);
	manager.setAllowUserInteraction(true);
    }

    /**
     * This filter doesn't handle exceptions.
     * @param request The request that triggered the exception.
     * @param ex The triggered exception.
     * @return Always <strong>false</strong>.
     */

    public boolean exceptionFilter(Request request, HttpException ex) {
	return false;
    }

    /**
     * On the way out, we let the request fly through.
     * @param request The request about to be emitted.
     */

    public Reply ingoingFilter(Request request) {
	return null;
    }

    /**
     * Catch any authentication requirement, and fullfill it with user's help.
     * This method trap all request for authentication, and pops up a
     * dialog prompting for the user's name and password.
     * <p>It then retries the request with the provided authentication
     * informations.
     * @param request The request that requires authentication.
     * @param reply The original reply.
     * @throw HttpException If some HTTP error occurs.
     */

    public Reply outgoingFilter(Request request, Reply reply) 
	throws HttpException
    {
	// Is this really for us to catch ?
	if ((reply.getStatus() != HTTP.UNAUTHORISED)
	    && (reply.getStatus() != HTTP.PROXY_AUTH_REQUIRED))
	    return null;
	// If we can't interact, we can't help:
	if ( ! request.getAllowUserInteraction() ) 
	    return null;
	// Great ! Now we can indeed help:
	PasswordPrompter prompter = new PasswordPrompter(request, reply);
	if ( ! prompter.prompt() )
	    return null;
	String user     = prompter.getUser();
	String password = prompter.getPassword();
	// Compute credentials:
	HttpCredential credentials = HttpFactory.makeCredential("Basic");
	Base64Encoder encoder = new Base64Encoder(user+":"+password);
	credentials.setAuthParameter("cookie", encoder.processString());
	// Now restart the request we the right auth infos:
	if ( request.hasProxy() )
	    request.setProxyAuthorization(credentials);
	else
	    request.setAuthorization(credentials);
	Reply retry = request.getManager().runRequest(request);
	if ( retry.getStatus() / 100 != 4 ) {
	    // We did succeed:
	    if ( request.hasProxy() ) 
		LocalAuthFilter.installProxyAuth(manager, credentials);
	    else
		LocalAuthFilter.installLocalAuth(manager
						 , request.getURL()
						 , credentials);
	    // Swallow input stream of original reply:
	    try {
		InputStream in = reply.getInputStream();
		if ( in != null )
		    in.close();
	    } catch (IOException ex) {
	    }
	    // Return the right reply:
	    return retry;
	} else {
	    return null;
	}
    }

    /**
     * We don't maintain cached informations.
     */

    public void sync() {
    }

}
