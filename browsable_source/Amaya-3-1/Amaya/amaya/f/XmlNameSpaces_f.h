/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern SSchema GetXHTML_DTD ( Document doc );
extern SSchema GetMathML_DTD ( Document doc );
extern SSchema GetGraphML_DTD ( Document doc );
extern SSchema GetXmlDTD ( int XMLtype,
			   Document doc );
extern void MapXmlElType ( int XMLtype,
			   STRING XMLname,
			   ElementType *elType,
			   STRING *mappedName,
			   CHAR_T *content,
			   Document doc );
extern void GetXmlElName ( ElementType elType,
			   CHAR_T** buffer );

#else /* __STDC__ */

extern SSchema GetXHTML_DTD (/* Document doc */);
extern SSchema GetMathML_DTD (/* Document doc */);
extern SSchema GetGraphML_DTD (/* Document doc */);
extern SSchema GetXmlDTD (/* int XMLtype,
			     Document doc */);
extern void MapXmlElType (/* int XMLtype,
			     STRING XMLname,
			     ElementType *elType,
			     STRING *mappedName,
			     CHAR_T *content,
			     Document doc */);
extern void GetXmlElName (/* ElementType elType,
			     CHAR_T** buffer */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */