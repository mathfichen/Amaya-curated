/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern void DisplayConfirmMessage ( STRING text );
extern void DisplayMessage ( STRING text,
                             int msgType );
extern void TtaError ( int errorCode );
extern void CompilerMessage ( int index,
                              int origin,
                              int level,
                              int msgCode,
                              USTRING inputline,
                              int lineNum );
extern void CompilerMessageString ( int index,
                                    int origin,
                                    int level,
                                    int msgCode,
                                    STRING inputline,
                                    int lineNum,
                                    STRING string );

#else /* __STDC__ */

extern void DisplayConfirmMessage (/* STRING text */);
extern void DisplayMessage (/* STRING text,
                               int msgType */);
extern void TtaError (/* int errorCode */);
extern void CompilerMessage (/* int index,
                                int origin,
                                int level,
                                int msgCode,
                                USTRING inputline,
                                int lineNum */);
extern void CompilerMessageString (/* int index,
                                      int origin,
                                      int level,
                                      int msgCode,
                                      STRING inputline,
                                      int lineNum,
                                      STRING string */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */