package javai;

import java.lang.*;
import java.io.*;
import java.util.*;

class FileClassLoader extends ClassLoader {
    // Cache of already loaded classes:
    protected Hashtable cache = new Hashtable(23);
    protected File directory = null;

    private File classToFile(String name) {
	// Substitute '.' with '/' (we're just playing here, don't forget)
	char chars[] = new char[name.length()];
	name.getChars(0, chars.length, chars, 0);
	for (int i = 0 ; i < chars.length ; i++) {
	    if ( chars[i] == '.' )
		chars[i] = '/';
	}
	return new File(directory, (new String(chars))+".class");
    }

    private byte[] loadClassData(String name) 
	throws ClassNotFoundException
    {
	File file = classToFile(name);
	if ( ! file.exists() )
	    throw new ClassNotFoundException(name);
	try {
	    byte            data[] = new byte[(int) file.length()];
	    DataInputStream in     = (new DataInputStream
				      (new FileInputStream(file)));
	    in.readFully(data);
	    in.close();
	    return data;
	} catch (Exception ex) {
	    throw new ClassNotFoundException(name);
	}
    }

    public synchronized Class loadClass(String name,
					boolean resolve)
	throws ClassNotFoundException
    {
	Class c = null;
	// Is there a system class of that name ?
	try {
	    return findSystemClass(name);
	} catch (Exception ex) {
	}
	// Is that class available in cache ?
	if ((c = (Class) cache.get(name)) != null)
	    return c;
	// Hard part, get the bytes, etc:
	byte data[] = loadClassData(name);
	c = defineClass(name, data, 0, data.length);
	if (resolve)
	    resolveClass(c);
	cache.put(name, c);
	return c;
    }

    public FileClassLoader(File directory) {
	this.directory   = directory;
    }

}

public class Interpreter {
    File        tmpdir = new File("/tmp");
    FileClassLoader loader = null;
    
    public Class loadClass(String name) {
	try {
	    return loader.loadClass(name, true);
	} catch (Exception ex) {
	    ex.printStackTrace();
	}
	return null;
    }

    public String save(String expr) {
	try {
	    PrintStream out = (new PrintStream
			       (new BufferedOutputStream
				(new FileOutputStream(new File("TempClass.java")))));
	    out.println("public class TempClass extends javai.Expression {");
	    out.println("public void run() {");
	    out.print(expr);
	    out.println("}");
	    out.println("}");
	    out.close();
	    return "TempClass";
	} catch (Exception ex) {
	    ex.printStackTrace();
	}
	return null;
    }

    public Class compile(String name) {
	String args[] = new String[4];
	args[0] = "-classpath";
	args[1] = System.getProperty("java.class.path");
	args[2] = "-nowarn";
	args[3] = name+".java";
	// Run the compilation:
	sun.tools.javac.Main compiler = 
	    new sun.tools.javac.Main(System.err, "javac");
	boolean ok = compiler.compile(args);
	if ( ok ) {
	    return loadClass(name);
	} else {
	    System.out.println("invalid expression !");
	}
	return null;
    }

    public void run(Class c) {
	try {
	    Expression e = (Expression) c.newInstance();
	    e.run();
	} catch (Exception ex) {
	    ex.printStackTrace();
	}
    }

    public void eval(String expr) {
	// Create a fake temp class file:
	String name = save(expr);
	Class  cls  = compile(name);
	run(cls);
    }

    public Interpreter() {
	loader = new FileClassLoader(tmpdir);
    }

    public static void main(String args[]) {
	try {
	    Interpreter interp = new Interpreter();
	    StringBuffer sb = new StringBuffer();
	    DataInputStream in = new DataInputStream(System.in);
	    while ( true ) {
		// Read next line of input:
		System.out.print("> "); System.out.flush();
		String line = in.readLine();
		if (line.equals("")) {
		    // Evaluate that expression:
		    interp.eval(sb.toString());
		    sb.setLength(0);
		} else {
		    sb.append(line);
		}
	    }
	} catch (Exception ex) {
	    ex.printStackTrace();
	}
	
    }
}

