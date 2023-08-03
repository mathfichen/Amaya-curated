package thotlib;

/*
 * Java Classe for all native functions not generated automatically
 * by javastub.
 */

public class Extra {
    public static native void Java2CCallback(Object arg, long callback);
    public static native void JavaPollLoop();
    public static native void JavaStopPoll();
    public static native void JavaXFlush();
    public static native int JavaStartApplet(String classname,
					     String signature,
                                             int doc,
                                             String[] argv)
                             throws ClassNotFoundException, NoSuchMethodError;
    /*
     * JavaRegisterAction : Register an Action handler
     */
    public static native void JavaRegisterAction(Action handler,
                                                 String ActionName);
    /*
     * JavaRegisterMenuAction : Register an Menu Action callback
     */
    public static native void JavaRegisterMenuAction(Action handler,
                                                 String ActionName);
    /*
     * AddEditorActionEvent : Add an action at the Application level,
     *     (equivalent to EDITOR.A actions).
     *   An action with the corresponding ActionName MUST have
     *   been registered before (see Action and SampleAction classes).
     */
    static public native void AddEditorActionEvent(String ActionName,
                               int eventType, int typeId, boolean pre);

    /*
     * AddSSchemaActionEvent : Add an action at the SSchema level,
     *     (equivalent to HTML.A actions).
     *   An action with the corresponding ActionName MUST have
     *   been registered before (see Action and SampleAction classes).
     */
    static public native void AddSSchemaActionEvent(String DTDName,
                               String ActionName, int eventType,
                               int typeId, boolean pre);

}


