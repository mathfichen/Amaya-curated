/*
 * DO NOT EDIT
 * Generated by the following command from /users/veillard/opera/javalib directory
 * ../LINUX-ELF/bin/javastub -T JavaTypes.def -M thotlib_APIReference -J ../classes/thotlib/APIReference.java ../thotlib/include/reference.h 
 */
package thotlib;


/*
 * Java public native definitions for class thotlib_APIReference
 */

public class APIReference {


/*----------------------------------------------------------------------
   TtaSetReference

   Changes (or sets) the target of a reference element. The reference element
   must be part of an abstract tree.

   Parameters:
   element: the reference element to be set.
   document: the document containing the reference element.
   target : the target element (NULL for resetting the reference).
   targetDocument: the document containing the target element.

  ----------------------------------------------------------------------*/
 public static native void TtaSetReference(long element, int document, long target, int targetDocument);


/*----------------------------------------------------------------------
   TtaNewInclusion

   Creates an inclusion of a given element.

   Parameters:
   document: the document for which the inclusion is created.
   target: the element to be included.
   targetDocument: the document containing the element to be included.

   Return value:
   the created inclusion.

  ----------------------------------------------------------------------*/
 public static native long TtaNewInclusion(int document, long target, int targetDocument);


/*----------------------------------------------------------------------
   TtaCopyReference

   Copies a reference element into another reference element.
   Both reference elements must be in an abstract tree.

   Parameters:
   element: the reference element to be set.
   source : the element to be copied.

  ----------------------------------------------------------------------*/
 public static native void TtaCopyReference(long element, long source);


/*----------------------------------------------------------------------
   TtaSetAttributeReference

   Changes the value of an attribute of type reference

   Parameters:
   attribute: the attribute to be changed.
   element: the element with which the attribute is associated.
   document: the document containing the attribute.
   target: the target element (NULL for resetting the reference).
   targetDocument: the document containing the target element.

  ----------------------------------------------------------------------*/
 public static native void TtaSetAttributeReference(long attribute, long element, int document, long target, int targetDocument);


/*----------------------------------------------------------------------
   TtaCopyAttributeReference

   Copies the reference attribute source into the reference attribute attribute.
   Both attributes must be attached to an element in an abstract tree.

   Parameters:
   attribute: the reference attribute to be set.
   element: the element to which attribute is attached.
   source : the source attribute.

  ----------------------------------------------------------------------*/
 public static native void TtaCopyAttributeReference(long attribute, long element, long source);


/*----------------------------------------------------------------------
   TtaGiveReferredElement

   Returns the element referred by a given reference element.

   Parameter:
   element: the reference element.

   Return parameters:
   target: the referred element, or NULL if that element is not
   accessible (empty reference or referred document not open).
   targetDocumentName: name of the document containing the referred element;
   empty string if the referred element is in the same document as the
   reference element.
   targetDocument: the document containing the referred element;
   0 if the document containing the referred element is not loaded or
   if the referred element is in the same document as the reference
   element.

  ----------------------------------------------------------------------*/
 public static native void TtaGiveReferredElement(long element, /*OUT*/ Element target, /*OUT*/ StringBuffer targetDocumentName, /*OUT*/ Document targetDocument);


/*----------------------------------------------------------------------
   TtaIsElementTypeReference

   Indicates whether an element type is a reference.

   Parameter:
   elementType: type to be tested.

   Return value:
   1 = the type is a reference, 0 = the type is not a reference.

  ----------------------------------------------------------------------*/
 public static native int TtaIsElementTypeReference(long elementType);


/*----------------------------------------------------------------------
   TtaSameReferences

   Compares two reference elements.

   Parameters:
   element1: first reference element.
   element2: second reference element.

   Return value:
   0 if both references are different, 1 if they are identical.

  ----------------------------------------------------------------------*/
 public static native int TtaSameReferences(long element1, long element2);


/*----------------------------------------------------------------------
   TtaGiveReferenceAttributeValue

   Returns the value of a given attribute of type reference

   Parameter:
   attribute: the attribute of interest.

   Return parameters:
   target: the element referred by the attribute, or NULL
   if that element is not accessible (empty reference or referred
   document not loaded)
   targetDocumentName: name of the document containing the referred element;
   empty string if the referred element is in the same document as the
   attribute.
   targetDocument: the document containing the referred element;
   0 if the document containing the referred element is not loaded or
   if the referred element is in the same document as the attribute.

  ----------------------------------------------------------------------*/
 public static native void TtaGiveReferenceAttributeValue(long attribute, /*OUT*/ Element target, /*OUT*/ StringBuffer targetDocumentName, /*OUT*/ Document targetDocument);


/*----------------------------------------------------------------------
   TtaIsElementReferred

   Tells whether a given element is the target of a reference or not.

   Parameter:
   element: the element.

   Return value:
   1 if the element is referred by another element or an
   attribute, 0 if not.

  ----------------------------------------------------------------------*/
 public static native int TtaIsElementReferred(long element);


/*----------------------------------------------------------------------
   TtaSameReferenceAttributes

   Compares two reference attributes.

   Parameters:
   attribute1: first reference attribute.
   attribute2: second reference attribute.

   Return value:
   0 if both references are different, 1 if they are identical.

  ----------------------------------------------------------------------*/
 public static native int TtaSameReferenceAttributes(long attribute1, long attribute2);


/*----------------------------------------------------------------------
   TtaNextLoadedReference

   Searches a reference that has a given element as a target and that
   belongs to a document currently loaded.

   Parameters:
   target: the target element.
   targetDocument: the document to which the target element belongs.
   referenceElement: previous element found by the function; NULL if the first
   reference is searched. (Both referenceElement and referenceAttribute
   must be NULL if the first reference is searched.)
   referenceAttribute: previous reference attribute found; NULL if the first
   reference is searched or if the previous reference found by the
   function was an element.
   referenceDocument: document to which the previous reference found belongs;
   Zero if the first reference is searched.

   Return parameters:
   referenceAttribute: the reference attribute found. NULL if the reference
   found is an element or if no reference is found.
   referenceElement: the element found. If referenceAttribute is NULL, this
   element is a reference element, else it is the element with which the
   reference attribute found is associated. If both referenceAttribute
   and referenceElement are NULL, then no reference has been found.
   referenceDocument: the document to which the reference found belongs.
   Zero if no reference has been found.

  ----------------------------------------------------------------------*/
 public static native void TtaNextLoadedReference(long target, int targetDocument, /*OUT*/ Element referenceElement, /*OUT*/ Attribute referenceAttribute, /*OUT*/ Document referenceDocument);


/*----------------------------------------------------------------------
   TtaNextUnloadedReferringDocument

   Returns the name of a document that is not currently loaded and that contains
   references to a given target element.

   Parameters:
   target: the target element.
   targetDocument: the document to which the target element belongs.
   referringDocumentName: name of the previous document found. PcEmpty string
   if the first referring document is searched.

   Return parameter:
   referringDocumentName: name of the document found. PcEmpty string if no
   referring document has been found.

  ----------------------------------------------------------------------*/
 public static native void TtaNextUnloadedReferringDocument(long target, int targetDocument, /*OUT*/ StringBuffer referringDocumentName);


/*----------------------------------------------------------------------
   TtaSearchReferenceElement

   Searches the next reference element.
   Searching can be done in a subtree or starting from a given element towards
   the beginning or the end of the abstract tree.

   Parameters:
   scope: SearchForward, SearchBackward or SearchInTree.
   element: the element that is the root of the subtree
   (if scope = SearchInTree) or the starting element
   (if scope = SearchForward or SearchBackward).

   Return value:
   the element found, or NULL if not found.

  ----------------------------------------------------------------------*/
 public static native long TtaSearchReferenceElement(int scope, long element);
}