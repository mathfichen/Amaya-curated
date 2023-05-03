PACKAGE="w3c"

PACKAGES = \
	tools \
	util \
	www 

include $(MAKEDIR)/package.make

javadoc::
	rm -f ../../../User/api/*.html
	javadoc -d ../../../User/api \
		w3c.jigsaw.pics \
		w3c.jigsaw.html \
		w3c.jigsaw.cvs \
		w3c.jigsaw.proxy \
		w3c.jigsaw.config \
		w3c.jigsaw.resources \
		w3c.jigsaw.http \
		w3c.jigsaw.http.socket \
		w3c.jigsaw.http.mux \
		w3c.jigsaw.indexer \
		w3c.jigsaw.forms \
		w3c.jigsaw.formedit \
		w3c.jigsaw.filters \
		w3c.jigsaw.status \
		w3c.jigsaw.auth \
		w3c.jigsaw.tests \
		w3c.jigsaw.daemon \
		w3c.jigsaw.tutorials \
		w3c.jigsaw.upgrade \
		w3c.jigsaw.ssi \
		w3c.jigsaw.ssi.commands \
		w3c.jigsaw.map \
		w3c.jigsaw.contrib \
		w3c.tools.codec \
		w3c.tools.crypt \
		w3c.tools.sorter \
		w3c.tools.dbm \
		w3c.tools.forms \
		w3c.tools.store \
		w3c.tools.timers \
		w3c.cvs \
		w3c.www.http \
		w3c.www.mime \
		w3c.www.mux \
	        w3c.www.mux.handlers \
		w3c.www.protocol.http \
		w3c.www.protocol.http.cache \
		w3c.www.protocol.http.auth \
		w3c.www.protocol.http.icp \
		w3c.www.protocol.http.proxy \
		w3c.util 
