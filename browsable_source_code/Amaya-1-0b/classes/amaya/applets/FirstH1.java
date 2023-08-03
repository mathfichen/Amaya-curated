/*
 * This is an Applet for Amaya.
 *
 * It prints out the text of the first H1 of the Document every 10 second
 * to give a fancy demo of scripting capabilities.
 */

import thotlib.*;
import amaya.*;

class FirstH1 {
    public int main(int document) {
        long elem;
	int color = 1;

	Document doc = new Document(document);
	Element current = doc.Root();
	ElementType elType = new ElementType(current);
        elType.SetValue((long) APIHtml.HTML_EL_H1);

        while (true) {
	    try {
	       Thread.sleep(1000);
	    }
	    catch (InterruptedException e) {}
	    catch (Exception e) {}
	    catch (Throwable e) {}

            current = doc.Root();
            
	    elem = APITree.TtaSearchTypedElement(elType.Value(),
                             APITree.SearchInTree, current.Value());
	    if (elem != 0) {
                current = new Element(elem);
                long prule_val =
		    APIPresentation.TtaGetPRule(current.Value(), 
					        APIPresentation.PRForeground);
                if (prule_val == 0) {
                    prule_val = APIPresentation.TtaNewPRule(
                                  APIPresentation.PRForeground,1,1);
		    APIPresentation.TtaAttachPRule(current.Value(),prule_val,1);
                }
		APIPresentation.TtaSetPRuleValue(current.Value(),
                                  prule_val, color, 1);
	    }
            color ++;
            if (color > 100) color = 1;

        }
    }
}
