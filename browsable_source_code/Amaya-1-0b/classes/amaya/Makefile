.SUFFIXES: .java .class

.java.class : 
	javac $*.java

SUBDIRS=applets

all : local subdir

local : amayaInit.class \
      HTTPRequest.class HTTPThreadPool.class \
      HTTPAccess.class HTTPConnection.class \
      APIJavaAmaya.class APIAmayaMsg.class \
      HTTPAuthorization.class HTTPException.class \
      HTTPStatus.class

# HTTPHandler.class  HTTPReport.class

subdir :
	@(for subdir in $(SUBDIRS) ; do \
	  if [ -d $$subdir ] ; \
	  then \
	      cd $$subdir ; make ; cd .. ; \
	  fi ; done)

clean :
	rm -f *.class
	@(for subdir in $(SUBDIRS) ; do \
	  if [ -d $$subdir ] ; \
	  then \
	      cd $$subdir ; make clean ; cd .. ; \
	  fi ; done)

