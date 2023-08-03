 
package w3c.www.http;

import w3c.www.mime.*;

public class HttpMimeType extends BasicValue {
    MimeType type = null;

    protected void parse() 
	throws HttpParserException
    {
	String str = new String(raw, 0, 0, raw.length) ;
	try {
	    type = new MimeType(str);
	} catch (Exception ex) {
	    error("Invalid content type.");
	}
    }

    protected void updateByteValue() {
	String str = type.toString();
	raw  = new byte[str.length()];
	roff = 0;
	rlen = raw.length;
	str.getBytes(0, raw.length, raw, 0);
    }

    public Object getValue() {
	validate();
	return type;
    }

    public HttpMimeType() {
	super();
    }

    HttpMimeType(boolean isValid, MimeType type) {
	this.isValid = isValid;
	this.type    = type;
    }
}
