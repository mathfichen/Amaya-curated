/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern STRING SkipSep ( STRING ptr );
extern STRING SkipInt ( STRING ptr );
extern void ParseAreaCoords ( Element element,
                              Document document );
extern CHAR_T* GITagNameByType ( ElementType elType );
extern CHAR_T* GITagName ( Element elem );
extern int MapThotAttr ( CHAR_T* Attr,
                         CHAR_T* tag );
extern void InitMapping ( void );
extern void ParseHTMLError ( Document doc,
                             CHAR_T* msg );
extern ThotBool IsCharacterLevelElement ( Element el );
extern void OnlyOneOptionSelected ( Element el,
                                    Document doc,
                                    ThotBool parsing );
extern void CheckCSSLink ( Element el,
                           Document doc,
                           SSchema schema );
extern int MapAttrValue ( int ThotAtt,
                          CHAR_T* AttrVal );
extern void SetAttrIntItemStyle ( Element el,
                                  Document doc );
extern void CreateAttrWidthPercentPxl ( STRING buffer,
                                        Element el,
                                        Document doc,
                                        int oldWidth );
extern void CreateAttrIntSize ( STRING buffer,
                                Element el,
                                Document doc );
extern void GetFallbackCharacter ( int code,
                                   USTRING fallback,
                                   Language* lang );
extern void InitAutomaton ( void );
extern void FreeHTMLParser ( void );
extern void SetElemLineNumber ( Element el );
extern CHAR_T GetNextInputChar ( FILE *infile,
                                 int *index,
                                 ThotBool *endOfFile );
extern ThotBool IsXHTMLDocType ( STRING fileName );
extern ThotBool ContentIsXML ( CHAR_T* fileName );
extern void CheckAbstractTree ( CHAR_T* pathURL );
extern void ParseIncludedHTML ( Element elem,
                                STRING closingTag );
extern void ParseSubTree ( CHAR_T* HTMLbuf,
                           Element lastelem,
                           ThotBool isclosed,
                           Document doc );
extern void StartParser ( Document doc,
                          CHAR_T* htmlFileName,
                          CHAR_T* documentName,
                          CHAR_T* documentDirectory,
                          CHAR_T* pathURL,
                          ThotBool plainText );

#else /* __STDC__ */

extern STRING SkipSep (/* STRING ptr */);
extern STRING SkipInt (/* STRING ptr */);
extern void ParseAreaCoords (/* Element element,
                                Document document */);
extern CHAR_T* GITagNameByType (/* ElementType elType */);
extern CHAR_T* GITagName (/* Element elem */);
extern int MapThotAttr (/* CHAR_T* Attr,
                           CHAR_T* tag */);
extern void InitMapping (/* void */);
extern void ParseHTMLError (/* Document doc,
                               CHAR_T* msg */);
extern ThotBool IsCharacterLevelElement (/* Element el */);
extern void OnlyOneOptionSelected (/* Element el,
                                      Document doc,
                                      ThotBool parsing */);
extern void CheckCSSLink (/* Element el,
                             Document doc,
                             SSchema schema */);
extern int MapAttrValue (/* int ThotAtt,
                            CHAR_T* AttrVal */);
extern void SetAttrIntItemStyle (/* Element el,
                                    Document doc */);
extern void CreateAttrWidthPercentPxl (/* STRING buffer,
                                          Element el,
                                          Document doc,
                                          int oldWidth */);
extern void CreateAttrIntSize (/* STRING buffer,
                                  Element el,
                                  Document doc */);
extern void GetFallbackCharacter (/* int code,
                                     USTRING fallback,
                                     Language* lang */);
extern void InitAutomaton (/* void */);
extern void FreeHTMLParser (/* void */);
extern void SetElemLineNumber (/* Element el */);
extern CHAR_T GetNextInputChar (/* FILE *infile,
                                   int *index,
                                   ThotBool *endOfFile */);
extern ThotBool IsXHTMLDocType (/* STRING fileName */);
extern ThotBool ContentIsXML (/* CHAR_T* fileName */);
extern void CheckAbstractTree (/* CHAR_T* pathURL */);
extern void ParseIncludedHTML (/* Element elem,
                                  STRING closingTag */);
extern void ParseSubTree (/* CHAR_T* HTMLbuf,
                             Element lastelem,
                             ThotBool isclosed,
                             Document doc */);
extern void StartParser (/* Document doc,
                            CHAR_T* htmlFileName,
                            CHAR_T* documentName,
                            CHAR_T* documentDirectory,
                            CHAR_T* pathURL,
                            ThotBool plainText */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */