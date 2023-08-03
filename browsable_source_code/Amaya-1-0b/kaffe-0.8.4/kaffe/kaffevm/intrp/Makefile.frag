# Makefile.frag for kaffevm Interpreter
#
# Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
#
# See the file "license.terms" for information on usage and redistribution
# of this file, and for a DISCLAIMER OF ALL WARRANTIES.
#
# Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>

ENGINE_CFLAGS=	-DINTERPRETER -I$(srcdir)/intrp  

ENGINE_OBJECTS= machine$(OBJEXT)
