/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern int IdentDocument ( PtrDocument pDoc );
extern void CloseInsertion ( void );
extern void GetViewInfo ( Document document,
                          View view,
                          int *viewnumber,
                          ThotBool * assoc );
extern int GetWindowNumber ( Document document,
                             View view );
extern ThotBool TtaIsPrinting ( void );
extern ThotWidget TtaGetViewFrame ( Document document,
                                    View view );
extern void InitErrorHandler ( void );
extern void TtaInitialize ( CHAR_T* applicationName );
extern void TtaSetApplicationQuit ( Proc procedure );
extern void TtaQuit ( void );
extern void TtaSetErrorMessages ( int on );
extern STRING TtaGetVersion ( void );
extern int TtaGetErrorCode ( void );
extern STRING TtaGetStrError ( int errorCode );
extern void ThotExit ( int result );

#else /* __STDC__ */

extern int IdentDocument (/* PtrDocument pDoc */);
extern void CloseInsertion (/* void */);
extern void GetViewInfo (/* Document document,
                            View view,
                            int *viewnumber,
                            ThotBool * assoc */);
extern int GetWindowNumber (/* Document document,
                               View view */);
extern ThotBool TtaIsPrinting (/* void */);
extern ThotWidget TtaGetViewFrame (/* Document document,
                                      View view */);
extern void InitErrorHandler (/* void */);
extern void TtaInitialize (/* CHAR_T* applicationName */);
extern void TtaSetApplicationQuit (/* Proc procedure */);
extern void TtaQuit (/* void */);
extern void TtaSetErrorMessages (/* int on */);
extern STRING TtaGetVersion (/* void */);
extern int TtaGetErrorCode (/* void */);
extern STRING TtaGetStrError (/* int errorCode */);
extern void ThotExit (/* int result */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */