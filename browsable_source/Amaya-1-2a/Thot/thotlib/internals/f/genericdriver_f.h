/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern GenericContext GetGenericContext ( Document doc );
extern void FreeGenericContext ( GenericContext ctxt );
extern int GenericCleanPresentation ( PresentationTarget t,
                                      PresentationContext c,
                                      PresentationValue v );
extern int GenericUpdatePresentation ( PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue v );
extern void ApplyAllGenericContext ( Document doc,
                                     GenericTarget target,
                                     GenericContextApplyHandler handler,
                                     void *param );
extern void ApplyAllGenericSettings ( GenericTarget target,
                                      GenericContext ctxt,
                                      GenericSettingsApplyHandler handler,
                                      void *param );
extern int GenericSetForegroundColor ( PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue v );
extern int GenericGetForegroundColor ( PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue *v );
extern int GenericSetBackgroundColor ( PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue v );
extern int GenericGetBackgroundColor ( PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue *v );
extern int GenericSetFontSize ( PresentationTarget t,
                                PresentationContext c,
                                PresentationValue v );
extern int GenericGetFontSize ( PresentationTarget t,
                                PresentationContext c,
                                PresentationValue *v );
extern int GenericSetFontStyle ( PresentationTarget t,
                                 PresentationContext c,
                                 PresentationValue v );
extern int GenericGetFontStyle ( PresentationTarget t,
                                 PresentationContext c,
                                 PresentationValue *v );
extern int GenericSetAlignment ( PresentationTarget t,
                                 PresentationContext c,
                                 PresentationValue v );
extern int GenericGetAlignment ( PresentationTarget t,
                                 PresentationContext c,
                                 PresentationValue *v );
extern int GenericSetIndent ( PresentationTarget t,
                              PresentationContext c,
                              PresentationValue v );
extern int GenericGetIndent ( PresentationTarget t,
                              PresentationContext c,
                              PresentationValue *v );
extern int GenericSetJustification ( PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue v );
extern int GenericGetJustification ( PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue *v );
extern int GenericSetHyphenation ( PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue v );
extern int GenericGetHyphenation ( PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue *v );
extern int GenericSetTextUnderlining ( PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue v );
extern int GenericGetTextUnderlining ( PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue *v );
extern int GenericSetFillPattern ( PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue v );
extern int GenericGetFillPattern ( PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue *v );
extern int GenericSetFontFamily ( PresentationTarget t,
                                  PresentationContext c,
                                  PresentationValue v );
extern int GenericGetFontFamily ( PresentationTarget t,
                                  PresentationContext c,
                                  PresentationValue *v );
extern int GenericSetLineSpacing ( PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue v );
extern int GenericGetLineSpacing ( PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue *v );
extern int GenericSetInLine ( PresentationTarget t,
                              PresentationContext c,
                              PresentationValue v );
extern int GenericGetInLine ( PresentationTarget t,
                              PresentationContext c,
                              PresentationValue *v );
extern int GenericSetShowBox ( PresentationTarget t,
                               PresentationContext c,
                               PresentationValue v );
extern int GenericGetShowBox ( PresentationTarget t,
                               PresentationContext c,
                               PresentationValue *v );
extern int GenericSetPictureMode ( PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue v );
extern int GenericGetPictureMode ( PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue *v );
extern int GenericSetBox ( PresentationTarget t,
                           PresentationContext c,
                           PresentationValue v );
extern int GenericGetBox ( PresentationTarget t,
                           PresentationContext c,
                           PresentationValue * v );
extern int GenericSetBgImage ( PresentationTarget t,
                               PresentationContext c,
                               PresentationValue v );
extern int GenericGetBgImage ( PresentationTarget t,
                               PresentationContext c,
                               PresentationValue * v );
extern int GenericSetWidth ( PresentationTarget t,
                             PresentationContext c,
                             PresentationValue v );
extern int GenericSetVPos ( PresentationTarget t,
                            PresentationContext c,
                            PresentationValue v );
extern int GenericGetVPos ( PresentationTarget t,
                            PresentationContext c,
                            PresentationValue v );
extern int GenericGetHPos ( PresentationTarget t,
                            PresentationContext c,
                            PresentationValue v );
extern int GenericSetHPos ( PresentationTarget t,
                            PresentationContext c,
                            PresentationValue v );
extern int GenericGetHeight ( PresentationTarget t,
                              PresentationContext c,
                              PresentationValue v );
extern int GenericSetHeight ( PresentationTarget t,
                              PresentationContext c,
                              PresentationValue v );

#else /* __STDC__ */

extern GenericContext GetGenericContext (/* Document doc */);
extern void FreeGenericContext (/* GenericContext ctxt */);
extern int GenericCleanPresentation (/* PresentationTarget t,
                                        PresentationContext c,
                                        PresentationValue v */);
extern int GenericUpdatePresentation (/* PresentationTarget t,
                                         PresentationContext c,
                                         PresentationValue v */);
extern void ApplyAllGenericContext (/* Document doc,
                                       GenericTarget target,
                                       GenericContextApplyHandler handler,
                                       void *param */);
extern void ApplyAllGenericSettings (/* GenericTarget target,
                                        GenericContext ctxt,
                                        GenericSettingsApplyHandler handler,
                                        void *param */);
extern int GenericSetForegroundColor (/* PresentationTarget t,
                                         PresentationContext c,
                                         PresentationValue v */);
extern int GenericGetForegroundColor (/* PresentationTarget t,
                                         PresentationContext c,
                                         PresentationValue *v */);
extern int GenericSetBackgroundColor (/* PresentationTarget t,
                                         PresentationContext c,
                                         PresentationValue v */);
extern int GenericGetBackgroundColor (/* PresentationTarget t,
                                         PresentationContext c,
                                         PresentationValue *v */);
extern int GenericSetFontSize (/* PresentationTarget t,
                                  PresentationContext c,
                                  PresentationValue v */);
extern int GenericGetFontSize (/* PresentationTarget t,
                                  PresentationContext c,
                                  PresentationValue *v */);
extern int GenericSetFontStyle (/* PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue v */);
extern int GenericGetFontStyle (/* PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue *v */);
extern int GenericSetAlignment (/* PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue v */);
extern int GenericGetAlignment (/* PresentationTarget t,
                                   PresentationContext c,
                                   PresentationValue *v */);
extern int GenericSetIndent (/* PresentationTarget t,
                                PresentationContext c,
                                PresentationValue v */);
extern int GenericGetIndent (/* PresentationTarget t,
                                PresentationContext c,
                                PresentationValue *v */);
extern int GenericSetJustification (/* PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue v */);
extern int GenericGetJustification (/* PresentationTarget t,
                                       PresentationContext c,
                                       PresentationValue *v */);
extern int GenericSetHyphenation (/* PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue v */);
extern int GenericGetHyphenation (/* PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue *v */);
extern int GenericSetTextUnderlining (/* PresentationTarget t,
                                         PresentationContext c,
                                         PresentationValue v */);
extern int GenericGetTextUnderlining (/* PresentationTarget t,
                                         PresentationContext c,
                                         PresentationValue *v */);
extern int GenericSetFillPattern (/* PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue v */);
extern int GenericGetFillPattern (/* PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue *v */);
extern int GenericSetFontFamily (/* PresentationTarget t,
                                    PresentationContext c,
                                    PresentationValue v */);
extern int GenericGetFontFamily (/* PresentationTarget t,
                                    PresentationContext c,
                                    PresentationValue *v */);
extern int GenericSetLineSpacing (/* PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue v */);
extern int GenericGetLineSpacing (/* PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue *v */);
extern int GenericSetInLine (/* PresentationTarget t,
                                PresentationContext c,
                                PresentationValue v */);
extern int GenericGetInLine (/* PresentationTarget t,
                                PresentationContext c,
                                PresentationValue *v */);
extern int GenericSetShowBox (/* PresentationTarget t,
                                 PresentationContext c,
                                 PresentationValue v */);
extern int GenericGetShowBox (/* PresentationTarget t,
                                 PresentationContext c,
                                 PresentationValue *v */);
extern int GenericSetPictureMode (/* PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue v */);
extern int GenericGetPictureMode (/* PresentationTarget t,
                                     PresentationContext c,
                                     PresentationValue *v */);
extern int GenericSetBox (/* PresentationTarget t,
                             PresentationContext c,
                             PresentationValue v */);
extern int GenericGetBox (/* PresentationTarget t,
                             PresentationContext c,
                             PresentationValue * v */);
extern int GenericSetBgImage (/* PresentationTarget t,
                                 PresentationContext c,
                                 PresentationValue v */);
extern int GenericGetBgImage (/* PresentationTarget t,
                                 PresentationContext c,
                                 PresentationValue * v */);
extern int GenericSetWidth (/* PresentationTarget t,
                               PresentationContext c,
                               PresentationValue v */);
extern int GenericSetVPos (/* PresentationTarget t,
                              PresentationContext c,
                              PresentationValue v */);
extern int GenericGetVPos (/* PresentationTarget t,
                              PresentationContext c,
                              PresentationValue v */);
extern int GenericGetHPos (/* PresentationTarget t,
                              PresentationContext c,
                              PresentationValue v */);
extern int GenericSetHPos (/* PresentationTarget t,
                              PresentationContext c,
                              PresentationValue v */);
extern int GenericGetHeight (/* PresentationTarget t,
                                PresentationContext c,
                                PresentationValue v */);
extern int GenericSetHeight (/* PresentationTarget t,
                                PresentationContext c,
                                PresentationValue v */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */