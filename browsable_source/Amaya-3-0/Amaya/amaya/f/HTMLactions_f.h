/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern Element SearchNAMEattribute ( Document doc,
                                     STRING nameVal,
                                     Attribute ignore );
extern void FollowTheLink_callback ( int targetDocument,
                                     int status,
                                     STRING urlName,
                                     STRING outputfile,
                                     AHTHeaders *http_headers,
                                     void * context );
extern void DoAction ( Document doc,
                       View view );
extern ThotBool DoubleClick ( NotifyElement *event );
extern ThotBool SimpleClick ( NotifyElement *event );
extern void UpdateTitle ( Element el,
                          Document doc );
extern void FreeDocumentResource ( Document doc );
extern void DocumentClosed ( NotifyDialog * event );
extern void UpdateContextSensitiveMenus ( Document doc );
extern void ResetHighlightedElement ( void );
extern void SynchronizeSourceView ( NotifyElement * event );
extern void SelectionChanged ( NotifyElement * event );
extern void SetCharFontOrPhrase ( int document,
                                  int elemtype );

#else /* __STDC__ */

extern Element SearchNAMEattribute (/* Document doc,
                                       STRING nameVal,
                                       Attribute ignore */);
extern void FollowTheLink_callback (/* int targetDocument,
                                       int status,
                                       STRING urlName,
                                       STRING outputfile,
                                       AHTHeaders *http_headers,
                                       void * context */);
extern void DoAction (/* Document doc,
                         View view */);
extern ThotBool DoubleClick (/* NotifyElement *event */);
extern ThotBool SimpleClick (/* NotifyElement *event */);
extern void UpdateTitle (/* Element el,
                            Document doc */);
extern void FreeDocumentResource (/* Document doc */);
extern void DocumentClosed (/* NotifyDialog * event */);
extern void UpdateContextSensitiveMenus (/* Document doc */);
extern void ResetHighlightedElement (/* void */);
extern void SynchronizeSourceView (/* NotifyElement * event */);
extern void SelectionChanged (/* NotifyElement * event */);
extern void SetCharFontOrPhrase (/* int document,
                                    int elemtype */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */