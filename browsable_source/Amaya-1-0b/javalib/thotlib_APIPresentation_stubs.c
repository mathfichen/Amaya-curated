/*
 * DO NOT EDIT
 * Generated by the following command from /users/veillard/opera/javalib directory
 * ../LINUX-ELF/bin/javastub -T JavaTypes.def -M thotlib_APIPresentation -J ../classes/thotlib/APIPresentation.java ../thotlib/include/presentation.h 
 */
/*
 * Kaffe stubs generated for class thotlib_APIPresentation from includes
 * The user need to write JavaTypes.h which gives the
 * signatures of Java2C and C2Java conversion handlers
 * As well as the Class LOCK/UNLOCK macros
 */

#include <native.h>
#include "JavaTypes.h"
#include "thotlib_APIPresentation.h"
#include "thotlib_APIPresentation_stubs.h"

#ifndef thotlib_APIPresentation_LOCK
#define thotlib_APIPresentation_LOCK() fprintf(stderr,"thotlib_APIPresentation_LOCK undefined");
#endif /* thotlib_APIPresentation_LOCK */
#ifndef thotlib_APIPresentation_UNLOCK
#define thotlib_APIPresentation_UNLOCK() fprintf(stderr,"thotlib_APIPresentation_UNLOCK undefined");
#endif /* thotlib_APIPresentation_UNLOCK */

/*
 * Java to C function TtaNewPRule stub.
 */
jlong
thotlib_APIPresentation_TtaNewPRule(struct Hthotlib_APIPresentation* none, jint presentationType, jint view, jint document)
{
	jlong result;
	PRule res;


	thotlib_APIPresentation_LOCK();

	res = TtaNewPRule((int ) presentationType, (View ) view, (Document ) document);

	thotlib_APIPresentation_UNLOCK();

	/* convert PRule res to jlong result */
	CPRule2Javalong(res, &result);

	return(result);
}

/*
 * Java to C function TtaNewPRuleForNamedView stub.
 */
jlong
thotlib_APIPresentation_TtaNewPRuleForNamedView(struct Hthotlib_APIPresentation* none, jint presentationType, struct Hjava_lang_String* jviewName, jint document)
{
	jlong result;
	PRule res;
	char viewName[1024];
	char *viewName_ptr = &viewName[0];

	if (jviewName != NULL)
	  javaString2CString(jviewName, viewName_ptr, sizeof(viewName));
	else
	  viewName_ptr = NULL;

	thotlib_APIPresentation_LOCK();

	res = TtaNewPRuleForNamedView((int ) presentationType, (char *) viewName_ptr, (Document ) document);

	thotlib_APIPresentation_UNLOCK();

	/* convert PRule res to jlong result */
	CPRule2Javalong(res, &result);

	return(result);
}

/*
 * Java to C function TtaCopyPRule stub.
 */
jlong
thotlib_APIPresentation_TtaCopyPRule(struct Hthotlib_APIPresentation* none, jlong jpRule)
{
	jlong result;
	PRule res;
	PRule pRule;

	/* convert arg jlong jpRule to PRule pRule */
	Javalong2CPRule(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	res = TtaCopyPRule((PRule ) pRule);

	thotlib_APIPresentation_UNLOCK();

	/* convert PRule res to jlong result */
	CPRule2Javalong(res, &result);

	return(result);
}

/*
 * Java to C function TtaAttachPRule stub.
 */
void
thotlib_APIPresentation_TtaAttachPRule(struct Hthotlib_APIPresentation* none, jlong jelement, jlong jpRule, jint document)
{
	Element element;
	PRule pRule;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);
	/* convert arg jlong jpRule to PRule pRule */
	Javalong2CPRule(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	TtaAttachPRule((Element ) element, (PRule ) pRule, (Document ) document);

	thotlib_APIPresentation_UNLOCK();

}

/*
 * Java to C function TtaRemovePRule stub.
 */
void
thotlib_APIPresentation_TtaRemovePRule(struct Hthotlib_APIPresentation* none, jlong jelement, jlong jpRule, jint document)
{
	Element element;
	PRule pRule;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);
	/* convert arg jlong jpRule to PRule pRule */
	Javalong2CPRule(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	TtaRemovePRule((Element ) element, (PRule ) pRule, (Document ) document);

	thotlib_APIPresentation_UNLOCK();

}

/*
 * Java to C function TtaSetPRuleValue stub.
 */
void
thotlib_APIPresentation_TtaSetPRuleValue(struct Hthotlib_APIPresentation* none, jlong jelement, jlong jpRule, jint value, jint document)
{
	Element element;
	PRule pRule;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);
	/* convert arg jlong jpRule to PRule pRule */
	Javalong2CPRule(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	TtaSetPRuleValue((Element ) element, (PRule ) pRule, (int ) value, (Document ) document);

	thotlib_APIPresentation_UNLOCK();

}

/*
 * Java to C function TtaSetPRuleView stub.
 */
void
thotlib_APIPresentation_TtaSetPRuleView(struct Hthotlib_APIPresentation* none, jlong jpRule, jint view)
{
	PRule pRule;

	/* convert arg jlong jpRule to PRule pRule */
	Javalong2CPRule(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	TtaSetPRuleView((PRule ) pRule, (int ) view);

	thotlib_APIPresentation_UNLOCK();

}

/*
 * Java to C function TtaChangeBoxSize stub.
 */
void
thotlib_APIPresentation_TtaChangeBoxSize(struct Hthotlib_APIPresentation* none, jlong jelement, jint document, jint view, jint deltaX, jint deltaY, jint unit)
{
	Element element;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);

	thotlib_APIPresentation_LOCK();

	TtaChangeBoxSize((Element ) element, (Document ) document, (View ) view, (int ) deltaX, (int ) deltaY, (TypeUnit ) unit);

	thotlib_APIPresentation_UNLOCK();

}

/*
 * Java to C function TtaChangeBoxPosition stub.
 */
void
thotlib_APIPresentation_TtaChangeBoxPosition(struct Hthotlib_APIPresentation* none, jlong jelement, jint document, jint view, jint X, jint Y, jint unit)
{
	Element element;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);

	thotlib_APIPresentation_LOCK();

	TtaChangeBoxPosition((Element ) element, (Document ) document, (View ) view, (int ) X, (int ) Y, (TypeUnit ) unit);

	thotlib_APIPresentation_UNLOCK();

}

/*
 * Java to C function TtaGetBoxMaxSize stub.
 */
jint
thotlib_APIPresentation_TtaGetBoxMaxSize(struct Hthotlib_APIPresentation* none, jlong jelement, jint document, jint view, jint unit)
{
	int res;
	Element element;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);

	thotlib_APIPresentation_LOCK();

	res = TtaGetBoxMaxSize((Element ) element, (Document ) document, (View ) view, (TypeUnit ) unit);

	thotlib_APIPresentation_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function TtaGiveBoxSize stub.
 */
void
thotlib_APIPresentation_TtaGiveBoxSize(struct Hthotlib_APIPresentation* none, jlong jelement, jint document, jint view, jint unit, struct Hthotlib_IntPtr* jwidth, struct Hthotlib_IntPtr* jheight)
{
	Element element;
	int *width;
	int *height;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);
	/* convert arg struct Hthotlib_IntPtr* jwidth to int *width */
	JavaIntPtr2CintPtr(jwidth,&width);
	/* convert arg struct Hthotlib_IntPtr* jheight to int *height */
	JavaIntPtr2CintPtr(jheight,&height);

	thotlib_APIPresentation_LOCK();

	TtaGiveBoxSize((Element ) element, (Document ) document, (View ) view, (TypeUnit ) unit, (int *) width, (int *) height);

	thotlib_APIPresentation_UNLOCK();

	/* convert int *width to arg struct Hthotlib_IntPtr* jwidth */
	CintPtr2JavaIntPtr(width,&jwidth);
	/* convert int *height to arg struct Hthotlib_IntPtr* jheight */
	CintPtr2JavaIntPtr(height,&jheight);
}

/*
 * Java to C function TtaGiveBoxPosition stub.
 */
void
thotlib_APIPresentation_TtaGiveBoxPosition(struct Hthotlib_APIPresentation* none, jlong jelement, jint document, jint view, jint unit, struct Hthotlib_IntPtr* jxCoord, struct Hthotlib_IntPtr* jyCoord)
{
	Element element;
	int *xCoord;
	int *yCoord;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);
	/* convert arg struct Hthotlib_IntPtr* jxCoord to int *xCoord */
	JavaIntPtr2CintPtr(jxCoord,&xCoord);
	/* convert arg struct Hthotlib_IntPtr* jyCoord to int *yCoord */
	JavaIntPtr2CintPtr(jyCoord,&yCoord);

	thotlib_APIPresentation_LOCK();

	TtaGiveBoxPosition((Element ) element, (Document ) document, (View ) view, (TypeUnit ) unit, (int *) xCoord, (int *) yCoord);

	thotlib_APIPresentation_UNLOCK();

	/* convert int *xCoord to arg struct Hthotlib_IntPtr* jxCoord */
	CintPtr2JavaIntPtr(xCoord,&jxCoord);
	/* convert int *yCoord to arg struct Hthotlib_IntPtr* jyCoord */
	CintPtr2JavaIntPtr(yCoord,&jyCoord);
}

/*
 * Java to C function TtaNextPRule stub.
 */
void
thotlib_APIPresentation_TtaNextPRule(struct Hthotlib_APIPresentation* none, jlong jelement, struct Hthotlib_PRule* jpRule)
{
	Element element;
	PRule *pRule;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);
	/* convert arg struct Hthotlib_PRule* jpRule to PRule *pRule */
	JavaPRule2CPRulePtr(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	TtaNextPRule((Element ) element, (PRule *) pRule);

	thotlib_APIPresentation_UNLOCK();

	/* convert PRule *pRule to arg struct Hthotlib_PRule* jpRule */
	CPRulePtr2JavaPRule(pRule,&jpRule);
}

/*
 * Java to C function TtaGetPRule stub.
 */
jlong
thotlib_APIPresentation_TtaGetPRule(struct Hthotlib_APIPresentation* none, jlong jelement, jint presentationType)
{
	jlong result;
	PRule res;
	Element element;

	/* convert arg jlong jelement to Element element */
	Javalong2CElement(jelement,&element);

	thotlib_APIPresentation_LOCK();

	res = TtaGetPRule((Element ) element, (int ) presentationType);

	thotlib_APIPresentation_UNLOCK();

	/* convert PRule res to jlong result */
	CPRule2Javalong(res, &result);

	return(result);
}

/*
 * Java to C function TtaGetPRuleType stub.
 */
jint
thotlib_APIPresentation_TtaGetPRuleType(struct Hthotlib_APIPresentation* none, jlong jpRule)
{
	int res;
	PRule pRule;

	/* convert arg jlong jpRule to PRule pRule */
	Javalong2CPRule(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	res = TtaGetPRuleType((PRule ) pRule);

	thotlib_APIPresentation_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function TtaGetPRuleValue stub.
 */
jint
thotlib_APIPresentation_TtaGetPRuleValue(struct Hthotlib_APIPresentation* none, jlong jpRule)
{
	int res;
	PRule pRule;

	/* convert arg jlong jpRule to PRule pRule */
	Javalong2CPRule(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	res = TtaGetPRuleValue((PRule ) pRule);

	thotlib_APIPresentation_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function TtaGetPRuleView stub.
 */
jint
thotlib_APIPresentation_TtaGetPRuleView(struct Hthotlib_APIPresentation* none, jlong jpRule)
{
	int res;
	PRule pRule;

	/* convert arg jlong jpRule to PRule pRule */
	Javalong2CPRule(jpRule,&pRule);

	thotlib_APIPresentation_LOCK();

	res = TtaGetPRuleView((PRule ) pRule);

	thotlib_APIPresentation_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function TtaSamePRules stub.
 */
jint
thotlib_APIPresentation_TtaSamePRules(struct Hthotlib_APIPresentation* none, jlong jpRule1, jlong jpRule2)
{
	int res;
	PRule pRule1;
	PRule pRule2;

	/* convert arg jlong jpRule1 to PRule pRule1 */
	Javalong2CPRule(jpRule1,&pRule1);
	/* convert arg jlong jpRule2 to PRule pRule2 */
	Javalong2CPRule(jpRule2,&pRule2);

	thotlib_APIPresentation_LOCK();

	res = TtaSamePRules((PRule ) pRule1, (PRule ) pRule2);

	thotlib_APIPresentation_UNLOCK();


	return((jint) res);
}

/*
 * Function to register all thotlib_APIPresentation stubs.
 */
void register_thotlib_APIPresentation_stubs(void)
{
	addNativeMethod("thotlib_APIPresentation_TtaNewPRule", thotlib_APIPresentation_TtaNewPRule);
	addNativeMethod("thotlib_APIPresentation_TtaNewPRuleForNamedView", thotlib_APIPresentation_TtaNewPRuleForNamedView);
	addNativeMethod("thotlib_APIPresentation_TtaCopyPRule", thotlib_APIPresentation_TtaCopyPRule);
	addNativeMethod("thotlib_APIPresentation_TtaAttachPRule", thotlib_APIPresentation_TtaAttachPRule);
	addNativeMethod("thotlib_APIPresentation_TtaRemovePRule", thotlib_APIPresentation_TtaRemovePRule);
	addNativeMethod("thotlib_APIPresentation_TtaSetPRuleValue", thotlib_APIPresentation_TtaSetPRuleValue);
	addNativeMethod("thotlib_APIPresentation_TtaSetPRuleView", thotlib_APIPresentation_TtaSetPRuleView);
	addNativeMethod("thotlib_APIPresentation_TtaChangeBoxSize", thotlib_APIPresentation_TtaChangeBoxSize);
	addNativeMethod("thotlib_APIPresentation_TtaChangeBoxPosition", thotlib_APIPresentation_TtaChangeBoxPosition);
	addNativeMethod("thotlib_APIPresentation_TtaGetBoxMaxSize", thotlib_APIPresentation_TtaGetBoxMaxSize);
	addNativeMethod("thotlib_APIPresentation_TtaGiveBoxSize", thotlib_APIPresentation_TtaGiveBoxSize);
	addNativeMethod("thotlib_APIPresentation_TtaGiveBoxPosition", thotlib_APIPresentation_TtaGiveBoxPosition);
	addNativeMethod("thotlib_APIPresentation_TtaNextPRule", thotlib_APIPresentation_TtaNextPRule);
	addNativeMethod("thotlib_APIPresentation_TtaGetPRule", thotlib_APIPresentation_TtaGetPRule);
	addNativeMethod("thotlib_APIPresentation_TtaGetPRuleType", thotlib_APIPresentation_TtaGetPRuleType);
	addNativeMethod("thotlib_APIPresentation_TtaGetPRuleValue", thotlib_APIPresentation_TtaGetPRuleValue);
	addNativeMethod("thotlib_APIPresentation_TtaGetPRuleView", thotlib_APIPresentation_TtaGetPRuleView);
	addNativeMethod("thotlib_APIPresentation_TtaSamePRules", thotlib_APIPresentation_TtaSamePRules);
}
