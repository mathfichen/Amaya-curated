/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern struct liteClue_context_str * alloc_liteClue_context ( void );
extern void free_widget_context ( XcgLiteClueWidget cw,
                                  struct liteClue_context_str * obj );
extern void XcgLiteClueAddWidget ( Widget w,
                                   Widget watch,
                                   STRING text,
                                   int size,
                                   int option );
extern void XcgLiteClueDeleteWidget ( Widget w,
                                      Widget watch );
extern void XcgLiteClueSetSensitive ( Widget w,
                                      Widget watch,
                                      Boolean sensitive );
extern Boolean XcgLiteClueGetSensitive ( Widget w,
                                         Widget watch );
extern Boolean XcgLiteClueDispatchEvent ( Widget w,
                                          XEvent *event );

#else /* __STDC__ */

extern struct liteClue_context_str * alloc_liteClue_context (/* void */);
extern void free_widget_context (/* XcgLiteClueWidget cw,
                                    struct liteClue_context_str * obj */);
extern void XcgLiteClueAddWidget (/* Widget w,
                                     Widget watch,
                                     STRING text,
                                     int size,
                                     int option */);
extern void XcgLiteClueDeleteWidget (/* Widget w,
                                        Widget watch */);
extern void XcgLiteClueSetSensitive (/* Widget w,
                                        Widget watch,
                                        Boolean sensitive */);
extern Boolean XcgLiteClueGetSensitive (/* Widget w,
                                           Widget watch */);
extern Boolean XcgLiteClueDispatchEvent (/* Widget w,
                                            XEvent *event */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */