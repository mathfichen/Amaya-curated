/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern int ustrcasecmp ( STRING str1,
                         const STRING str2 );
extern STRING ustrcat ( STRING dest,
                        const STRING src );
extern STRING ustrchr ( const STRING src,
                        CHAR_T c );
extern int ustrcmp ( const STRING str1,
                     const STRING str2 );
extern int ustrcoll ( const STRING str1,
                      const STRING str2 );
extern STRING ustrcpy ( STRING dest,
                        const STRING src );
extern STRING ustrdup ( const STRING str );
extern size_t ustrlen ( const STRING str );
extern int ustrncasecmp ( STRING str1,
                          const STRING str2,
                          unsigned int count );
extern STRING ustrncat ( STRING dest,
                         const STRING src,
                         unsigned int count );
extern STRING ustrncmp ( const STRING str1,
                         const STRING str2,
                         unsigned int count );
extern STRING ustrncpy ( STRING dest,
                         const STRING src,
                         unsigned int count );
extern STRING ustrrchr ( const STRING str,
                         CHAR_T c );
extern STRING ustrtok ( STRING str,
                        const STRING delemiter );
extern STRING ustrstr ( const STRING str,
                        const STRING strCharSet );

#else /* __STDC__ */

extern int ustrcasecmp (/* STRING str1,
                           const STRING str2 */);
extern STRING ustrcat (/* STRING dest,
                          const STRING src */);
extern STRING ustrchr (/* const STRING src,
                          CHAR_T c */);
extern int ustrcmp (/* const STRING str1,
                       const STRING str2 */);
extern int ustrcoll (/* const STRING str1,
                        const STRING str2 */);
extern STRING ustrcpy (/* STRING dest,
                          const STRING src */);
extern STRING ustrdup (/* const STRING str */);
extern size_t ustrlen (/* const STRING str */);
extern int ustrncasecmp (/* STRING str1,
                            const STRING str2,
                            unsigned int count */);
extern STRING ustrncat (/* STRING dest,
                           const STRING src,
                           unsigned int count */);
extern STRING ustrncmp (/* const STRING str1,
                           const STRING str2,
                           unsigned int count */);
extern STRING ustrncpy (/* STRING dest,
                           const STRING src,
                           unsigned int count */);
extern STRING ustrrchr (/* const STRING str,
                           CHAR_T c */);
extern STRING ustrtok (/* STRING str,
                          const STRING delemiter */);
extern STRING ustrstr (/* const STRING str,
                          const STRING strCharSet */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */