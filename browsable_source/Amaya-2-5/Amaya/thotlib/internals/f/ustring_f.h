/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern int uputchar (int);
extern int ustrcasecmp ( const CHAR_T* str1,
                         const CHAR_T* str2 );
extern CHAR_T* ustrcat ( CHAR_T* dest,
                         const CHAR_T* src );
extern CHAR_T* ustrchr ( const CHAR_T* src,
                         CHAR_T c );
extern int ustrcmp ( const CHAR_T* str1,
                     const CHAR_T* str2 );
extern int ustrcoll ( const CHAR_T* str1,
                      const CHAR_T* str2 );
extern CHAR_T* ustrcpy ( CHAR_T* dest,
                         const CHAR_T* src );
extern CHAR_T* ustrdup ( const CHAR_T* str );
extern CHAR_T* iso2wc_strcpy ( CHAR_T* dest,
                               const char* src );
extern size_t ustrlen ( const CHAR_T* str );
extern int ustrncasecmp ( const CHAR_T* str1,
                          const CHAR_T* str2,
                          unsigned int count );
extern CHAR_T* ustrncat ( CHAR_T* dest,
                          const CHAR_T* src,
                          unsigned int count );
extern CHAR_T* ustrncmp ( const CHAR_T* str1,
                          const CHAR_T* str2,
                          unsigned int count );
extern CHAR_T* ustrncpy ( CHAR_T* dest,
                          const CHAR_T* src,
                          unsigned int count );
extern CHAR_T* ustrrchr ( const CHAR_T* str,
                          CHAR_T c );
extern CHAR_T* ustrtok ( CHAR_T* str,
                         const CHAR_T* delemiter );
extern CHAR_T* ustrstr ( const CHAR_T* str,
                         const CHAR_T* strCharSet );
extern int wc2iso_strcasecmp ( const CHAR_T* str1,
                               const char* str2 );
extern int iso2wc_strcasecmp ( const char* str1,
                               const CHAR_T* str2 );
extern char* wc2iso_strcpy ( char* dest,
                             const CHAR_T* src );
extern char* wc2iso_strncpy ( char* dest,
                              const CHAR_T* src,
                              int count );
extern int wc2iso_strcmp ( CHAR_T* str1,
                           const char* str2 );
extern int TtaGetNextWideCharFromMultibyteString ( CHAR_T* car,
                                                   unsigned char** txt,
                                                   CHARSET encoding );

#else /* __STDC__ */

extern int uputchar (/* int */);

extern int ustrcasecmp (/* const CHAR_T* str1,
                           const CHAR_T* str2 */);
extern CHAR_T* ustrcat (/* CHAR_T* dest,
                           const CHAR_T* src */);
extern CHAR_T* ustrchr (/* const CHAR_T* src,
                           CHAR_T c */);
extern int ustrcmp (/* const CHAR_T* str1,
                       const CHAR_T* str2 */);
extern int ustrcoll (/* const CHAR_T* str1,
                        const CHAR_T* str2 */);
extern CHAR_T* ustrcpy (/* CHAR_T* dest,
                           const CHAR_T* src */);
extern CHAR_T* ustrdup (/* const CHAR_T* str */);
extern CHAR_T* iso2wc_strcpy (/* CHAR_T* dest,
                                 const char* src */);
extern size_t ustrlen (/* const CHAR_T* str */);
extern int ustrncasecmp (/* const CHAR_T* str1,
                            const CHAR_T* str2,
                            unsigned int count */);
extern CHAR_T* ustrncat (/* CHAR_T* dest,
                            const CHAR_T* src,
                            unsigned int count */);
extern CHAR_T* ustrncmp (/* const CHAR_T* str1,
                            const CHAR_T* str2,
                            unsigned int count */);
extern CHAR_T* ustrncpy (/* CHAR_T* dest,
                            const CHAR_T* src,
                            unsigned int count */);
extern CHAR_T* ustrrchr (/* const CHAR_T* str,
                            CHAR_T c */);
extern CHAR_T* ustrtok (/* CHAR_T* str,
                           const CHAR_T* delemiter */);
extern CHAR_T* ustrstr (/* const CHAR_T* str,
                           const CHAR_T* strCharSet */);
extern int wc2iso_strcasecmp (/* const CHAR_T* str1,
                                 const char* str2 */);
extern int iso2wc_strcasecmp (/* const char* str1,
                                 const CHAR_T* str2 */);
extern char* wc2iso_strcpy (/* char* dest,
                               const CHAR_T* src */);
extern char* wc2iso_strncpy (/* char* dest,
                                const CHAR_T* src,
                                int count */);
extern int wc2iso_strcmp (/* CHAR_T* str1,
                             const char* str2 */);
extern int TtaGetNextWideCharFromMultibyteString (/* CHAR_T* car,
                                                     unsigned char** txt,
                                                     CHARSET encoding */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */