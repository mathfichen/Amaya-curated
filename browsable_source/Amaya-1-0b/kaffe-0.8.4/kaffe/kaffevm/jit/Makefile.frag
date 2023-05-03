# Makefile.frag for kaffevm JIT
#
# Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
#
# See the file "license.terms" for information on usage and redistribution
# of this file, and for a DISCLAIMER OF ALL WARRANTIES.
#
# Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>

ENGINE_CFLAGS=	-DTRANSLATOR -I$(srcdir)/jit

ENGINE_OBJECTS=\
		basecode$(OBJEXT) \
		constpool$(OBJEXT) \
		funcs$(OBJEXT) \
		icode$(OBJEXT) \
		labels$(OBJEXT) \
		registers$(OBJEXT) \
		slots$(OBJEXT) \
		machine$(OBJEXT) \
		seq$(OBJEXT)

funcs.o:	funcs.c jit.def
machine.o:	machine.c kaffe.def
