#ifndef _USTRING_H
#define _USTRING_H

#include <string.h>

#ifdef _WINDOWS
#include <windows.h>
#endif /* _WINDOWS */

#include <wchar.h>

#ifdef _WINDOWS
#define strncasecmp _strnicmp
#endif /* _WINDOWS */

typedef enum {
   UNDEFINED_CHARSET,
   US_ASCII,
   ISO_8859_1,
   ISO_8859_2, 
   ISO_8859_3, 
   ISO_8859_4, 
   ISO_8859_5,
   ISO_8859_6, 
   ISO_8859_6_E,
   ISO_8859_6_I,
   ISO_8859_7, 
   ISO_8859_8,
   ISO_8859_8_E,
   ISO_8859_8_I,
   ISO_8859_9, 
   ISO_8859_10,
   ISO_8859_15,
   ISO_8859_supp,
   UNICODE_1_1,
   UNICODE_1_1_UTF_7,
   UTF_7,
   UTF_8,
   WINDOWS_1250,
   WINDOWS_1251,
   WINDOWS_1252,
   WINDOWS_1253,
   WINDOWS_1254,
   WINDOWS_1255,
   WINDOWS_1256,
   WINDOWS_1257,
   WINDOWS_1258
} CHARSET;

#ifdef _I18N_

typedef wchar_t  CHAR_T;
typedef wchar_t* PCHAR_T;
typedef wchar_t  UCHAR_T;
typedef wchar_t* PUCHAR_T;
typedef wchar_t* STRING;
typedef wchar_t* USTRING;

#else  /* _I18N_ */

typedef char            CHAR_T;
typedef char*           PCHAR_T;
typedef unsigned char   UCHAR_T;
typedef unsigned char*  PUCHAR_T;
typedef char*           STRING;
typedef unsigned char*  USTRING;

#endif /* _I18N_ */

#ifdef __STDC__
extern int          uputchar                              (int);
extern int          ustrcasecmp                           (const CHAR_T*, const CHAR_T*);
extern CHAR_T*      ustrcat                               (CHAR_T*, const CHAR_T*);
extern CHAR_T*      ustrchr                               (const CHAR_T*, CHAR_T);
extern int          ustrcmp                               (const CHAR_T*, const CHAR_T*);
extern int          ustrcoll                              (const CHAR_T*, const CHAR_T*);
extern CHAR_T*      ustrcpy                               (CHAR_T*, const CHAR_T*);
extern CHAR_T*      ustrdup                               (const CHAR_T*);
extern size_t       ustrlen                               (const CHAR_T*);
extern int          ustrncasecmp                          (const CHAR_T*, const CHAR_T*, unsigned int);
extern CHAR_T*      ustrncat                              (CHAR_T*, const CHAR_T*, unsigned int);
extern CHAR_T*      ustrncmp                              (const CHAR_T*, const CHAR_T*, unsigned int);
extern CHAR_T*      ustrncpy                              (CHAR_T*, const CHAR_T*, unsigned int);
extern CHAR_T*      ustrrchr                              (const CHAR_T*, CHAR_T);
extern CHAR_T*      ustrstr                               (const CHAR_T*, const CHAR_T*);
extern CHAR_T*      ustrtok                               (CHAR_T*, const CHAR_T*);
extern char*        wc2iso_strncpy                        (char*, const CHAR_T*, int);
extern int          wc2iso_strcasecmp                     (const CHAR_T*, const char*);
extern int          iso2wc_strcasecmp                     (const char*, const CHAR_T*);
extern int          wc2iso_strcmp                         (CHAR_T*, const char*);
extern CHAR_T*      iso2wc_strcpy                         (CHAR_T* dest, const char* src);
extern char*        wc2iso_strcpy                         (char*, const CHAR_T*);
extern CHARSET      TtaGetCharset                         (const CHAR_T*);
extern int          TtaGetNextWideCharFromMultibyteString (CHAR_T*, unsigned char**, CHARSET);

#else  /* __STDC__ */
extern int          uputchar                              ();
extern int          ustrcasecmp                           ();
extern int          cus2iso_strcasecmp                    ();
extern int          iso2cus_strcasecmp                    ();
extern CHAR_T*      ustrcat                               ();
extern CHAR_T*      ustrchr                               ();
extern int          ustrcmp                               ();
extern int          ustrcoll                              ();
extern CHAR_T*      ustrcpy                               ();
extern CHAR_T*      ustrdup                               ();
extern size_t       ustrlen                               ();
extern int          ustrncasecmp                          ();
extern CHAR_T*      ustrncat                              ();
extern CHAR_T*      ustrncmp                              ();
extern CHAR_T*      ustrncpy                              ();
extern CHAR_T*      ustrrchr                              ();
extern CHAR_T*      ustrstr                               ();
extern CHAR_T*      ustrtok                               ();
extern char*        wc2iso_strncpy                        ();
extern int          wc2iso_strcasecmp                     ();
extern int          iso2wc_strcasecmp                     ();
extern int          wc2iso_strcmp                         ();
extern CHAR_T*      iso2wc_strcpy                         ();
extern CHAR_T*      cus2wc_strcpy                         ();
extern char*        wc2iso_strcpy                         ();
extern CHARSET      TtaGetCharset                         ();
extern int          TtaGetNextWideCharFromMultibyteString ();
#endif /* __STDC__ */

#endif /* _USTRING_H */

