package thotlib;

/*
 * Java template for classes used to provide "user defined" specific
 *    actions. E.g. to redefine of extend the action of a menu item.
 */

public interface Action {
    /*
     * The register method exports the class callback when the action
     * "ActionName" is to be called.
     */
    public void register(String ActionName);

    /*
     * The registerMenu method exports the class callback when the action
     * "ActionName" is to be called from a Menu.
     */
    public void registerMenu(String ActionName);

    /*
     * The class callback is called when the action for witch it was
     * registered occurs. If the handling is complete, it should return
     * a zero value. Otherwise, the built-in callback for this action
     * is called upon completion of the user one.
     */
    public int callbackMenu(int document, int view);
    public int callbackNotify(int event);
    public int callbackDialog(int event, int document, int view);
    public int callbackWindow(int event, int document, int view,
                              int verticalValue, int horizontalValue);
    public int callbackAttribute(int event, int document, long element,
                                 long attribute, long attributeType);
    public int callbackElement(int event, int document, long element,
                                 long elementType, int position);
    public int callbackElementType(int event, int document, long element,
                                 long elementType, long targetElementType);
    public int callbackTarget(int event, int document, long element,
                                 long target, int targetdocument);
    public int callbackValue(int event, int document, long element,
                                 long target, int value);
    public int callbackPresentation(int event, int document, long element,
                                 long pRule, int pRuleType);
}


