/* DO NOT EDIT THIS FILE - it is machine generated */
#include <StubPreamble.h>

/* Stubs for class java_net_InetAddress */

/* SYMBOL: java_net_InetAddress_getLocalHostName()Ljava/lang/String; */
void
Kaffe_java_net_InetAddress_getLocalHostName_stub(stack_item* _P_, stack_item* _R_)
{
	extern struct Hjava_lang_String* java_net_InetAddress_getLocalHostName(void*);
	struct Hjava_lang_String* ret = java_net_InetAddress_getLocalHostName(0);
	return_ref(ret);
}

/* SYMBOL: java_net_InetAddress_makeAnyLocalAddress(Ljava/net/InetAddress;)V */
void
Kaffe_java_net_InetAddress_makeAnyLocalAddress_stub(stack_item* _P_, stack_item* _R_)
{
	extern void java_net_InetAddress_makeAnyLocalAddress(void*, void*);
	java_net_InetAddress_makeAnyLocalAddress(0, _P_[0].p);
}

/* SYMBOL: java_net_InetAddress_lookupHostAddr(Ljava/lang/String;)[B */
void
Kaffe_java_net_InetAddress_lookupHostAddr_stub(stack_item* _P_, stack_item* _R_)
{
	extern HArrayOfByte* java_net_InetAddress_lookupHostAddr(void*, void*);
	HArrayOfByte* ret = java_net_InetAddress_lookupHostAddr(0, _P_[0].p);
	return_ref(ret);
}

/* SYMBOL: java_net_InetAddress_lookupAllHostAddr(Ljava/lang/String;)[[B */
void
Kaffe_java_net_InetAddress_lookupAllHostAddr_stub(stack_item* _P_, stack_item* _R_)
{
	extern HArrayOfArray* java_net_InetAddress_lookupAllHostAddr(void*, void*);
	HArrayOfArray* ret = java_net_InetAddress_lookupAllHostAddr(0, _P_[0].p);
	return_ref(ret);
}

/* SYMBOL: java_net_InetAddress_getHostByAddr(I)Ljava/lang/String; */
void
Kaffe_java_net_InetAddress_getHostByAddr_stub(stack_item* _P_, stack_item* _R_)
{
	extern struct Hjava_lang_String* java_net_InetAddress_getHostByAddr(void*, jint);
	struct Hjava_lang_String* ret = java_net_InetAddress_getHostByAddr(0, _P_[0].i);
	return_ref(ret);
}

/* SYMBOL: java_net_InetAddress_getInetFamily()I */
void
Kaffe_java_net_InetAddress_getInetFamily_stub(stack_item* _P_, stack_item* _R_)
{
	extern jint java_net_InetAddress_getInetFamily(void*);
	jint ret = java_net_InetAddress_getInetFamily(0);
	return_int(ret);
}