/* DO NOT EDIT THIS FILE - it is machine generated */
#include <native.h>
/* Header for class thotlib_Application */

#ifndef _Included_thotlib_Application
#define _Included_thotlib_Application

#ifdef __cplusplus
extern "C" {
#endif

typedef struct Classthotlib_Application {
	int __DUMMY__;
} Classthotlib_Application;
HandleTo(thotlib_Application);

extern void thotlib_Application_TtaInitialize(struct Hthotlib_Application*, struct Hjava_lang_String*);
extern void thotlib_Application_TtaQuit(struct Hthotlib_Application*);
extern void thotlib_Application_TtaSetErrorMessages(struct Hthotlib_Application*, jint);
extern struct Hjava_lang_String* thotlib_Application_TtaGetVersion(struct Hthotlib_Application*);
extern jint thotlib_Application_TtaGetErrorCode(struct Hthotlib_Application*);
extern struct Hjava_lang_String* thotlib_Application_TtaGetStrError(struct Hthotlib_Application*, jint);
extern void thotlib_Application_TtaExtractName(struct Hthotlib_Application*, struct Hjava_lang_String*, struct Hjava_lang_String*, struct Hjava_lang_String*);
extern jint /* bool */ thotlib_Application_TtaCheckDirectory(struct Hthotlib_Application*, struct Hjava_lang_String*);
extern struct Hjava_lang_String* thotlib_Application_TtaStrdup(struct Hthotlib_Application*, struct Hjava_lang_String*);

#ifdef __cplusplus
}
#endif

#endif