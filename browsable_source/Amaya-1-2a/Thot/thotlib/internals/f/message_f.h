/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern char *AsciiTranslate ( char *pBuffer );
extern int TtaGetMessageTable ( CONST char *msgName,
                                int msgNumber );
extern void FreeAllMessages ( void );
extern char *TtaGetMessage ( int origin,
                             int num );
extern void TtaDisplayMessage ( int msgType,
                                char *fmt,
                                ... );
extern void TtaDisplaySimpleMessage ( int msgType,
                                      int origin,
                                      int number );
extern void DisplayPivotMessage ( char *code );

#else /* __STDC__ */

extern char *AsciiTranslate (/* char *pBuffer */);
extern int TtaGetMessageTable (/* CONST char *msgName,
                                  int msgNumber */);
extern void FreeAllMessages (/* void */);
extern char *TtaGetMessage (/* int origin,
                               int num */);
extern void TtaDisplayMessage (/* int msgType,
                                  char *fmt,
                                  ... */);
extern void TtaDisplaySimpleMessage (/* int msgType,
                                        int origin,
                                        int number */);
extern void DisplayPivotMessage (/* char *code */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */