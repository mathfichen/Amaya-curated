/*
 * This is an Applet for Amaya.
 *
 */

import thotlib.*;
import amaya.*;

class ActionTest extends thotlib.SampleAction {

    public int callbackMenu(int document, int view) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackMenu(" + document + ", " +
	                   view + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackNotify(int event) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackNotify(" + event + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackDialog(int event, int document, int view) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackDialog(" + event + ", " +
	                   document + ", " + view + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackWindow(int event, int document, int view,
                    int verticalValue, int horizontalValue) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackWindow(" + event + ", " +
	                   document + ", " + view + ", " + 
			   verticalValue + ", " + horizontalValue + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackAttribute(int document, int view, long element,
                               long attribute, long attributeType) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackAttribute(" + document + ", " +
	                   view + ", " + element + ", " + attribute + ", " +
			   attributeType + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackElement(int document, int view, long element,
                               long elementType, int position) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackElement(" + document + ", " +
	                   view + ", " + element + ", " + elementType + ", " +
			   position + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackElementType(int document, int view, long element,
                               long elementType, long targetElementType) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackElementType(" + document + ", " +
	                   view + ", " + element + ", " + elementType + ", " +
			   targetElementType + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackTarget(int document, int view, long element,
                               long target, int targetdocument) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackTarget(" + document + ", " +
	                   view + ", " + element + ", " + target + ", " +
			   targetdocument + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackValue(int document, int view, long element,
                               long target, int value) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackValue(" + document + ", " +
	                   view + ", " + element + ", " + target + ", " +
			   value + ")");
	return(-1); // let the normal processing occur
    }
    public int callbackPresentation(int document, int view, long element,
                               long pRule, int pRuleType) {
	System.out.println("ActionTest : Handling an action");
        System.out.println("ActionTest.callbackPresentation(" + document + ", " +
	                   view + ", " + element + ", " + pRule + ", " +
			   pRuleType + ")");
	return(-1); // let the normal processing occur
    }

    static public int main(String[] args) {
	if ((args != null) && (args.length > 0)) {
	    // Install on the ActionName given in argument.
	    ActionTest new_action = new ActionTest();
	    new_action.register(args[0]);
	} else {
	    System.out.println("The ActionTest plugin will now install itself on");
	    // System.out.println("   - \"TtcInsertChar\" : action called when inserting a character");
	    System.out.println("   - \"New\" : action called opening a New document");
	    ActionTest new_action = new ActionTest();
	    // new_action.register("TtcInsertChar");
	    new_action.registerMenu("New");
	    System.out.println("One can now install it on any action by giving");
	    System.out.println("the action name on the command line");
	    System.out.println();
	    System.out.println("The ActionTest plugin will now create a new action");
	    System.out.println("called \"IMGDoubleClick\" and install it as the");
	    System.out.println("default action when double clicking on an image");
	    new_action.register("IMGDoubleClick");
	    Extra.AddEditorActionEvent("IMGDoubleClick",
	           APIAppAction.TteElemActivate, 
		   APIHtml.HTML_EL_PICTURE_UNIT, false);
	}
	return(0);
    }
}

