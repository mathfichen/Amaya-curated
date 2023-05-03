package thotlib;
import java.io.*;

/*
 * Java Classe associated to an ElementType of an Element.
 */

public class ElementType {
    long elementType;

    public ElementType() {
        elementType = 0;
    }
    public ElementType(long value) {
        elementType = value;
    }
    public ElementType(Element el) {
        elementType = APITree.TtaGetElementType(el.element);
    }
    public ElementType(String TypeName) {
        APITree.TtaGiveTypeFromName(this, TypeName);
    }

    public String Name() {
        return(APITree.TtaGetElementTypeName(elementType));
    }
    public long Value() {
        return(elementType);
    }
    public void SetValue(long value) {
        elementType &= 0xFFFFFFFFL;
        elementType += (value << 32);
    }
    public int GetValue() {
	return((int) elementType >> 32);
    }
}


