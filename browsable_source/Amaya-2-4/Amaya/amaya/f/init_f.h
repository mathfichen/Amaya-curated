/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern Document IsDocumentLoaded ( STRING documentURL,
                                   STRING form_data );
extern ThotBool CanReplaceCurrentDocument ( Document document,
                                            View view );
extern void ExtractParameters ( STRING aName,
                                STRING parameters );
extern void SetArrowButton ( Document document,
                             ThotBool back,
                             ThotBool on );
extern void ResetStop ( Document document );
extern void ActiveTransfer ( Document document );
extern void SetStopButton ( Document document );
extern void DocStatusUpdate ( Document document,
                              ThotBool modified );
extern void SetBrowserEditor ( Document document );
extern void ActiveMakeBook ( Document document );
extern void UpdateTransfer ( Document document );
extern void StopTransfer ( Document document,
                           View view );
extern void InitFormAnswer ( Document document,
                             View view,
                             STRING auth_realm,
                             STRING server );
extern void InitInfo ( STRING label,
                       STRING info );
extern void InitConfirm ( Document document,
                          View view,
                          STRING label );
extern void OpenDocInNewWindow ( Document document,
                                 View view );
extern void OpenNew ( Document document,
                      View view,
                      ThotBool isHTML );
extern void OpenDoc ( Document document,
                      View view );
extern void GoToHome ( Document doc,
                       View view );
extern Document InitDocView ( Document doc,
                              STRING docname,
                              DocumentType docType,
                              ThotBool logFile );
extern void Reload_callback ( int doc,
                              int status,
                              STRING urlName,
                              STRING outputfile,
                              STRING content_type,
                              void * context );
extern void Reload ( Document doc,
                     View view );
extern void ShowTargets ( Document document,
                          View view );
extern void ZoomIn ( Document document,
                     View view );
extern void ZoomOut ( Document document,
                      View view );
extern void ShowSource ( Document document,
                         View view );
extern void ShowStructure ( Document document,
                            View view );
extern void ShowAlternate ( Document document,
                            View view );
extern void ShowLinks ( Document document,
                        View view );
extern void ShowToC ( Document document,
                      View view );
extern ThotBool ViewToClose ( NotifyDialog * event );
extern void GetHTMLDocument_callback ( int newdoc,
                                       int status,
                                       STRING urlName,
                                       STRING outputfile,
                                       STRING content_type,
                                       void * context );
extern Document GetHTMLDocument ( const STRING documentPath,
                                  STRING form_data,
                                  Document doc,
                                  Document baseDoc,
                                  ClickEvent CE_event,
                                  ThotBool history,
                                  TTcbf *cbf,
                                  void *ctx_cbf );
extern void CallbackDialogue ( int ref,
                               int typedata,
                               STRING data );
extern ThotBool CheckMakeDirectory ( STRING name,
                                     ThotBool recursive );
extern void InitAmaya ( NotifyEvent * event );
extern void ChangeAttrOnRoot ( Document document,
                               int attrNum );
extern void ShowMapAreas ( Document document,
                           View view );
extern void HelpAmaya ( Document document,
                        View view );
extern void HelpAtW3C ( Document document,
                        View view );
extern void HelpBrowsing ( Document document,
                           View view );
extern void HelpSelecting ( Document document,
                            View view );
extern void HelpSearching ( Document document,
                            View view );
extern void HelpViews ( Document document,
                        View view );
extern void HelpCreating ( Document document,
                           View view );
extern void HelpLinks ( Document document,
                        View view );
extern void HelpChanging ( Document document,
                           View view );
extern void HelpTables ( Document document,
                         View view );
extern void HelpMath ( Document document,
                       View view );
extern void HelpImageMaps ( Document document,
                            View view );
extern void HelpStyleSheets ( Document document,
                              View view );
extern void HelpAttributes ( Document document,
                             View view );
extern void HelpSpellChecking ( Document document,
                                View view );
extern void HelpPublishing ( Document document,
                             View view );
extern void HelpPrinting ( Document document,
                           View view );
extern void HelpNumbering ( Document document,
                            View view );
extern void HelpMakeBook ( Document document,
                           View view );
extern void HelpConfigure ( Document document,
                            View view );
extern void HelpAccess ( Document document,
                         View view );
extern void ShowLogFile ( Document doc,
                          View view );
extern void CloseDocument ( Document doc,
                            View view );
extern void AmayaClose ( Document document,
                         View view );

#else /* __STDC__ */

extern Document IsDocumentLoaded (/* STRING documentURL,
                                     STRING form_data */);
extern ThotBool CanReplaceCurrentDocument (/* Document document,
                                              View view */);
extern void ExtractParameters (/* STRING aName,
                                  STRING parameters */);
extern void SetArrowButton (/* Document document,
                               ThotBool back,
                               ThotBool on */);
extern void ResetStop (/* Document document */);
extern void ActiveTransfer (/* Document document */);
extern void SetStopButton (/* Document document */);
extern void DocStatusUpdate (/* Document document,
                                ThotBool modified */);
extern void SetBrowserEditor (/* Document document */);
extern void ActiveMakeBook (/* Document document */);
extern void UpdateTransfer (/* Document document */);
extern void StopTransfer (/* Document document,
                             View view */);
extern void InitFormAnswer (/* Document document,
                               View view,
                               STRING auth_realm,
                               STRING server */);
extern void InitInfo (/* STRING label,
                         STRING info */);
extern void InitConfirm (/* Document document,
                            View view,
                            STRING label */);
extern void OpenDocInNewWindow (/* Document document,
                                   View view */);
extern void OpenNew (/* Document document,
                        View view,
                        ThotBool isHTML */);
extern void OpenDoc (/* Document document,
                        View view */);
extern void GoToHome (/* Document doc,
                         View view */);
extern Document InitDocView (/* Document doc,
                                STRING docname,
                                DocumentType docType,
                                ThotBool logFile */);
extern void Reload_callback (/* int doc,
                                int status,
                                STRING urlName,
                                STRING outputfile,
                                STRING content_type,
                                void * context */);
extern void Reload (/* Document doc,
                       View view */);
extern void ShowTargets (/* Document document,
                            View view */);
extern void ZoomIn (/* Document document,
                       View view */);
extern void ZoomOut (/* Document document,
                        View view */);
extern void ShowSource (/* Document document,
                           View view */);
extern void ShowStructure (/* Document document,
                              View view */);
extern void ShowAlternate (/* Document document,
                              View view */);
extern void ShowLinks (/* Document document,
                          View view */);
extern void ShowToC (/* Document document,
                        View view */);
extern ThotBool ViewToClose (/* NotifyDialog * event */);
extern void GetHTMLDocument_callback (/* int newdoc,
                                         int status,
                                         STRING urlName,
                                         STRING outputfile,
                                         STRING content_type,
                                         void * context */);
extern Document GetHTMLDocument (/* const STRING documentPath,
                                    STRING form_data,
                                    Document doc,
                                    Document baseDoc,
                                    ClickEvent CE_event,
                                    ThotBool history,
                                    TTcbf *cbf,
                                    void *ctx_cbf */);
extern void CallbackDialogue (/* int ref,
                                 int typedata,
                                 STRING data */);
extern ThotBool CheckMakeDirectory (/* STRING name,
                                       ThotBool recursive */);
extern void InitAmaya (/* NotifyEvent * event */);
extern void ChangeAttrOnRoot (/* Document document,
                                 int attrNum */);
extern void ShowMapAreas (/* Document document,
                             View view */);
extern void HelpAmaya (/* Document document,
                          View view */);
extern void HelpAtW3C (/* Document document,
                          View view */);
extern void HelpBrowsing (/* Document document,
                             View view */);
extern void HelpSelecting (/* Document document,
                              View view */);
extern void HelpSearching (/* Document document,
                              View view */);
extern void HelpViews (/* Document document,
                          View view */);
extern void HelpCreating (/* Document document,
                             View view */);
extern void HelpLinks (/* Document document,
                          View view */);
extern void HelpChanging (/* Document document,
                             View view */);
extern void HelpTables (/* Document document,
                           View view */);
extern void HelpMath (/* Document document,
                         View view */);
extern void HelpImageMaps (/* Document document,
                              View view */);
extern void HelpStyleSheets (/* Document document,
                                View view */);
extern void HelpAttributes (/* Document document,
                               View view */);
extern void HelpSpellChecking (/* Document document,
                                  View view */);
extern void HelpPublishing (/* Document document,
                               View view */);
extern void HelpPrinting (/* Document document,
                             View view */);
extern void HelpNumbering (/* Document document,
                              View view */);
extern void HelpMakeBook (/* Document document,
                             View view */);
extern void HelpConfigure (/* Document document,
                              View view */);
extern void HelpAccess (/* Document document,
                           View view */);
extern void ShowLogFile (/* Document doc,
                            View view */);
extern void CloseDocument (/* Document doc,
                              View view */);
extern void AmayaClose (/* Document document,
                           View view */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */