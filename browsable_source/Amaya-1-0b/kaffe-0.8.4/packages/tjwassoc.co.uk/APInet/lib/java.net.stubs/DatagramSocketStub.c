/* DO NOT EDIT THIS FILE - it is machine generated */
#include <StubPreamble.h>

/* Stubs for class java_net_DatagramSocket */

/* SYMBOL: java_net_DatagramSocket_datagramSocketCreate()V */
void
Kaffe_java_net_DatagramSocket_datagramSocketCreate_stub(stack_item* _P_, stack_item* _R_)
{
	extern void java_net_DatagramSocket_datagramSocketCreate(void*);
	java_net_DatagramSocket_datagramSocketCreate(_P_[0].p);
}

/* SYMBOL: java_net_DatagramSocket_datagramSocketBind(I)I */
void
Kaffe_java_net_DatagramSocket_datagramSocketBind_stub(stack_item* _P_, stack_item* _R_)
{
	extern jint java_net_DatagramSocket_datagramSocketBind(void*, jint);
	jint ret = java_net_DatagramSocket_datagramSocketBind(_P_[1].p, _P_[0].i);
	return_int(ret);
}

/* SYMBOL: java_net_DatagramSocket_datagramSocketSend(Ljava/net/DatagramPacket;)V */
void
Kaffe_java_net_DatagramSocket_datagramSocketSend_stub(stack_item* _P_, stack_item* _R_)
{
	extern void java_net_DatagramSocket_datagramSocketSend(void*, void*);
	java_net_DatagramSocket_datagramSocketSend(_P_[1].p, _P_[0].p);
}

/* SYMBOL: java_net_DatagramSocket_datagramSocketPeek(Ljava/net/InetAddress;)I */
void
Kaffe_java_net_DatagramSocket_datagramSocketPeek_stub(stack_item* _P_, stack_item* _R_)
{
	extern jint java_net_DatagramSocket_datagramSocketPeek(void*, void*);
	jint ret = java_net_DatagramSocket_datagramSocketPeek(_P_[1].p, _P_[0].p);
	return_int(ret);
}

/* SYMBOL: java_net_DatagramSocket_datagramSocketReceive(Ljava/net/DatagramPacket;)V */
void
Kaffe_java_net_DatagramSocket_datagramSocketReceive_stub(stack_item* _P_, stack_item* _R_)
{
	extern void java_net_DatagramSocket_datagramSocketReceive(void*, void*);
	java_net_DatagramSocket_datagramSocketReceive(_P_[1].p, _P_[0].p);
}

/* SYMBOL: java_net_DatagramSocket_datagramSocketClose()V */
void
Kaffe_java_net_DatagramSocket_datagramSocketClose_stub(stack_item* _P_, stack_item* _R_)
{
	extern void java_net_DatagramSocket_datagramSocketClose(void*);
	java_net_DatagramSocket_datagramSocketClose(_P_[0].p);
}