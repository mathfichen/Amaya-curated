package thotlib;

/*
 * Stub classes to interface the Thotlib document accesses from Java
 */


public class Document {
    int document;

    public Document(int doc) {
        document = doc;
    }

    public Element Root() {
        Element current = new Element(APITree.TtaGetMainRoot(document));
	return current;
    }
}

