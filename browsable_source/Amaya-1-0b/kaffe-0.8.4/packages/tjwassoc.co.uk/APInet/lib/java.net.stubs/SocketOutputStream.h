/* DO NOT EDIT THIS FILE - it is machine generated */
#include <native.h>

#ifndef _Included_java_net_SocketOutputStream
#define _Included_java_net_SocketOutputStream

#ifdef __cplusplus
extern "C" {
#endif

/* Header for class java_net_SocketOutputStream */

typedef struct Classjava_net_SocketOutputStream {
  struct Hjava_io_FileDescriptor* fd;
  struct Hjava_net_SocketImpl* impl;
  HArrayOfByte* temp;
} Classjava_net_SocketOutputStream;
HandleTo(java_net_SocketOutputStream);

extern void java_net_SocketOutputStream_socketWrite(struct Hjava_net_SocketOutputStream*, HArrayOfByte*, jint, jint);

#ifdef __cplusplus
}
#endif

#endif