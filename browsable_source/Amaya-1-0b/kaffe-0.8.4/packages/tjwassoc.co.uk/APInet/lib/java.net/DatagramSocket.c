/*
 * java.net.DatagramSocket.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include "config-io.h"
#include <native.h>
#include "../../../APIcore/lib/java.io.stubs/FileDescriptor.h"
#include "java.net.stubs/DatagramPacket.h"
#include "java.net.stubs/DatagramSocket.h"
#include "java.net.stubs/InetAddress.h"
#include "nets.h"
#include "kthread.h"
#include "../../../../kaffe/kaffevm/threadCalls.h"

/*
 * Create a datagram socket.
 */
void
java_net_DatagramSocket_datagramSocketCreate(struct Hjava_net_DatagramSocket* this)
{
	int fd;

	fd = threadedSocket(AF_INET, SOCK_DGRAM, 0);
	unhand(unhand(this)->fd)->fd = fd;
	if (fd < 0) {
		SignalError(NULL, "java.net.SocketException", SYS_ERROR);
	}
}

/*
 * Bind a port to the socket.
 */
jint
java_net_DatagramSocket_datagramSocketBind(struct Hjava_net_DatagramSocket* this, jint port)
{
	int r;
	struct sockaddr_in addr;

#if defined(BSD44)
	addr.sin_len = sizeof(addr);
#endif
	addr.sin_family = AF_INET;
	addr.sin_port = htons(port);
	addr.sin_addr.s_addr = INADDR_ANY;

	r = bind(unhand(unhand(this)->fd)->fd, (struct sockaddr*)&addr, sizeof(addr));
	if (r < 0) {
		SignalError(NULL, "java.net.SocketException", SYS_ERROR);
	}

	return (addr.sin_port);
}

void
java_net_DatagramSocket_datagramSocketSend(struct Hjava_net_DatagramSocket* this, struct Hjava_net_DatagramPacket* pkt)
{
	int r;
	struct sockaddr_in addr;

#if defined(BSD44)
	addr.sin_len = sizeof(addr);
#endif
	addr.sin_family = AF_INET;
	addr.sin_port = htons(unhand(pkt)->port);
	addr.sin_addr.s_addr = htonl(unhand(unhand(pkt)->address)->address);

	r = sendto(unhand(unhand(this)->fd)->fd, unhand(unhand(pkt)->buf)->body, unhand(pkt)->length, 0, (struct sockaddr*)&addr, sizeof(addr));
	if (r < 0) {
		SignalError(NULL, "java.net.SocketException", SYS_ERROR);
	}
}

jint
java_net_DatagramSocket_datagramSocketPeek(struct Hjava_net_DatagramSocket* this, struct Hjava_net_InetAddress* addr)
{
	int r;
	struct sockaddr_in saddr;
	size_t alen = sizeof(saddr);

	r = recvfrom(unhand(unhand(this)->fd)->fd, 0, 0, MSG_PEEK, (struct sockaddr*)&saddr, &alen);
	if (r < 0) {
		SignalError(NULL, "java.net.SocketException", SYS_ERROR);
	}

	unhand(addr)->address = ntohl(saddr.sin_addr.s_addr);

	return (r);
}

void
java_net_DatagramSocket_datagramSocketReceive(struct Hjava_net_DatagramSocket* this, struct Hjava_net_DatagramPacket* pkt)
{
	int r;
	struct sockaddr_in addr;
	size_t alen = sizeof(addr);
	struct Hjava_net_InetAddress **fromaddr;

        r = threadedRecvfrom(unhand(unhand(this)->fd)->fd, unhand(unhand(pkt)->buf)->body, unhand(pkt)->length, 0, (struct sockaddr*)&addr, &alen);
	if (r < 0) {
		SignalError(NULL, "java.net.SocketException", SYS_ERROR);
	}

	unhand(pkt)->length = r;
	unhand(pkt)->port = ntohs(addr.sin_port);
	fromaddr = &unhand(pkt)->address;
	if (*fromaddr == 0) {
		*fromaddr = (struct Hjava_net_InetAddress *)
				AllocObject("java/net/InetAddress");
	}
	unhand(*fromaddr)->address = ntohl(addr.sin_addr.s_addr);
}

/*
 * Close the socket.
 */
void
java_net_DatagramSocket_datagramSocketClose(struct Hjava_net_DatagramSocket* this)
{
	int r;

	if (unhand(unhand(this)->fd)->fd != -1) {
		r = close(unhand(unhand(this)->fd)->fd);
		unhand(unhand(this)->fd)->fd = -1;
		if (r < 0) {
			SignalError(NULL, "java.net.SocketException", SYS_ERROR);
		}
	}
}
