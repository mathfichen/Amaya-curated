package thotlib;

/*
 * Java Classe used for OUT parameters when calling native functions
 */

public class IntPtr {
    protected int value;

    public IntPtr(int val) {
        value = val;
    }

    public int value() {
        return (value);
    }
}

