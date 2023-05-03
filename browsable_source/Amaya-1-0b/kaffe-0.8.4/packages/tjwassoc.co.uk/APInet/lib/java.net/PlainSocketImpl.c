/*
 * java.net.PlainSocketImpl.c
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
#include "config-io.h"
#include "config-mem.h"
#include <netinet/in.h>
#include <native.h>
#include "../../../APIcore/lib/java.io.stubs/FileDescriptor.h"
#include "java.net.stubs/SocketImpl.h"
#include "java.net.stubs/InetAddress.h"
#include "java.net.stubs/PlainSocketImpl.h"
#include "nets.h"
#include "kthread.h"
#include "../../../../kaffe/kaffevm/threadCalls.h"

/*
 * Create a stream or datagram socket.
 */
void
java_net_PlainSocketImpl_socketCreate(struct Hjava_net_PlainSocketImpl* this, jint /* bool */ stream)
{
	int fd;
	int type;

	if (stream == 0) {
		type = SOCK_DGRAM;
	}
	else {
		type = SOCK_STREAM;
	}

	fd = threadedSocket(AF_INET, type, 0);
	if (fd < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
	unhand(unhand(this)->fd)->fd = fd;
}

/*
 * Connect the socket to someone.
 */
void
java_net_PlainSocketImpl_socketConnect(struct Hjava_net_PlainSocketImpl* this, struct Hjava_net_InetAddress* daddr, jint dport)
{
	int fd;
	int r;
	struct sockaddr_in addr;
	size_t alen;

#if defined(BSD44)
	addr.sin_len = sizeof(addr);
#endif
	addr.sin_family = AF_INET;
	addr.sin_port = htons(dport);
	addr.sin_addr.s_addr = htonl(unhand(daddr)->address);

	fd = unhand(unhand(this)->fd)->fd;
	r = threadedConnect(fd, (struct sockaddr*)&addr, sizeof(addr));
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}

	/* Enter information into socket object */
	alen = sizeof(addr);
	r = getsockname(fd, (struct sockaddr*)&addr, &alen);
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}

	unhand(this)->address = daddr;
	unhand(this)->port = dport;
	unhand(this)->localport = ntohs(addr.sin_port);
}

/*
 * Bind this socket to an address.
 */
void
java_net_PlainSocketImpl_socketBind(struct Hjava_net_PlainSocketImpl* this, struct Hjava_net_InetAddress* laddr, jint lport)
{
	int r;
	struct sockaddr_in addr;
	int fd;
	int on = 1;
	size_t alen;

#if defined(BSD44)
	addr.sin_len = sizeof(addr);
#endif
	addr.sin_family = AF_INET;
	addr.sin_port = htons(lport);
	addr.sin_addr.s_addr = unhand(laddr)->address;

	fd = unhand(unhand(this)->fd)->fd;

	/* Allow rebinding to socket - ignore errors */
	(void)setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, (char*)&on, sizeof(on));
	r = bind(fd, (struct sockaddr*)&addr, sizeof(addr));
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}

	/* Enter information into socket object */
	unhand(this)->address = laddr;
	if (lport == 0) {
		alen = sizeof(addr);
		r = getsockname(fd, (struct sockaddr*)&addr, &alen);
		if (r < 0) {
			SignalError(NULL, "java.io.IOException", SYS_ERROR);
		}
		lport = ntohs(addr.sin_port);
	}
	unhand(this)->localport = lport;
}

/*
 * Turn this socket into a listener.
 */
void
java_net_PlainSocketImpl_socketListen(struct Hjava_net_PlainSocketImpl* this, jint count)
{
	int r;

	r = listen(unhand(unhand(this)->fd)->fd, count);
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
}

/*
 * Accept a connection.
 */
void
java_net_PlainSocketImpl_socketAccept(struct Hjava_net_PlainSocketImpl* this, struct Hjava_net_SocketImpl* sock)
{
	int r;
	size_t alen;
	struct sockaddr_in addr;

	alen = sizeof(addr);
#if defined(BSD44)
	addr.sin_len = sizeof(addr);
#endif
	addr.sin_family = AF_INET;
	addr.sin_port = htons(unhand(sock)->localport);
	addr.sin_addr.s_addr = unhand(unhand(sock)->address)->address;

	r = threadedAccept(unhand(unhand(this)->fd)->fd, (struct sockaddr*)&addr, &alen);
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
	unhand(unhand(sock)->fd)->fd = r;

	/* Enter information into socket object */
	alen = sizeof(addr);
	r = getpeername(r, (struct sockaddr*)&addr, &alen);
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}

	unhand(unhand(sock)->address)->address = ntohl(addr.sin_addr.s_addr);
	unhand(sock)->port = ntohs(addr.sin_port);
}

/*
 * Return how many bytes can be read without blocking.
 */
jint
java_net_PlainSocketImpl_socketAvailable(struct Hjava_net_PlainSocketImpl* this)
{
	int r;
	jint len;

	r = ioctl(unhand(unhand(this)->fd)->fd, FIONREAD, &len);
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
	return (len);
}

/*
 * Close this socket.
 */
void
java_net_PlainSocketImpl_socketClose(struct Hjava_net_PlainSocketImpl* this)
{
	int r;

	if (unhand(unhand(this)->fd)->fd != -1) {
		r = close(unhand(unhand(this)->fd)->fd);
		unhand(unhand(this)->fd)->fd = -1;
		if (r < 0) {
			SignalError(NULL, "java.io.IOException", SYS_ERROR);
		}
	}
}
