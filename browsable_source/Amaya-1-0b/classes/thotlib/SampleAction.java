package thotlib;

/*
 * Java template for classes used to provide "user defined" specific
 *    actions. E.g. to redefine of extend the action of a menu item.
 */

public class SampleAction implements Action {
    /*
     * The register method exports the class callback when the action
     * "ActionName" is to be called.
     */
    public void register(String ActionName) {
        // Don't loose this Object !!!
        Application.makePersistant(this);
        Extra.JavaRegisterAction(this, ActionName);
    }
    public void registerMenu(String ActionName) {
        // Don't loose this Object !!!
        Application.makePersistant(this);
        Extra.JavaRegisterMenuAction(this, ActionName);
    }

    /*
     * The class callback is called when the action for witch it was
     * registered occurs. If the handling is complete, it should return
     * a zero value. Otherwise, the built-in callback for this action
     * is called upon completion of the user one.
     */
    public int callback(int document, int view) {
        return(-1);
    }
    public int callbackMenu(int document, int view)
    { return(-1); }
    public int callbackNotify(int event)
    { return(-1); }
    public int callbackDialog(int event, int document, int view)
    { return(-1); }
    public int callbackWindow(int event, int document, int view,
                              int verticalValue, int horizontalValue)
    { return(-1); }
    public int callbackAttribute(int event, int document, long element,
                                 long attribute, long attributeType)
    { return(-1); }
    public int callbackElement(int event, int document, long element,
                                 long elementType, int position)
    { return(-1); }
    public int callbackElementType(int event, int document, long element,
                                 long elementType, long targetElementType)
    { return(-1); }
    public int callbackTarget(int event, int document, long element,
                                 long target, int targetdocument)
    { return(-1); }
    public int callbackValue(int event, int document, long element,
                                 long target, int value)
    { return(-1); }
    public int callbackPresentation(int event, int document, long element,
                                 long pRule, int pRuleType)
    { return(-1); }

    /*
     * The main will auto register with the Action name given as the argument.
     */
    static public int main(String[] args) {
        if ((args != null) && (args.length > 0)) {
	    SampleAction new_action = new SampleAction();
	    new_action.register(args[0]);
	}
	return(0);
    }
}


