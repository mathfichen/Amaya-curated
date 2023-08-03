package thotlib;

/*
 * Java Classe associated to Elements in a Thotlib document
 */

public class Element {
    long element;

    /*
     * These functions just create wrapper classes around existing
     * Thot Elements.
     */
    public Element() {
        element = 0;
    }
    public Element(long value) {
        element = value;
    }

    /*
     * These functions create new Elemnents in the Thot library and attach
     * them to the Element class.
     */
    public static Element NewElement(Document doc, ElementType elType) {
        Element el = new Element();
        el.element = APITree.TtaNewElement(doc.document, elType.elementType);
	return el;
    }

    public static Element NewTree(Document doc, ElementType elType, String label) {
        Element el = new Element();
        el.element = APITree.TtaNewTree(doc.document, elType.elementType, label);
	return el;
    }

    public static Element NewTree(Document doc, ElementType elType) {
        Element el = new Element();
        el.element = APITree.TtaNewTree(doc.document, elType.elementType, null);
	return el;
    }

    public Element CreateDescent(ElementType elType) {
        Element el = new Element();
        el.element = APITree.TtaCreateDescent(
	                 this.DocNo(),
			 this.element, elType.elementType);
	return el;
    }

    public Element CreateDescentWithContent(ElementType elType) {
        Element el = new Element();
        el.element = APITree.TtaCreateDescentWithContent(
	                 this.DocNo(),
	                 this.element, elType.elementType);
	return el;
    }

    public Element CopyTree(Document dest, Element parent) {
        Element el = new Element();
        el.element = APITree.TtaCopyTree(this.element,
	                 this.DocNo(), dest.document, parent.element);
	return el;
    }

    /*
     * These functions destroy Elements in the Thot library
     */
    public void RemoveTree() {
        APITree.TtaRemoveTree(this.element, this.DocNo());
	this.element = 0;
    }

    /*
     * accesses to the Element value.
     */
    public long Value() {
        return element;
    }

    public Document Document() {
        Document doc = new Document(APITree.TtaGetDocument(this.element));
	return doc;
    }
    public ElementType Type() {
	ElementType elType = new ElementType(this);
	return(elType);
    }
    public int DocNo() {
        return (APITree.TtaGetDocument(this.element));
    }
    public Attribute GetAttribute(AttributeType atType) {
        Attribute at = new Attribute();
	at.attribute = APIAttribute.TtaGetAttribute(this.element,
	                                            atType.attributeType);
        return(at);
    }
    public StringBuffer TextContent() {
	int type = this.Type().GetValue();
	StringBuffer text = null;

        /*
	 * This is an hard-coded value, all text element in Thot
	 * have an internal type 1 whatever the DTD.
	 */
	if (type != 1) {
	    /*
	     * Do a recursive call with concatenation on all children
	     */
	    Element child = this.FirstChild();
	    while (child != null) {
	        StringBuffer subtext = child.TextContent();
	        if (subtext != null) {
		    if (text == null) text = subtext;
		    else text.append(subtext);
		}
		child = child.NextSibling();
	    }
	} else {
	    /* Get the lenght of the text and allocate a buffer to store it */
	    int len = APIContent.TtaGetTextLength (this.element);
	    text = new StringBuffer(len + 1);

	    /* create the temporary objects needed to get the retun values */
	    IntPtr length = new IntPtr(len);
	    Language lang = new Language();

	    /* get the string in the buffer */
	    APIContent.TtaGiveTextContent(this.element, text, length, lang);

	    /* truncate it to the correct size */
            text.setLength(length.value());
	}
        return (text);
    }

    /*
     * extra navigation methods.
     */
    public Element Parent() {
        long parent = APITree.TtaGetParent(this.element);
        if (parent == 0) return null;
	Element el = new Element();
        el.element = parent;
	return(el);
    }
    public Element FirstChild() {
        long child = APITree.TtaGetFirstChild(this.element);
        if (child == 0) return null;
	Element el = new Element();
        el.element = child;
	return(el);
    }
    public Element LastChild() {
        long child = APITree.TtaGetLastChild(this.element);
        if (child == 0) return null;
	Element el = new Element();
        el.element = child;
	return(el);
    }
    public Element PreviousSibling() {
	Element el = new Element(this.element);
        APITree.TtaPreviousSibling(el);
        if (el.element == 0) return(null);
	return(el);
    }
    public Element NextSibling() {
	Element el = new Element(this.element);
        APITree.TtaNextSibling(el);
        if (el.element == 0) return(null);
	return(el);
    }
    public Element Successor() {
        long successor = APITree.TtaGetSuccessor(this.element);
        if (successor == 0) return null;
	Element el = new Element();
        el.element = successor;
	return(el);
    }
    public Element Predecessor() {
        long predecessor = APITree.TtaGetPredecessor(this.element);
        if (predecessor == 0) return null;
	Element el = new Element();
        el.element = predecessor;
	return(el);
    }
}


