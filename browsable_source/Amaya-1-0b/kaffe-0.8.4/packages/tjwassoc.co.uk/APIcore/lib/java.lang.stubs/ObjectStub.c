/* DO NOT EDIT THIS FILE - it is machine generated */
#include <StubPreamble.h>

/* Stubs for class java_lang_Object */

/* SYMBOL: java_lang_Object_getClass()Ljava/lang/Class; */
void
Kaffe_java_lang_Object_getClass_stub(stack_item* _P_, stack_item* _R_)
{
	extern struct Hjava_lang_Class* java_lang_Object_getClass(void*);
	struct Hjava_lang_Class* ret = java_lang_Object_getClass(_P_[0].p);
	return_ref(ret);
}

/* SYMBOL: java_lang_Object_hashCode()I */
void
Kaffe_java_lang_Object_hashCode_stub(stack_item* _P_, stack_item* _R_)
{
	extern jint java_lang_Object_hashCode(void*);
	jint ret = java_lang_Object_hashCode(_P_[0].p);
	return_int(ret);
}

/* SYMBOL: java_lang_Object_clone()Ljava/lang/Object; */
void
Kaffe_java_lang_Object_clone_stub(stack_item* _P_, stack_item* _R_)
{
	extern struct Hjava_lang_Object* java_lang_Object_clone(void*);
	struct Hjava_lang_Object* ret = java_lang_Object_clone(_P_[0].p);
	return_ref(ret);
}

/* SYMBOL: java_lang_Object_notify()V */
void
Kaffe_java_lang_Object_notify_stub(stack_item* _P_, stack_item* _R_)
{
	extern void java_lang_Object_notify(void*);
	java_lang_Object_notify(_P_[0].p);
}

/* SYMBOL: java_lang_Object_notifyAll()V */
void
Kaffe_java_lang_Object_notifyAll_stub(stack_item* _P_, stack_item* _R_)
{
	extern void java_lang_Object_notifyAll(void*);
	java_lang_Object_notifyAll(_P_[0].p);
}

/* SYMBOL: java_lang_Object_wait(J)V */
void
Kaffe_java_lang_Object_wait_stub(stack_item* _P_, stack_item* _R_)
{
	extern void java_lang_Object_wait(void*, jlong);
	java_lang_Object_wait(_P_[2].p, _P_[0].l);
}