import java.io.*;

class dirlist {
	public static void main (String args[]) {
		File dir = new File(".");
		String list[] = dir.list();
		for (int i = 0; ; i++) {
			System.out.println(list[i]);
		}
	}
}

