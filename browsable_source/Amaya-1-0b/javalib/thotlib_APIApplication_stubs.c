/*
 * DO NOT EDIT
 * Generated by the following command from /users/veillard/opera/javalib directory
 * ../LINUX-ELF/bin/javastub -T JavaTypes.def -M thotlib_APIApplication -J ../classes/thotlib/APIApplication.java ../thotlib/include/application.h 
 */
/*
 * Kaffe stubs generated for class thotlib_APIApplication from includes
 * The user need to write JavaTypes.h which gives the
 * signatures of Java2C and C2Java conversion handlers
 * As well as the Class LOCK/UNLOCK macros
 */

#include <native.h>
#include "JavaTypes.h"
#include "thotlib_APIApplication.h"
#include "thotlib_APIApplication_stubs.h"

#ifndef thotlib_APIApplication_LOCK
#define thotlib_APIApplication_LOCK() fprintf(stderr,"thotlib_APIApplication_LOCK undefined");
#endif /* thotlib_APIApplication_LOCK */
#ifndef thotlib_APIApplication_UNLOCK
#define thotlib_APIApplication_UNLOCK() fprintf(stderr,"thotlib_APIApplication_UNLOCK undefined");
#endif /* thotlib_APIApplication_UNLOCK */

/*
 * Java to C function TtaInitialize stub.
 */
void
thotlib_APIApplication_TtaInitialize(struct Hthotlib_APIApplication* none, struct Hjava_lang_String* japplicationName)
{
	char applicationName[1024];
	char *applicationName_ptr = &applicationName[0];

	if (japplicationName != NULL)
	  javaString2CString(japplicationName, applicationName_ptr, sizeof(applicationName));
	else
	  applicationName_ptr = NULL;

	thotlib_APIApplication_LOCK();

	TtaInitialize((char *) applicationName_ptr);

	thotlib_APIApplication_UNLOCK();

}

/*
 * Java to C function TtaQuit stub.
 */
void
thotlib_APIApplication_TtaQuit(struct Hthotlib_APIApplication* none)
{


	thotlib_APIApplication_LOCK();

	TtaQuit();

	thotlib_APIApplication_UNLOCK();

}

/*
 * Java to C function TtaSetErrorMessages stub.
 */
void
thotlib_APIApplication_TtaSetErrorMessages(struct Hthotlib_APIApplication* none, jint on)
{


	thotlib_APIApplication_LOCK();

	TtaSetErrorMessages((int ) on);

	thotlib_APIApplication_UNLOCK();

}

/*
 * Java to C function TtaGetVersion stub.
 */
struct Hjava_lang_String*
thotlib_APIApplication_TtaGetVersion(struct Hthotlib_APIApplication* none)
{
	char *res;


	thotlib_APIApplication_LOCK();

	res = TtaGetVersion();

	thotlib_APIApplication_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Java to C function TtaGetErrorCode stub.
 */
jint
thotlib_APIApplication_TtaGetErrorCode(struct Hthotlib_APIApplication* none)
{
	int res;


	thotlib_APIApplication_LOCK();

	res = TtaGetErrorCode();

	thotlib_APIApplication_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function TtaGetStrError stub.
 */
struct Hjava_lang_String*
thotlib_APIApplication_TtaGetStrError(struct Hthotlib_APIApplication* none, jint errorCode)
{
	char *res;


	thotlib_APIApplication_LOCK();

	res = TtaGetStrError((int ) errorCode);

	thotlib_APIApplication_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Java to C function TtaExtractName stub.
 */
void
thotlib_APIApplication_TtaExtractName(struct Hthotlib_APIApplication* none, struct Hjava_lang_String* jtext, struct Hjava_lang_StringBuffer* jaDirectory, struct Hjava_lang_StringBuffer* jaName)
{
	char text[1024];
	char *text_ptr = &text[0];
	char *aDirectory;
	char *aName;

	if (jtext != NULL)
	  javaString2CString(jtext, text_ptr, sizeof(text));
	else
	  text_ptr = NULL;
	/* convert arg struct Hjava_lang_StringBuffer* jaDirectory to char *aDirectory */
	JavaStringBuffer2CcharPtr(jaDirectory,&aDirectory);
	/* convert arg struct Hjava_lang_StringBuffer* jaName to char *aName */
	JavaStringBuffer2CcharPtr(jaName,&aName);

	thotlib_APIApplication_LOCK();

	TtaExtractName((char *) text_ptr, (char *) aDirectory, (char *) aName);

	thotlib_APIApplication_UNLOCK();

	/* convert char *aDirectory to arg struct Hjava_lang_StringBuffer* jaDirectory */
	CcharPtr2JavaStringBuffer(aDirectory,&jaDirectory);
	/* convert char *aName to arg struct Hjava_lang_StringBuffer* jaName */
	CcharPtr2JavaStringBuffer(aName,&jaName);
}

/*
 * Java to C function TtaCheckDirectory stub.
 */
jint
thotlib_APIApplication_TtaCheckDirectory(struct Hthotlib_APIApplication* none, struct Hjava_lang_String* jaDirectory)
{
	boolean res;
	char aDirectory[1024];
	char *aDirectory_ptr = &aDirectory[0];

	if (jaDirectory != NULL)
	  javaString2CString(jaDirectory, aDirectory_ptr, sizeof(aDirectory));
	else
	  aDirectory_ptr = NULL;

	thotlib_APIApplication_LOCK();

	res = TtaCheckDirectory((char *) aDirectory_ptr);

	thotlib_APIApplication_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function TtaStrdup stub.
 */
struct Hjava_lang_String*
thotlib_APIApplication_TtaStrdup(struct Hthotlib_APIApplication* none, struct Hjava_lang_String* jstr)
{
	char *res;
	char str[1024];
	char *str_ptr = &str[0];

	if (jstr != NULL)
	  javaString2CString(jstr, str_ptr, sizeof(str));
	else
	  str_ptr = NULL;

	thotlib_APIApplication_LOCK();

	res = TtaStrdup((char *) str_ptr);

	thotlib_APIApplication_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Function to register all thotlib_APIApplication stubs.
 */
void register_thotlib_APIApplication_stubs(void)
{
	addNativeMethod("thotlib_APIApplication_TtaInitialize", thotlib_APIApplication_TtaInitialize);
	addNativeMethod("thotlib_APIApplication_TtaQuit", thotlib_APIApplication_TtaQuit);
	addNativeMethod("thotlib_APIApplication_TtaSetErrorMessages", thotlib_APIApplication_TtaSetErrorMessages);
	addNativeMethod("thotlib_APIApplication_TtaGetVersion", thotlib_APIApplication_TtaGetVersion);
	addNativeMethod("thotlib_APIApplication_TtaGetErrorCode", thotlib_APIApplication_TtaGetErrorCode);
	addNativeMethod("thotlib_APIApplication_TtaGetStrError", thotlib_APIApplication_TtaGetStrError);
	addNativeMethod("thotlib_APIApplication_TtaExtractName", thotlib_APIApplication_TtaExtractName);
	addNativeMethod("thotlib_APIApplication_TtaCheckDirectory", thotlib_APIApplication_TtaCheckDirectory);
	addNativeMethod("thotlib_APIApplication_TtaStrdup", thotlib_APIApplication_TtaStrdup);
}
