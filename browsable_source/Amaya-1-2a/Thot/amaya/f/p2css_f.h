/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern void PrintRPI ( PRuleInfoPtr rpi );
extern void PrintListRPI ( PRuleInfoPtr list );
extern void AddRPI ( PRuleInfoPtr rpi,
                     PRuleInfoPtr * list );
extern void FreeRPI ( PRuleInfoPtr rpi );
extern void CleanListRPI ( PRuleInfoPtr * list );
extern PRuleInfoPtr NewRPI ( Document doc );
extern int CmpRPI ( PRuleInfoPtr cour,
                    PRuleInfoPtr rpi );
extern PRuleInfoPtr SearchRPI ( PRuleInfoPtr cour,
                                PRuleInfoPtr list );
extern void RemoveRPI ( Document doc,
                        PRuleInfoPtr cour );
extern PRuleInfoPtr PSchema2RPI ( Document doc,
                                  CSSInfoPtr css );
extern int BuildRPIList ( Document doc,
                          CSSInfoPtr css,
                          char *buf,
                          int size );

#else /* __STDC__ */

extern void PrintRPI (/* PRuleInfoPtr rpi */);
extern void PrintListRPI (/* PRuleInfoPtr list */);
extern void AddRPI (/* PRuleInfoPtr rpi,
                       PRuleInfoPtr * list */);
extern void FreeRPI (/* PRuleInfoPtr rpi */);
extern void CleanListRPI (/* PRuleInfoPtr * list */);
extern PRuleInfoPtr NewRPI (/* Document doc */);
extern int CmpRPI (/* PRuleInfoPtr cour,
                      PRuleInfoPtr rpi */);
extern PRuleInfoPtr SearchRPI (/* PRuleInfoPtr cour,
                                  PRuleInfoPtr list */);
extern void RemoveRPI (/* Document doc,
                          PRuleInfoPtr cour */);
extern PRuleInfoPtr PSchema2RPI (/* Document doc,
                                    CSSInfoPtr css */);
extern int BuildRPIList (/* Document doc,
                            CSSInfoPtr css,
                            char *buf,
                            int size */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */