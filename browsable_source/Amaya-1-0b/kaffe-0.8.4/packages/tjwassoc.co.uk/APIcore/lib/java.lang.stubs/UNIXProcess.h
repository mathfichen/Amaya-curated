/* DO NOT EDIT THIS FILE - it is machine generated */
#include <native.h>

#ifndef _Included_java_lang_UNIXProcess
#define _Included_java_lang_UNIXProcess

#ifdef __cplusplus
extern "C" {
#endif

/* Header for class java_lang_UNIXProcess */

typedef struct Classjava_lang_UNIXProcess {
  jint /* bool */ isalive;
  jint exit_code;
  jint pid;
  struct Hjava_io_FileDescriptor* sync_fd;
  struct Hjava_io_FileDescriptor* stdin_fd;
  struct Hjava_io_FileDescriptor* stdout_fd;
  struct Hjava_io_FileDescriptor* stderr_fd;
  struct Hjava_io_OutputStream* stdin_stream;
  struct Hjava_io_InputStream* stdout_stream;
  struct Hjava_io_InputStream* stderr_stream;
} Classjava_lang_UNIXProcess;
HandleTo(java_lang_UNIXProcess);

extern void java_lang_UNIXProcess_exec(struct Hjava_lang_UNIXProcess*, HArrayOfObject*, HArrayOfObject*);
extern jint java_lang_UNIXProcess_fork(struct Hjava_lang_UNIXProcess*);
extern jint java_lang_UNIXProcess_waitForUNIXProcess(struct Hjava_lang_UNIXProcess*);
extern void java_lang_UNIXProcess_destroy(struct Hjava_lang_UNIXProcess*);

#ifdef __cplusplus
}
#endif

#endif