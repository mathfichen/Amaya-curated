/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern void BuildPathDocBuffer ( STRING bufDir,
                                 CHAR_T separator,
                                 int *nbItems );
extern int SearchStringInBuffer ( CHAR_T* buffer,
                                  PathBuffer s,
                                  int nbStr );
extern void BuildSchPresNameMenu ( PtrSSchema pSchStr,
                                   Name name );
extern void CallbackSchPresNameMenu ( int ref,
                                      int typedata,
                                      STRING data );
extern void CallbackImportMenu ( int ref,
                                 int typedata,
                                 STRING data );
extern void CallbackOpenDocMenu ( int ref,
                                  int typedata,
                                  STRING data );
extern void TtcOpenDocument ( Document document,
                              View view );

#else /* __STDC__ */

extern void BuildPathDocBuffer (/* STRING bufDir,
                                   CHAR_T separator,
                                   int *nbItems */);
extern int SearchStringInBuffer (/* CHAR_T* buffer,
                                    PathBuffer s,
                                    int nbStr */);
extern void BuildSchPresNameMenu (/* PtrSSchema pSchStr,
                                     Name name */);
extern void CallbackSchPresNameMenu (/* int ref,
                                        int typedata,
                                        STRING data */);
extern void CallbackImportMenu (/* int ref,
                                   int typedata,
                                   STRING data */);
extern void CallbackOpenDocMenu (/* int ref,
                                    int typedata,
                                    STRING data */);
extern void TtcOpenDocument (/* Document document,
                                View view */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */