/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern ThotBool TtaLoadDocumentDictionary ( PtrDocument document,
                                            int *pDictionary,
                                            ThotBool ToCreate );
extern void SetUpperCase ( STRING string );
extern void SetCapital ( STRING string );
extern ThotBool IsUpperCase ( STRING string );
extern ThotBool IsCapital ( STRING string );
extern ThotBool IsIso ( STRING string );
extern int WordInDictionary ( CHAR_T word[MAX_WORD_LEN],
                              PtrDict dict );
extern int CheckWord ( CHAR_T word[MAX_WORD_LEN],
                       Language language,
                       PtrDict dict );
extern void AddWord ( CHAR_T word[MAX_WORD_LEN],
                      PtrDict * pDict );
extern void GiveProposal ( Language language,
                           PtrDict docDict );
extern int ParametrizeChecker ( void );
extern void WordReplace ( CHAR_T orgWord[MAX_WORD_LEN],
                          CHAR_T newWord[MAX_WORD_LEN] );
extern ThotBool CheckChangeSelection ( void );
extern void NextSpellingError ( CHAR_T word[MAX_WORD_LEN],
                                PtrDict docDict );

#else /* __STDC__ */

extern ThotBool TtaLoadDocumentDictionary (/* PtrDocument document,
                                              int *pDictionary,
                                              ThotBool ToCreate */);
extern void SetUpperCase (/* STRING string */);
extern void SetCapital (/* STRING string */);
extern ThotBool IsUpperCase (/* STRING string */);
extern ThotBool IsCapital (/* STRING string */);
extern ThotBool IsIso (/* STRING string */);
extern int WordInDictionary (/* CHAR_T word[MAX_WORD_LEN],
                                PtrDict dict */);
extern int CheckWord (/* CHAR_T word[MAX_WORD_LEN],
                         Language language,
                         PtrDict dict */);
extern void AddWord (/* CHAR_T word[MAX_WORD_LEN],
                        PtrDict * pDict */);
extern void GiveProposal (/* Language language,
                             PtrDict docDict */);
extern int ParametrizeChecker (/* void */);
extern void WordReplace (/* CHAR_T orgWord[MAX_WORD_LEN],
                            CHAR_T newWord[MAX_WORD_LEN] */);
extern ThotBool CheckChangeSelection (/* void */);
extern void NextSpellingError (/* CHAR_T word[MAX_WORD_LEN],
                                  PtrDict docDict */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */