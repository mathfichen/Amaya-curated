package thotlib;

/*
 * Java Classe associated to an Attribute of an Element.
 */

public class Attribute {
    long attribute;

    /*
     * These functions just create wrapper classes around existing
     * Thot Attributes.
     */
    public Attribute() {
        attribute = 0;
    }
    public Attribute(long value) {
        attribute = value;
    }

    /*
     * These functions create new Attributes in the Thot library and attach
     * them to the Attribute class.
     */
    public static Attribute NewAttribute(AttributeType atType) {
	Attribute at = new Attribute();
        at.attribute = APIAttribute.TtaNewAttribute(atType.attributeType);
	return at;
    }

    /*
     * These functions remove Attributes in the Thot library.
     */
    public void Remove(Element el) {
	APIAttribute.TtaRemoveAttribute(el.element, this.attribute, el.DocNo());
        this.attribute = 0;
    }

    /*
     * These functions acess Attributes value in the Thot library
     */
    public void SetValue(Element el, int value) {
        APIAttribute.TtaSetAttributeValue(this.attribute, value, el.element,
	                                  el.DocNo());
    }
    public void SetValue(Element el, String value) {
        APIAttribute.TtaSetAttributeText(this.attribute, value, el.element,
	                                 el.DocNo());
    }
    public long GetValue() {
        return APIAttribute.TtaGetAttributeValue(this.attribute);
    }
    public String GetString() {
        return null;
    }

}


