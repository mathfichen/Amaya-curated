/*
 * DO NOT EDIT
 * Generated by the following command from /users/veillard/opera/javalib directory
 * ../LINUX-ELF/bin/javastub -T JavaTypes.def -M amaya_APIJavaAmaya -J ../classes/amaya/APIJavaAmaya.java ../amaya/javaamaya.h 
 */
/*
 * Kaffe stubs generated for class amaya_APIJavaAmaya from includes
 * The user need to write JavaTypes.h which gives the
 * signatures of Java2C and C2Java conversion handlers
 * As well as the Class LOCK/UNLOCK macros
 */

#include <native.h>
#include "JavaTypes.h"
#include "amaya_APIJavaAmaya.h"
#include "amaya_APIJavaAmaya_stubs.h"

#ifndef amaya_APIJavaAmaya_LOCK
#define amaya_APIJavaAmaya_LOCK() fprintf(stderr,"amaya_APIJavaAmaya_LOCK undefined");
#endif /* amaya_APIJavaAmaya_LOCK */
#ifndef amaya_APIJavaAmaya_UNLOCK
#define amaya_APIJavaAmaya_UNLOCK() fprintf(stderr,"amaya_APIJavaAmaya_UNLOCK undefined");
#endif /* amaya_APIJavaAmaya_UNLOCK */

/*
 * Java to C function IsDocumentLoaded stub.
 */
jint
amaya_APIJavaAmaya_IsDocumentLoaded(struct Hamaya_APIJavaAmaya* none, struct Hjava_lang_String* jdocumentURL)
{
	Document res;
	char documentURL[1024];
	char *documentURL_ptr = &documentURL[0];

	if (jdocumentURL != NULL)
	  javaString2CString(jdocumentURL, documentURL_ptr, sizeof(documentURL));
	else
	  documentURL_ptr = NULL;

	amaya_APIJavaAmaya_LOCK();

	res = IsDocumentLoaded((char *) documentURL_ptr);

	amaya_APIJavaAmaya_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function ExtractParameters stub.
 */
void
amaya_APIJavaAmaya_ExtractParameters(struct Hamaya_APIJavaAmaya* none, struct Hjava_lang_String* jaName, struct Hjava_lang_String* jparameters)
{
	char aName[1024];
	char *aName_ptr = &aName[0];
	char parameters[1024];
	char *parameters_ptr = &parameters[0];

	if (jaName != NULL)
	  javaString2CString(jaName, aName_ptr, sizeof(aName));
	else
	  aName_ptr = NULL;
	if (jparameters != NULL)
	  javaString2CString(jparameters, parameters_ptr, sizeof(parameters));
	else
	  parameters_ptr = NULL;

	amaya_APIJavaAmaya_LOCK();

	ExtractParameters((char *) aName_ptr, (char *) parameters_ptr);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function ExtractSuffix stub.
 */
void
amaya_APIJavaAmaya_ExtractSuffix(struct Hamaya_APIJavaAmaya* none, struct Hjava_lang_String* jaName, struct Hjava_lang_String* jaSuffix)
{
	char aName[1024];
	char *aName_ptr = &aName[0];
	char aSuffix[1024];
	char *aSuffix_ptr = &aSuffix[0];

	if (jaName != NULL)
	  javaString2CString(jaName, aName_ptr, sizeof(aName));
	else
	  aName_ptr = NULL;
	if (jaSuffix != NULL)
	  javaString2CString(jaSuffix, aSuffix_ptr, sizeof(aSuffix));
	else
	  aSuffix_ptr = NULL;

	amaya_APIJavaAmaya_LOCK();

	ExtractSuffix((char *) aName_ptr, (char *) aSuffix_ptr);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function ResetStop stub.
 */
void
amaya_APIJavaAmaya_ResetStop(struct Hamaya_APIJavaAmaya* none, jint document)
{


	amaya_APIJavaAmaya_LOCK();

	ResetStop((Document ) document);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function ActiveTransfer stub.
 */
void
amaya_APIJavaAmaya_ActiveTransfer(struct Hamaya_APIJavaAmaya* none, jint document)
{


	amaya_APIJavaAmaya_LOCK();

	ActiveTransfer((Document ) document);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function StopTransfer stub.
 */
void
amaya_APIJavaAmaya_StopTransfer(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	StopTransfer((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function SetCharEmphasis stub.
 */
void
amaya_APIJavaAmaya_SetCharEmphasis(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	SetCharEmphasis((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function SetCharStrong stub.
 */
void
amaya_APIJavaAmaya_SetCharStrong(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	SetCharStrong((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function SetCharCode stub.
 */
void
amaya_APIJavaAmaya_SetCharCode(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	SetCharCode((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function InitFormAnswer stub.
 */
void
amaya_APIJavaAmaya_InitFormAnswer(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	InitFormAnswer((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function InitConfirm stub.
 */
void
amaya_APIJavaAmaya_InitConfirm(struct Hamaya_APIJavaAmaya* none, jint document, jint view, struct Hjava_lang_String* jlabel)
{
	char label[1024];
	char *label_ptr = &label[0];

	if (jlabel != NULL)
	  javaString2CString(jlabel, label_ptr, sizeof(label));
	else
	  label_ptr = NULL;

	amaya_APIJavaAmaya_LOCK();

	InitConfirm((Document ) document, (View ) view, (char *) label_ptr);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function OpenDocInNewWindow stub.
 */
void
amaya_APIJavaAmaya_OpenDocInNewWindow(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	OpenDocInNewWindow((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function OpenDoc stub.
 */
void
amaya_APIJavaAmaya_OpenDoc(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	OpenDoc((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function Reload stub.
 */
void
amaya_APIJavaAmaya_Reload(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	Reload((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function ShowStructure stub.
 */
void
amaya_APIJavaAmaya_ShowStructure(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	ShowStructure((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function ShowAlternate stub.
 */
void
amaya_APIJavaAmaya_ShowAlternate(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	ShowAlternate((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function ShowLinks stub.
 */
void
amaya_APIJavaAmaya_ShowLinks(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	ShowLinks((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function ShowToC stub.
 */
void
amaya_APIJavaAmaya_ShowToC(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	ShowToC((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function ShowMapAreas stub.
 */
void
amaya_APIJavaAmaya_ShowMapAreas(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	ShowMapAreas((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function NormalizeFile stub.
 */
jint
amaya_APIJavaAmaya_NormalizeFile(struct Hamaya_APIJavaAmaya* none, struct Hjava_lang_String* jsrc, struct Hjava_lang_String* jtarget)
{
	boolean res;
	char src[1024];
	char *src_ptr = &src[0];
	char target[1024];
	char *target_ptr = &target[0];

	if (jsrc != NULL)
	  javaString2CString(jsrc, src_ptr, sizeof(src));
	else
	  src_ptr = NULL;
	if (jtarget != NULL)
	  javaString2CString(jtarget, target_ptr, sizeof(target));
	else
	  target_ptr = NULL;

	amaya_APIJavaAmaya_LOCK();

	res = NormalizeFile((char *) src_ptr, (char *) target_ptr);

	amaya_APIJavaAmaya_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function SectionNumbering stub.
 */
void
amaya_APIJavaAmaya_SectionNumbering(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	SectionNumbering((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function MakeBook stub.
 */
void
amaya_APIJavaAmaya_MakeBook(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	MakeBook((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function RealTimeHTML stub.
 */
void
amaya_APIJavaAmaya_RealTimeHTML(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	RealTimeHTML((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function HelpAmaya stub.
 */
void
amaya_APIJavaAmaya_HelpAmaya(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	HelpAmaya((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function AmayaClose stub.
 */
void
amaya_APIJavaAmaya_AmayaClose(struct Hamaya_APIJavaAmaya* none, jint document, jint view)
{


	amaya_APIJavaAmaya_LOCK();

	AmayaClose((Document ) document, (View ) view);

	amaya_APIJavaAmaya_UNLOCK();

}

/*
 * Java to C function GetUserAgentName stub.
 */
struct Hjava_lang_String*
amaya_APIJavaAmaya_GetUserAgentName(struct Hamaya_APIJavaAmaya* none)
{
	char *res;


	amaya_APIJavaAmaya_LOCK();

	res = GetUserAgentName();

	amaya_APIJavaAmaya_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Java to C function GetDocumentURL stub.
 */
struct Hjava_lang_String*
amaya_APIJavaAmaya_GetDocumentURL(struct Hamaya_APIJavaAmaya* none, jint doc)
{
	char *res;


	amaya_APIJavaAmaya_LOCK();

	res = GetDocumentURL((Document ) doc);

	amaya_APIJavaAmaya_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Java to C function AmayaGetMessage stub.
 */
struct Hjava_lang_String*
amaya_APIJavaAmaya_AmayaGetMessage(struct Hamaya_APIJavaAmaya* none, jint msg)
{
	char *res;


	amaya_APIJavaAmaya_LOCK();

	res = AmayaGetMessage((int ) msg);

	amaya_APIJavaAmaya_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Java to C function PopUpAuthDialog stub.
 */
jint
amaya_APIJavaAmaya_PopUpAuthDialog(struct Hamaya_APIJavaAmaya* none, jint doc)
{
	int res;


	amaya_APIJavaAmaya_LOCK();

	res = PopUpAuthDialog((int ) doc);

	amaya_APIJavaAmaya_UNLOCK();


	return((jint) res);
}

/*
 * Java to C function GetUserString stub.
 */
struct Hjava_lang_String*
amaya_APIJavaAmaya_GetUserString(struct Hamaya_APIJavaAmaya* none)
{
	char *res;


	amaya_APIJavaAmaya_LOCK();

	res = GetUserString();

	amaya_APIJavaAmaya_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Java to C function GetPasswdString stub.
 */
struct Hjava_lang_String*
amaya_APIJavaAmaya_GetPasswdString(struct Hamaya_APIJavaAmaya* none)
{
	char *res;


	amaya_APIJavaAmaya_LOCK();

	res = GetPasswdString();

	amaya_APIJavaAmaya_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Java to C function GetAnswerString stub.
 */
struct Hjava_lang_String*
amaya_APIJavaAmaya_GetAnswerString(struct Hamaya_APIJavaAmaya* none)
{
	char *res;


	amaya_APIJavaAmaya_LOCK();

	res = GetAnswerString();

	amaya_APIJavaAmaya_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Java to C function GetTempDirectory stub.
 */
struct Hjava_lang_String*
amaya_APIJavaAmaya_GetTempDirectory(struct Hamaya_APIJavaAmaya* none)
{
	char *res;


	amaya_APIJavaAmaya_LOCK();

	res = GetTempDirectory();

	amaya_APIJavaAmaya_UNLOCK();


	if (res == NULL)
		return(NULL);
	else;
		return(makeJavaString(res, strlen(res)));
}

/*
 * Function to register all amaya_APIJavaAmaya stubs.
 */
void register_amaya_APIJavaAmaya_stubs(void)
{
	addNativeMethod("amaya_APIJavaAmaya_IsDocumentLoaded", amaya_APIJavaAmaya_IsDocumentLoaded);
	addNativeMethod("amaya_APIJavaAmaya_ExtractParameters", amaya_APIJavaAmaya_ExtractParameters);
	addNativeMethod("amaya_APIJavaAmaya_ExtractSuffix", amaya_APIJavaAmaya_ExtractSuffix);
	addNativeMethod("amaya_APIJavaAmaya_ResetStop", amaya_APIJavaAmaya_ResetStop);
	addNativeMethod("amaya_APIJavaAmaya_ActiveTransfer", amaya_APIJavaAmaya_ActiveTransfer);
	addNativeMethod("amaya_APIJavaAmaya_StopTransfer", amaya_APIJavaAmaya_StopTransfer);
	addNativeMethod("amaya_APIJavaAmaya_SetCharEmphasis", amaya_APIJavaAmaya_SetCharEmphasis);
	addNativeMethod("amaya_APIJavaAmaya_SetCharStrong", amaya_APIJavaAmaya_SetCharStrong);
	addNativeMethod("amaya_APIJavaAmaya_SetCharCode", amaya_APIJavaAmaya_SetCharCode);
	addNativeMethod("amaya_APIJavaAmaya_InitFormAnswer", amaya_APIJavaAmaya_InitFormAnswer);
	addNativeMethod("amaya_APIJavaAmaya_InitConfirm", amaya_APIJavaAmaya_InitConfirm);
	addNativeMethod("amaya_APIJavaAmaya_OpenDocInNewWindow", amaya_APIJavaAmaya_OpenDocInNewWindow);
	addNativeMethod("amaya_APIJavaAmaya_OpenDoc", amaya_APIJavaAmaya_OpenDoc);
	addNativeMethod("amaya_APIJavaAmaya_Reload", amaya_APIJavaAmaya_Reload);
	addNativeMethod("amaya_APIJavaAmaya_ShowStructure", amaya_APIJavaAmaya_ShowStructure);
	addNativeMethod("amaya_APIJavaAmaya_ShowAlternate", amaya_APIJavaAmaya_ShowAlternate);
	addNativeMethod("amaya_APIJavaAmaya_ShowLinks", amaya_APIJavaAmaya_ShowLinks);
	addNativeMethod("amaya_APIJavaAmaya_ShowToC", amaya_APIJavaAmaya_ShowToC);
	addNativeMethod("amaya_APIJavaAmaya_ShowMapAreas", amaya_APIJavaAmaya_ShowMapAreas);
	addNativeMethod("amaya_APIJavaAmaya_NormalizeFile", amaya_APIJavaAmaya_NormalizeFile);
	addNativeMethod("amaya_APIJavaAmaya_SectionNumbering", amaya_APIJavaAmaya_SectionNumbering);
	addNativeMethod("amaya_APIJavaAmaya_MakeBook", amaya_APIJavaAmaya_MakeBook);
	addNativeMethod("amaya_APIJavaAmaya_RealTimeHTML", amaya_APIJavaAmaya_RealTimeHTML);
	addNativeMethod("amaya_APIJavaAmaya_HelpAmaya", amaya_APIJavaAmaya_HelpAmaya);
	addNativeMethod("amaya_APIJavaAmaya_AmayaClose", amaya_APIJavaAmaya_AmayaClose);
	addNativeMethod("amaya_APIJavaAmaya_GetUserAgentName", amaya_APIJavaAmaya_GetUserAgentName);
	addNativeMethod("amaya_APIJavaAmaya_GetDocumentURL", amaya_APIJavaAmaya_GetDocumentURL);
	addNativeMethod("amaya_APIJavaAmaya_AmayaGetMessage", amaya_APIJavaAmaya_AmayaGetMessage);
	addNativeMethod("amaya_APIJavaAmaya_PopUpAuthDialog", amaya_APIJavaAmaya_PopUpAuthDialog);
	addNativeMethod("amaya_APIJavaAmaya_GetUserString", amaya_APIJavaAmaya_GetUserString);
	addNativeMethod("amaya_APIJavaAmaya_GetPasswdString", amaya_APIJavaAmaya_GetPasswdString);
	addNativeMethod("amaya_APIJavaAmaya_GetAnswerString", amaya_APIJavaAmaya_GetAnswerString);
	addNativeMethod("amaya_APIJavaAmaya_GetTempDirectory", amaya_APIJavaAmaya_GetTempDirectory);
}
