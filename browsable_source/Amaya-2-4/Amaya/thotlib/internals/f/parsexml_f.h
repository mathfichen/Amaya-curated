/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern void XmlError ( Document doc,
                       STRING text );
extern Element XmlSetCurrentDocument ( STRING schemaName );
extern void XmlChangeCurrentLangage ( Language lang );
extern Element XmlInsertElement ( Element newElement );
extern void XmlTextToDocument ( void );
extern void FreeXmlParser ( void );
extern Document XmlParseDoc ( STRING name );
extern void XmlParserLoadResources ( void );

#else /* __STDC__ */

extern void XmlError (/* Document doc,
                         STRING text */);
extern Element XmlSetCurrentDocument (/* STRING schemaName */);
extern void XmlChangeCurrentLangage (/* Language lang */);
extern Element XmlInsertElement (/* Element newElement */);
extern void XmlTextToDocument (/* void */);
extern void FreeXmlParser (/* void */);
extern Document XmlParseDoc (/* STRING name */);
extern void XmlParserLoadResources (/* void */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */