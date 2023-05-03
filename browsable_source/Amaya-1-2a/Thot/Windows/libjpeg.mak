# Microsoft Developer Studio Generated NMAKE File, Based on libjpeg.dsp
!IF "$(CFG)" == ""
CFG=libjpeg - Win32 Release
!MESSAGE No configuration specified. Defaulting to libjpeg - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "libjpeg - Win32 Release" && "$(CFG)" !=\
 "libjpeg - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "libjpeg.mak" CFG="libjpeg - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "libjpeg - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "libjpeg - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "libjpeg - Win32 Release"

OUTDIR=.\.
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\.
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Libjpeg.lib"

!ELSE 

ALL : "$(OUTDIR)\Libjpeg.lib"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\jcapimin.obj"
	-@erase "$(INTDIR)\jcapistd.obj"
	-@erase "$(INTDIR)\jccoefct.obj"
	-@erase "$(INTDIR)\jccolor.obj"
	-@erase "$(INTDIR)\jcdctmgr.obj"
	-@erase "$(INTDIR)\jchuff.obj"
	-@erase "$(INTDIR)\jcinit.obj"
	-@erase "$(INTDIR)\jcmainct.obj"
	-@erase "$(INTDIR)\jcmarker.obj"
	-@erase "$(INTDIR)\jcmaster.obj"
	-@erase "$(INTDIR)\jcomapi.obj"
	-@erase "$(INTDIR)\jcparam.obj"
	-@erase "$(INTDIR)\jcphuff.obj"
	-@erase "$(INTDIR)\jcprepct.obj"
	-@erase "$(INTDIR)\jcsample.obj"
	-@erase "$(INTDIR)\jctrans.obj"
	-@erase "$(INTDIR)\jdapimin.obj"
	-@erase "$(INTDIR)\jdapistd.obj"
	-@erase "$(INTDIR)\jdatadst.obj"
	-@erase "$(INTDIR)\jdatasrc.obj"
	-@erase "$(INTDIR)\jdcoefct.obj"
	-@erase "$(INTDIR)\jdcolor.obj"
	-@erase "$(INTDIR)\jddctmgr.obj"
	-@erase "$(INTDIR)\jdhuff.obj"
	-@erase "$(INTDIR)\jdinput.obj"
	-@erase "$(INTDIR)\jdmainct.obj"
	-@erase "$(INTDIR)\jdmarker.obj"
	-@erase "$(INTDIR)\jdmaster.obj"
	-@erase "$(INTDIR)\jdmerge.obj"
	-@erase "$(INTDIR)\jdphuff.obj"
	-@erase "$(INTDIR)\jdpostct.obj"
	-@erase "$(INTDIR)\jdsample.obj"
	-@erase "$(INTDIR)\jdtrans.obj"
	-@erase "$(INTDIR)\jerror.obj"
	-@erase "$(INTDIR)\jfdctflt.obj"
	-@erase "$(INTDIR)\jfdctfst.obj"
	-@erase "$(INTDIR)\jfdctint.obj"
	-@erase "$(INTDIR)\jidctflt.obj"
	-@erase "$(INTDIR)\jidctfst.obj"
	-@erase "$(INTDIR)\jidctint.obj"
	-@erase "$(INTDIR)\jidctred.obj"
	-@erase "$(INTDIR)\jmemansi.obj"
	-@erase "$(INTDIR)\jmemmgr.obj"
	-@erase "$(INTDIR)\jmemnobs.obj"
	-@erase "$(INTDIR)\jquant1.obj"
	-@erase "$(INTDIR)\jquant2.obj"
	-@erase "$(INTDIR)\jutils.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\Libjpeg.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)\libjpeg.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\libjpeg.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\libjpeg.lib" 
LIB32_OBJS= \
	"$(INTDIR)\jcapimin.obj" \
	"$(INTDIR)\jcapistd.obj" \
	"$(INTDIR)\jccoefct.obj" \
	"$(INTDIR)\jccolor.obj" \
	"$(INTDIR)\jcdctmgr.obj" \
	"$(INTDIR)\jchuff.obj" \
	"$(INTDIR)\jcinit.obj" \
	"$(INTDIR)\jcmainct.obj" \
	"$(INTDIR)\jcmarker.obj" \
	"$(INTDIR)\jcmaster.obj" \
	"$(INTDIR)\jcomapi.obj" \
	"$(INTDIR)\jcparam.obj" \
	"$(INTDIR)\jcphuff.obj" \
	"$(INTDIR)\jcprepct.obj" \
	"$(INTDIR)\jcsample.obj" \
	"$(INTDIR)\jctrans.obj" \
	"$(INTDIR)\jdapimin.obj" \
	"$(INTDIR)\jdapistd.obj" \
	"$(INTDIR)\jdatadst.obj" \
	"$(INTDIR)\jdatasrc.obj" \
	"$(INTDIR)\jdcoefct.obj" \
	"$(INTDIR)\jdcolor.obj" \
	"$(INTDIR)\jddctmgr.obj" \
	"$(INTDIR)\jdhuff.obj" \
	"$(INTDIR)\jdinput.obj" \
	"$(INTDIR)\jdmainct.obj" \
	"$(INTDIR)\jdmarker.obj" \
	"$(INTDIR)\jdmaster.obj" \
	"$(INTDIR)\jdmerge.obj" \
	"$(INTDIR)\jdphuff.obj" \
	"$(INTDIR)\jdpostct.obj" \
	"$(INTDIR)\jdsample.obj" \
	"$(INTDIR)\jdtrans.obj" \
	"$(INTDIR)\jerror.obj" \
	"$(INTDIR)\jfdctflt.obj" \
	"$(INTDIR)\jfdctfst.obj" \
	"$(INTDIR)\jfdctint.obj" \
	"$(INTDIR)\jidctflt.obj" \
	"$(INTDIR)\jidctfst.obj" \
	"$(INTDIR)\jidctint.obj" \
	"$(INTDIR)\jidctred.obj" \
	"$(INTDIR)\jmemansi.obj" \
	"$(INTDIR)\jmemmgr.obj" \
	"$(INTDIR)\jmemnobs.obj" \
	"$(INTDIR)\jquant1.obj" \
	"$(INTDIR)\jquant2.obj" \
	"$(INTDIR)\jutils.obj"

"$(OUTDIR)\Libjpeg.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "libjpeg - Win32 Debug"

OUTDIR=.\.
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\.
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Libjpeg.lib"

!ELSE 

ALL : "$(OUTDIR)\Libjpeg.lib"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\jcapimin.obj"
	-@erase "$(INTDIR)\jcapistd.obj"
	-@erase "$(INTDIR)\jccoefct.obj"
	-@erase "$(INTDIR)\jccolor.obj"
	-@erase "$(INTDIR)\jcdctmgr.obj"
	-@erase "$(INTDIR)\jchuff.obj"
	-@erase "$(INTDIR)\jcinit.obj"
	-@erase "$(INTDIR)\jcmainct.obj"
	-@erase "$(INTDIR)\jcmarker.obj"
	-@erase "$(INTDIR)\jcmaster.obj"
	-@erase "$(INTDIR)\jcomapi.obj"
	-@erase "$(INTDIR)\jcparam.obj"
	-@erase "$(INTDIR)\jcphuff.obj"
	-@erase "$(INTDIR)\jcprepct.obj"
	-@erase "$(INTDIR)\jcsample.obj"
	-@erase "$(INTDIR)\jctrans.obj"
	-@erase "$(INTDIR)\jdapimin.obj"
	-@erase "$(INTDIR)\jdapistd.obj"
	-@erase "$(INTDIR)\jdatadst.obj"
	-@erase "$(INTDIR)\jdatasrc.obj"
	-@erase "$(INTDIR)\jdcoefct.obj"
	-@erase "$(INTDIR)\jdcolor.obj"
	-@erase "$(INTDIR)\jddctmgr.obj"
	-@erase "$(INTDIR)\jdhuff.obj"
	-@erase "$(INTDIR)\jdinput.obj"
	-@erase "$(INTDIR)\jdmainct.obj"
	-@erase "$(INTDIR)\jdmarker.obj"
	-@erase "$(INTDIR)\jdmaster.obj"
	-@erase "$(INTDIR)\jdmerge.obj"
	-@erase "$(INTDIR)\jdphuff.obj"
	-@erase "$(INTDIR)\jdpostct.obj"
	-@erase "$(INTDIR)\jdsample.obj"
	-@erase "$(INTDIR)\jdtrans.obj"
	-@erase "$(INTDIR)\jerror.obj"
	-@erase "$(INTDIR)\jfdctflt.obj"
	-@erase "$(INTDIR)\jfdctfst.obj"
	-@erase "$(INTDIR)\jfdctint.obj"
	-@erase "$(INTDIR)\jidctflt.obj"
	-@erase "$(INTDIR)\jidctfst.obj"
	-@erase "$(INTDIR)\jidctint.obj"
	-@erase "$(INTDIR)\jidctred.obj"
	-@erase "$(INTDIR)\jmemansi.obj"
	-@erase "$(INTDIR)\jmemmgr.obj"
	-@erase "$(INTDIR)\jmemnobs.obj"
	-@erase "$(INTDIR)\jquant1.obj"
	-@erase "$(INTDIR)\jquant2.obj"
	-@erase "$(INTDIR)\jutils.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\Libjpeg.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)\libjpeg.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\libjpeg.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\libjpeg.lib" 
LIB32_OBJS= \
	"$(INTDIR)\jcapimin.obj" \
	"$(INTDIR)\jcapistd.obj" \
	"$(INTDIR)\jccoefct.obj" \
	"$(INTDIR)\jccolor.obj" \
	"$(INTDIR)\jcdctmgr.obj" \
	"$(INTDIR)\jchuff.obj" \
	"$(INTDIR)\jcinit.obj" \
	"$(INTDIR)\jcmainct.obj" \
	"$(INTDIR)\jcmarker.obj" \
	"$(INTDIR)\jcmaster.obj" \
	"$(INTDIR)\jcomapi.obj" \
	"$(INTDIR)\jcparam.obj" \
	"$(INTDIR)\jcphuff.obj" \
	"$(INTDIR)\jcprepct.obj" \
	"$(INTDIR)\jcsample.obj" \
	"$(INTDIR)\jctrans.obj" \
	"$(INTDIR)\jdapimin.obj" \
	"$(INTDIR)\jdapistd.obj" \
	"$(INTDIR)\jdatadst.obj" \
	"$(INTDIR)\jdatasrc.obj" \
	"$(INTDIR)\jdcoefct.obj" \
	"$(INTDIR)\jdcolor.obj" \
	"$(INTDIR)\jddctmgr.obj" \
	"$(INTDIR)\jdhuff.obj" \
	"$(INTDIR)\jdinput.obj" \
	"$(INTDIR)\jdmainct.obj" \
	"$(INTDIR)\jdmarker.obj" \
	"$(INTDIR)\jdmaster.obj" \
	"$(INTDIR)\jdmerge.obj" \
	"$(INTDIR)\jdphuff.obj" \
	"$(INTDIR)\jdpostct.obj" \
	"$(INTDIR)\jdsample.obj" \
	"$(INTDIR)\jdtrans.obj" \
	"$(INTDIR)\jerror.obj" \
	"$(INTDIR)\jfdctflt.obj" \
	"$(INTDIR)\jfdctfst.obj" \
	"$(INTDIR)\jfdctint.obj" \
	"$(INTDIR)\jidctflt.obj" \
	"$(INTDIR)\jidctfst.obj" \
	"$(INTDIR)\jidctint.obj" \
	"$(INTDIR)\jidctred.obj" \
	"$(INTDIR)\jmemansi.obj" \
	"$(INTDIR)\jmemmgr.obj" \
	"$(INTDIR)\jmemnobs.obj" \
	"$(INTDIR)\jquant1.obj" \
	"$(INTDIR)\jquant2.obj" \
	"$(INTDIR)\jutils.obj"

"$(OUTDIR)\Libjpeg.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "libjpeg - Win32 Release" || "$(CFG)" ==\
 "libjpeg - Win32 Debug"
SOURCE=..\libjpeg\jcapimin.c
DEP_CPP_JCAPI=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcapimin.obj" : $(SOURCE) $(DEP_CPP_JCAPI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcapistd.c
DEP_CPP_JCAPIS=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcapistd.obj" : $(SOURCE) $(DEP_CPP_JCAPIS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jccoefct.c
DEP_CPP_JCCOE=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jccoefct.obj" : $(SOURCE) $(DEP_CPP_JCCOE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jccolor.c
DEP_CPP_JCCOL=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jccolor.obj" : $(SOURCE) $(DEP_CPP_JCCOL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcdctmgr.c
DEP_CPP_JCDCT=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcdctmgr.obj" : $(SOURCE) $(DEP_CPP_JCDCT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jchuff.c
DEP_CPP_JCHUF=\
	"..\libjpeg\jchuff.h"\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jchuff.obj" : $(SOURCE) $(DEP_CPP_JCHUF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcinit.c
DEP_CPP_JCINI=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcinit.obj" : $(SOURCE) $(DEP_CPP_JCINI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcmainct.c
DEP_CPP_JCMAI=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcmainct.obj" : $(SOURCE) $(DEP_CPP_JCMAI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcmarker.c
DEP_CPP_JCMAR=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcmarker.obj" : $(SOURCE) $(DEP_CPP_JCMAR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcmaster.c
DEP_CPP_JCMAS=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcmaster.obj" : $(SOURCE) $(DEP_CPP_JCMAS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcomapi.c
DEP_CPP_JCOMA=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcomapi.obj" : $(SOURCE) $(DEP_CPP_JCOMA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcparam.c
DEP_CPP_JCPAR=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcparam.obj" : $(SOURCE) $(DEP_CPP_JCPAR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcphuff.c
DEP_CPP_JCPHU=\
	"..\libjpeg\jchuff.h"\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcphuff.obj" : $(SOURCE) $(DEP_CPP_JCPHU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcprepct.c
DEP_CPP_JCPRE=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcprepct.obj" : $(SOURCE) $(DEP_CPP_JCPRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jcsample.c
DEP_CPP_JCSAM=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jcsample.obj" : $(SOURCE) $(DEP_CPP_JCSAM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jctrans.c
DEP_CPP_JCTRA=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jctrans.obj" : $(SOURCE) $(DEP_CPP_JCTRA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdapimin.c
DEP_CPP_JDAPI=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdapimin.obj" : $(SOURCE) $(DEP_CPP_JDAPI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdapistd.c
DEP_CPP_JDAPIS=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdapistd.obj" : $(SOURCE) $(DEP_CPP_JDAPIS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdatadst.c
DEP_CPP_JDATA=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdatadst.obj" : $(SOURCE) $(DEP_CPP_JDATA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdatasrc.c
DEP_CPP_JDATAS=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdatasrc.obj" : $(SOURCE) $(DEP_CPP_JDATAS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdcoefct.c
DEP_CPP_JDCOE=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdcoefct.obj" : $(SOURCE) $(DEP_CPP_JDCOE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdcolor.c
DEP_CPP_JDCOL=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdcolor.obj" : $(SOURCE) $(DEP_CPP_JDCOL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jddctmgr.c
DEP_CPP_JDDCT=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jddctmgr.obj" : $(SOURCE) $(DEP_CPP_JDDCT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdhuff.c
DEP_CPP_JDHUF=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdhuff.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdhuff.obj" : $(SOURCE) $(DEP_CPP_JDHUF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdinput.c
DEP_CPP_JDINP=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdinput.obj" : $(SOURCE) $(DEP_CPP_JDINP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdmainct.c
DEP_CPP_JDMAI=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdmainct.obj" : $(SOURCE) $(DEP_CPP_JDMAI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdmarker.c
DEP_CPP_JDMAR=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdmarker.obj" : $(SOURCE) $(DEP_CPP_JDMAR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdmaster.c
DEP_CPP_JDMAS=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdmaster.obj" : $(SOURCE) $(DEP_CPP_JDMAS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdmerge.c
DEP_CPP_JDMER=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdmerge.obj" : $(SOURCE) $(DEP_CPP_JDMER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdphuff.c
DEP_CPP_JDPHU=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdhuff.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdphuff.obj" : $(SOURCE) $(DEP_CPP_JDPHU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdpostct.c
DEP_CPP_JDPOS=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdpostct.obj" : $(SOURCE) $(DEP_CPP_JDPOS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdsample.c
DEP_CPP_JDSAM=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdsample.obj" : $(SOURCE) $(DEP_CPP_JDSAM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jdtrans.c
DEP_CPP_JDTRA=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jdtrans.obj" : $(SOURCE) $(DEP_CPP_JDTRA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jerror.c
DEP_CPP_JERRO=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	"..\libjpeg\jversion.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jerror.obj" : $(SOURCE) $(DEP_CPP_JERRO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jfdctflt.c
DEP_CPP_JFDCT=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jfdctflt.obj" : $(SOURCE) $(DEP_CPP_JFDCT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jfdctfst.c
DEP_CPP_JFDCTF=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jfdctfst.obj" : $(SOURCE) $(DEP_CPP_JFDCTF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jfdctint.c
DEP_CPP_JFDCTI=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jfdctint.obj" : $(SOURCE) $(DEP_CPP_JFDCTI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jidctflt.c
DEP_CPP_JIDCT=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jidctflt.obj" : $(SOURCE) $(DEP_CPP_JIDCT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jidctfst.c
DEP_CPP_JIDCTF=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jidctfst.obj" : $(SOURCE) $(DEP_CPP_JIDCTF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jidctint.c
DEP_CPP_JIDCTI=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jidctint.obj" : $(SOURCE) $(DEP_CPP_JIDCTI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jidctred.c
DEP_CPP_JIDCTR=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jdct.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jidctred.obj" : $(SOURCE) $(DEP_CPP_JIDCTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jmemansi.c
DEP_CPP_JMEMA=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmemsys.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jmemansi.obj" : $(SOURCE) $(DEP_CPP_JMEMA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jmemmgr.c
DEP_CPP_JMEMM=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmemsys.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jmemmgr.obj" : $(SOURCE) $(DEP_CPP_JMEMM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jmemnobs.c
DEP_CPP_JMEMN=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmemsys.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jmemnobs.obj" : $(SOURCE) $(DEP_CPP_JMEMN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jquant1.c
DEP_CPP_JQUAN=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jquant1.obj" : $(SOURCE) $(DEP_CPP_JQUAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jquant2.c
DEP_CPP_JQUANT=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jquant2.obj" : $(SOURCE) $(DEP_CPP_JQUANT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\libjpeg\jutils.c
DEP_CPP_JUTIL=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jinclude.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\jutils.obj" : $(SOURCE) $(DEP_CPP_JUTIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

