# Microsoft Developer Studio Generated NMAKE File, Based on libwww.dsp
!IF "$(CFG)" == ""
CFG=libwww - Win32 Debug
!MESSAGE No configuration specified. Defaulting to libwww - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "libwww - Win32 Release" && "$(CFG)" != "libwww - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "libwww.mak" CFG="libwww - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "libwww - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "libwww - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "libwww - Win32 Release"

OUTDIR=.\.
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\.
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\libwww.lib"

!ELSE 

ALL : "$(OUTDIR)\libwww.lib"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\HTAABrow.obj"
	-@erase "$(INTDIR)\HTAAUtil.obj"
	-@erase "$(INTDIR)\HTAccess.obj"
	-@erase "$(INTDIR)\HTAlert.obj"
	-@erase "$(INTDIR)\HTAnchor.obj"
	-@erase "$(INTDIR)\HTANSI.obj"
	-@erase "$(INTDIR)\HTArray.obj"
	-@erase "$(INTDIR)\HTAssoc.obj"
	-@erase "$(INTDIR)\HTAtom.obj"
	-@erase "$(INTDIR)\HTBind.obj"
	-@erase "$(INTDIR)\HTBInit.obj"
	-@erase "$(INTDIR)\HTBound.obj"
	-@erase "$(INTDIR)\HTBTree.obj"
	-@erase "$(INTDIR)\HTBufWrt.obj"
	-@erase "$(INTDIR)\HTCache.obj"
	-@erase "$(INTDIR)\HTChannl.obj"
	-@erase "$(INTDIR)\HTChunk.obj"
	-@erase "$(INTDIR)\HTConLen.obj"
	-@erase "$(INTDIR)\HTDescpt.obj"
	-@erase "$(INTDIR)\HTDialog.obj"
	-@erase "$(INTDIR)\HTDir.obj"
	-@erase "$(INTDIR)\HTDNS.obj"
	-@erase "$(INTDIR)\HTEPtoCl.obj"
	-@erase "$(INTDIR)\HTError.obj"
	-@erase "$(INTDIR)\HTEscape.obj"
	-@erase "$(INTDIR)\HTEvent.obj"
	-@erase "$(INTDIR)\HTEvntrg.obj"
	-@erase "$(INTDIR)\HTFile.obj"
	-@erase "$(INTDIR)\HTFilter.obj"
	-@erase "$(INTDIR)\HTFormat.obj"
	-@erase "$(INTDIR)\HTFWrite.obj"
	-@erase "$(INTDIR)\HTGuess.obj"
	-@erase "$(INTDIR)\HTHeader.obj"
	-@erase "$(INTDIR)\HTHInit.obj"
	-@erase "$(INTDIR)\HTHist.obj"
	-@erase "$(INTDIR)\HTHome.obj"
	-@erase "$(INTDIR)\HTHost.obj"
	-@erase "$(INTDIR)\HTIcons.obj"
	-@erase "$(INTDIR)\HTInet.obj"
	-@erase "$(INTDIR)\HTInit.obj"
	-@erase "$(INTDIR)\HTLib.obj"
	-@erase "$(INTDIR)\HTLink.obj"
	-@erase "$(INTDIR)\HTList.obj"
	-@erase "$(INTDIR)\HTLocal.obj"
	-@erase "$(INTDIR)\HTLog.obj"
	-@erase "$(INTDIR)\HTMemory.obj"
	-@erase "$(INTDIR)\HTMerge.obj"
	-@erase "$(INTDIR)\HTMethod.obj"
	-@erase "$(INTDIR)\HTMIME.obj"
	-@erase "$(INTDIR)\HTMIMERq.obj"
	-@erase "$(INTDIR)\HTMIMImp.obj"
	-@erase "$(INTDIR)\HTMIMPrs.obj"
	-@erase "$(INTDIR)\HTML.obj"
	-@erase "$(INTDIR)\HTMLGen.obj"
	-@erase "$(INTDIR)\HTMLPDTD.obj"
	-@erase "$(INTDIR)\HTMulti.obj"
	-@erase "$(INTDIR)\HTMux.obj"
	-@erase "$(INTDIR)\HTNet.obj"
	-@erase "$(INTDIR)\HTNetTxt.obj"
	-@erase "$(INTDIR)\HTParse.obj"
	-@erase "$(INTDIR)\HTPEP.obj"
	-@erase "$(INTDIR)\HTPlain.obj"
	-@erase "$(INTDIR)\HTProfil.obj"
	-@erase "$(INTDIR)\HTProt.obj"
	-@erase "$(INTDIR)\HTProxy.obj"
	-@erase "$(INTDIR)\HTReader.obj"
	-@erase "$(INTDIR)\HTReqMan.obj"
	-@erase "$(INTDIR)\HTResponse.obj"
	-@erase "$(INTDIR)\HTRules.obj"
	-@erase "$(INTDIR)\HTSChunk.obj"
	-@erase "$(INTDIR)\HTSocket.obj"
	-@erase "$(INTDIR)\HTStream.obj"
	-@erase "$(INTDIR)\HTString.obj"
	-@erase "$(INTDIR)\HTStyle.obj"
	-@erase "$(INTDIR)\HTTChunk.obj"
	-@erase "$(INTDIR)\HTTCP.obj"
	-@erase "$(INTDIR)\HTTee.obj"
	-@erase "$(INTDIR)\HTTP.obj"
	-@erase "$(INTDIR)\HTTPGen.obj"
	-@erase "$(INTDIR)\HTTPReq.obj"
	-@erase "$(INTDIR)\HTTPRes.obj"
	-@erase "$(INTDIR)\HTTPServ.obj"
	-@erase "$(INTDIR)\HTTrans.obj"
	-@erase "$(INTDIR)\HTUser.obj"
	-@erase "$(INTDIR)\HTUTree.obj"
	-@erase "$(INTDIR)\HTUU.obj"
	-@erase "$(INTDIR)\HTWriter.obj"
	-@erase "$(INTDIR)\HTWSRC.obj"
	-@erase "$(INTDIR)\HTWWWStr.obj"
	-@erase "$(INTDIR)\HTXParse.obj"
	-@erase "$(INTDIR)\SGML.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\libwww.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D\
 "WWW_WIN_ASYNC" /Fp"$(INTDIR)\libwww.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"\
 /FD /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\libwww.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\libwww.lib" 
LIB32_OBJS= \
	"$(INTDIR)\HTAABrow.obj" \
	"$(INTDIR)\HTAAUtil.obj" \
	"$(INTDIR)\HTAccess.obj" \
	"$(INTDIR)\HTAlert.obj" \
	"$(INTDIR)\HTAnchor.obj" \
	"$(INTDIR)\HTANSI.obj" \
	"$(INTDIR)\HTArray.obj" \
	"$(INTDIR)\HTAssoc.obj" \
	"$(INTDIR)\HTAtom.obj" \
	"$(INTDIR)\HTBind.obj" \
	"$(INTDIR)\HTBInit.obj" \
	"$(INTDIR)\HTBound.obj" \
	"$(INTDIR)\HTBTree.obj" \
	"$(INTDIR)\HTBufWrt.obj" \
	"$(INTDIR)\HTCache.obj" \
	"$(INTDIR)\HTChannl.obj" \
	"$(INTDIR)\HTChunk.obj" \
	"$(INTDIR)\HTConLen.obj" \
	"$(INTDIR)\HTDescpt.obj" \
	"$(INTDIR)\HTDialog.obj" \
	"$(INTDIR)\HTDir.obj" \
	"$(INTDIR)\HTDNS.obj" \
	"$(INTDIR)\HTEPtoCl.obj" \
	"$(INTDIR)\HTError.obj" \
	"$(INTDIR)\HTEscape.obj" \
	"$(INTDIR)\HTEvent.obj" \
	"$(INTDIR)\HTEvntrg.obj" \
	"$(INTDIR)\HTFile.obj" \
	"$(INTDIR)\HTFilter.obj" \
	"$(INTDIR)\HTFormat.obj" \
	"$(INTDIR)\HTFWrite.obj" \
	"$(INTDIR)\HTGuess.obj" \
	"$(INTDIR)\HTHeader.obj" \
	"$(INTDIR)\HTHInit.obj" \
	"$(INTDIR)\HTHist.obj" \
	"$(INTDIR)\HTHome.obj" \
	"$(INTDIR)\HTHost.obj" \
	"$(INTDIR)\HTIcons.obj" \
	"$(INTDIR)\HTInet.obj" \
	"$(INTDIR)\HTInit.obj" \
	"$(INTDIR)\HTLib.obj" \
	"$(INTDIR)\HTLink.obj" \
	"$(INTDIR)\HTList.obj" \
	"$(INTDIR)\HTLocal.obj" \
	"$(INTDIR)\HTLog.obj" \
	"$(INTDIR)\HTMemory.obj" \
	"$(INTDIR)\HTMerge.obj" \
	"$(INTDIR)\HTMethod.obj" \
	"$(INTDIR)\HTMIME.obj" \
	"$(INTDIR)\HTMIMERq.obj" \
	"$(INTDIR)\HTMIMImp.obj" \
	"$(INTDIR)\HTMIMPrs.obj" \
	"$(INTDIR)\HTML.obj" \
	"$(INTDIR)\HTMLGen.obj" \
	"$(INTDIR)\HTMLPDTD.obj" \
	"$(INTDIR)\HTMulti.obj" \
	"$(INTDIR)\HTMux.obj" \
	"$(INTDIR)\HTNet.obj" \
	"$(INTDIR)\HTNetTxt.obj" \
	"$(INTDIR)\HTParse.obj" \
	"$(INTDIR)\HTPEP.obj" \
	"$(INTDIR)\HTPlain.obj" \
	"$(INTDIR)\HTProfil.obj" \
	"$(INTDIR)\HTProt.obj" \
	"$(INTDIR)\HTProxy.obj" \
	"$(INTDIR)\HTReader.obj" \
	"$(INTDIR)\HTReqMan.obj" \
	"$(INTDIR)\HTResponse.obj" \
	"$(INTDIR)\HTRules.obj" \
	"$(INTDIR)\HTSChunk.obj" \
	"$(INTDIR)\HTSocket.obj" \
	"$(INTDIR)\HTStream.obj" \
	"$(INTDIR)\HTString.obj" \
	"$(INTDIR)\HTStyle.obj" \
	"$(INTDIR)\HTTChunk.obj" \
	"$(INTDIR)\HTTCP.obj" \
	"$(INTDIR)\HTTee.obj" \
	"$(INTDIR)\HTTP.obj" \
	"$(INTDIR)\HTTPGen.obj" \
	"$(INTDIR)\HTTPReq.obj" \
	"$(INTDIR)\HTTPRes.obj" \
	"$(INTDIR)\HTTPServ.obj" \
	"$(INTDIR)\HTTrans.obj" \
	"$(INTDIR)\HTUser.obj" \
	"$(INTDIR)\HTUTree.obj" \
	"$(INTDIR)\HTUU.obj" \
	"$(INTDIR)\HTWriter.obj" \
	"$(INTDIR)\HTWSRC.obj" \
	"$(INTDIR)\HTWWWStr.obj" \
	"$(INTDIR)\HTXParse.obj" \
	"$(INTDIR)\SGML.obj"

"$(OUTDIR)\libwww.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "libwww - Win32 Debug"

OUTDIR=.\.
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\.
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\libwww.lib"

!ELSE 

ALL : "$(OUTDIR)\libwww.lib"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\HTAABrow.obj"
	-@erase "$(INTDIR)\HTAAUtil.obj"
	-@erase "$(INTDIR)\HTAccess.obj"
	-@erase "$(INTDIR)\HTAlert.obj"
	-@erase "$(INTDIR)\HTAnchor.obj"
	-@erase "$(INTDIR)\HTANSI.obj"
	-@erase "$(INTDIR)\HTArray.obj"
	-@erase "$(INTDIR)\HTAssoc.obj"
	-@erase "$(INTDIR)\HTAtom.obj"
	-@erase "$(INTDIR)\HTBind.obj"
	-@erase "$(INTDIR)\HTBInit.obj"
	-@erase "$(INTDIR)\HTBound.obj"
	-@erase "$(INTDIR)\HTBTree.obj"
	-@erase "$(INTDIR)\HTBufWrt.obj"
	-@erase "$(INTDIR)\HTCache.obj"
	-@erase "$(INTDIR)\HTChannl.obj"
	-@erase "$(INTDIR)\HTChunk.obj"
	-@erase "$(INTDIR)\HTConLen.obj"
	-@erase "$(INTDIR)\HTDescpt.obj"
	-@erase "$(INTDIR)\HTDialog.obj"
	-@erase "$(INTDIR)\HTDir.obj"
	-@erase "$(INTDIR)\HTDNS.obj"
	-@erase "$(INTDIR)\HTEPtoCl.obj"
	-@erase "$(INTDIR)\HTError.obj"
	-@erase "$(INTDIR)\HTEscape.obj"
	-@erase "$(INTDIR)\HTEvent.obj"
	-@erase "$(INTDIR)\HTEvntrg.obj"
	-@erase "$(INTDIR)\HTFile.obj"
	-@erase "$(INTDIR)\HTFilter.obj"
	-@erase "$(INTDIR)\HTFormat.obj"
	-@erase "$(INTDIR)\HTFWrite.obj"
	-@erase "$(INTDIR)\HTGuess.obj"
	-@erase "$(INTDIR)\HTHeader.obj"
	-@erase "$(INTDIR)\HTHInit.obj"
	-@erase "$(INTDIR)\HTHist.obj"
	-@erase "$(INTDIR)\HTHome.obj"
	-@erase "$(INTDIR)\HTHost.obj"
	-@erase "$(INTDIR)\HTIcons.obj"
	-@erase "$(INTDIR)\HTInet.obj"
	-@erase "$(INTDIR)\HTInit.obj"
	-@erase "$(INTDIR)\HTLib.obj"
	-@erase "$(INTDIR)\HTLink.obj"
	-@erase "$(INTDIR)\HTList.obj"
	-@erase "$(INTDIR)\HTLocal.obj"
	-@erase "$(INTDIR)\HTLog.obj"
	-@erase "$(INTDIR)\HTMemory.obj"
	-@erase "$(INTDIR)\HTMerge.obj"
	-@erase "$(INTDIR)\HTMethod.obj"
	-@erase "$(INTDIR)\HTMIME.obj"
	-@erase "$(INTDIR)\HTMIMERq.obj"
	-@erase "$(INTDIR)\HTMIMImp.obj"
	-@erase "$(INTDIR)\HTMIMPrs.obj"
	-@erase "$(INTDIR)\HTML.obj"
	-@erase "$(INTDIR)\HTMLGen.obj"
	-@erase "$(INTDIR)\HTMLPDTD.obj"
	-@erase "$(INTDIR)\HTMulti.obj"
	-@erase "$(INTDIR)\HTMux.obj"
	-@erase "$(INTDIR)\HTNet.obj"
	-@erase "$(INTDIR)\HTNetTxt.obj"
	-@erase "$(INTDIR)\HTParse.obj"
	-@erase "$(INTDIR)\HTPEP.obj"
	-@erase "$(INTDIR)\HTPlain.obj"
	-@erase "$(INTDIR)\HTProfil.obj"
	-@erase "$(INTDIR)\HTProt.obj"
	-@erase "$(INTDIR)\HTProxy.obj"
	-@erase "$(INTDIR)\HTReader.obj"
	-@erase "$(INTDIR)\HTReqMan.obj"
	-@erase "$(INTDIR)\HTResponse.obj"
	-@erase "$(INTDIR)\HTRules.obj"
	-@erase "$(INTDIR)\HTSChunk.obj"
	-@erase "$(INTDIR)\HTSocket.obj"
	-@erase "$(INTDIR)\HTStream.obj"
	-@erase "$(INTDIR)\HTString.obj"
	-@erase "$(INTDIR)\HTStyle.obj"
	-@erase "$(INTDIR)\HTTChunk.obj"
	-@erase "$(INTDIR)\HTTCP.obj"
	-@erase "$(INTDIR)\HTTee.obj"
	-@erase "$(INTDIR)\HTTP.obj"
	-@erase "$(INTDIR)\HTTPGen.obj"
	-@erase "$(INTDIR)\HTTPReq.obj"
	-@erase "$(INTDIR)\HTTPRes.obj"
	-@erase "$(INTDIR)\HTTPServ.obj"
	-@erase "$(INTDIR)\HTTrans.obj"
	-@erase "$(INTDIR)\HTUser.obj"
	-@erase "$(INTDIR)\HTUTree.obj"
	-@erase "$(INTDIR)\HTUU.obj"
	-@erase "$(INTDIR)\HTWriter.obj"
	-@erase "$(INTDIR)\HTWSRC.obj"
	-@erase "$(INTDIR)\HTWWWStr.obj"
	-@erase "$(INTDIR)\HTXParse.obj"
	-@erase "$(INTDIR)\SGML.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\libwww.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /GX /Z7 /Od /I "..\w3c-libwww-5.0a\Library\src" /D\
 "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\libwww.pch"\
 /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\libwww.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\libwww.lib" 
LIB32_OBJS= \
	"$(INTDIR)\HTAABrow.obj" \
	"$(INTDIR)\HTAAUtil.obj" \
	"$(INTDIR)\HTAccess.obj" \
	"$(INTDIR)\HTAlert.obj" \
	"$(INTDIR)\HTAnchor.obj" \
	"$(INTDIR)\HTANSI.obj" \
	"$(INTDIR)\HTArray.obj" \
	"$(INTDIR)\HTAssoc.obj" \
	"$(INTDIR)\HTAtom.obj" \
	"$(INTDIR)\HTBind.obj" \
	"$(INTDIR)\HTBInit.obj" \
	"$(INTDIR)\HTBound.obj" \
	"$(INTDIR)\HTBTree.obj" \
	"$(INTDIR)\HTBufWrt.obj" \
	"$(INTDIR)\HTCache.obj" \
	"$(INTDIR)\HTChannl.obj" \
	"$(INTDIR)\HTChunk.obj" \
	"$(INTDIR)\HTConLen.obj" \
	"$(INTDIR)\HTDescpt.obj" \
	"$(INTDIR)\HTDialog.obj" \
	"$(INTDIR)\HTDir.obj" \
	"$(INTDIR)\HTDNS.obj" \
	"$(INTDIR)\HTEPtoCl.obj" \
	"$(INTDIR)\HTError.obj" \
	"$(INTDIR)\HTEscape.obj" \
	"$(INTDIR)\HTEvent.obj" \
	"$(INTDIR)\HTEvntrg.obj" \
	"$(INTDIR)\HTFile.obj" \
	"$(INTDIR)\HTFilter.obj" \
	"$(INTDIR)\HTFormat.obj" \
	"$(INTDIR)\HTFWrite.obj" \
	"$(INTDIR)\HTGuess.obj" \
	"$(INTDIR)\HTHeader.obj" \
	"$(INTDIR)\HTHInit.obj" \
	"$(INTDIR)\HTHist.obj" \
	"$(INTDIR)\HTHome.obj" \
	"$(INTDIR)\HTHost.obj" \
	"$(INTDIR)\HTIcons.obj" \
	"$(INTDIR)\HTInet.obj" \
	"$(INTDIR)\HTInit.obj" \
	"$(INTDIR)\HTLib.obj" \
	"$(INTDIR)\HTLink.obj" \
	"$(INTDIR)\HTList.obj" \
	"$(INTDIR)\HTLocal.obj" \
	"$(INTDIR)\HTLog.obj" \
	"$(INTDIR)\HTMemory.obj" \
	"$(INTDIR)\HTMerge.obj" \
	"$(INTDIR)\HTMethod.obj" \
	"$(INTDIR)\HTMIME.obj" \
	"$(INTDIR)\HTMIMERq.obj" \
	"$(INTDIR)\HTMIMImp.obj" \
	"$(INTDIR)\HTMIMPrs.obj" \
	"$(INTDIR)\HTML.obj" \
	"$(INTDIR)\HTMLGen.obj" \
	"$(INTDIR)\HTMLPDTD.obj" \
	"$(INTDIR)\HTMulti.obj" \
	"$(INTDIR)\HTMux.obj" \
	"$(INTDIR)\HTNet.obj" \
	"$(INTDIR)\HTNetTxt.obj" \
	"$(INTDIR)\HTParse.obj" \
	"$(INTDIR)\HTPEP.obj" \
	"$(INTDIR)\HTPlain.obj" \
	"$(INTDIR)\HTProfil.obj" \
	"$(INTDIR)\HTProt.obj" \
	"$(INTDIR)\HTProxy.obj" \
	"$(INTDIR)\HTReader.obj" \
	"$(INTDIR)\HTReqMan.obj" \
	"$(INTDIR)\HTResponse.obj" \
	"$(INTDIR)\HTRules.obj" \
	"$(INTDIR)\HTSChunk.obj" \
	"$(INTDIR)\HTSocket.obj" \
	"$(INTDIR)\HTStream.obj" \
	"$(INTDIR)\HTString.obj" \
	"$(INTDIR)\HTStyle.obj" \
	"$(INTDIR)\HTTChunk.obj" \
	"$(INTDIR)\HTTCP.obj" \
	"$(INTDIR)\HTTee.obj" \
	"$(INTDIR)\HTTP.obj" \
	"$(INTDIR)\HTTPGen.obj" \
	"$(INTDIR)\HTTPReq.obj" \
	"$(INTDIR)\HTTPRes.obj" \
	"$(INTDIR)\HTTPServ.obj" \
	"$(INTDIR)\HTTrans.obj" \
	"$(INTDIR)\HTUser.obj" \
	"$(INTDIR)\HTUTree.obj" \
	"$(INTDIR)\HTUU.obj" \
	"$(INTDIR)\HTWriter.obj" \
	"$(INTDIR)\HTWSRC.obj" \
	"$(INTDIR)\HTWWWStr.obj" \
	"$(INTDIR)\HTXParse.obj" \
	"$(INTDIR)\SGML.obj"

"$(OUTDIR)\libwww.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "libwww - Win32 Release" || "$(CFG)" == "libwww - Win32 Debug"
SOURCE="..\w3c-libwww-5.0a\Library\src\HTAABrow.c"
DEP_CPP_HTAAB=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTAAB=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTAABrow.obj" : $(SOURCE) $(DEP_CPP_HTAAB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTAAUtil.c"
DEP_CPP_HTAAU=\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTAAU=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTAAUtil.obj" : $(SOURCE) $(DEP_CPP_HTAAU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTAccess.c"
DEP_CPP_HTACC=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTConLen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTGuess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMerge.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTRules.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTee.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\HTXParse.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWStream.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTACC=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTAccess.obj" : $(SOURCE) $(DEP_CPP_HTACC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTAlert.c"
DEP_CPP_HTALE=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTALE=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTAlert.obj" : $(SOURCE) $(DEP_CPP_HTALE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTAnchor.c"
DEP_CPP_HTANC=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTANC=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTAnchor.obj" : $(SOURCE) $(DEP_CPP_HTANC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTANSI.c"
DEP_CPP_HTANS=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTANS=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTANSI.obj" : $(SOURCE) $(DEP_CPP_HTANS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTArray.c"
DEP_CPP_HTARR=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTARR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTArray.obj" : $(SOURCE) $(DEP_CPP_HTARR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTAssoc.c"
DEP_CPP_HTASS=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTASS=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTAssoc.obj" : $(SOURCE) $(DEP_CPP_HTASS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTAtom.c"
DEP_CPP_HTATO=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTATO=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTAtom.obj" : $(SOURCE) $(DEP_CPP_HTATO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTBind.c"
DEP_CPP_HTBIN=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTBIN=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTBind.obj" : $(SOURCE) $(DEP_CPP_HTBIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTBInit.c"
DEP_CPP_HTBINI=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBInit.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTBINI=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTBInit.obj" : $(SOURCE) $(DEP_CPP_HTBINI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTBound.c"
DEP_CPP_HTBOU=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBound.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTBOU=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTBound.obj" : $(SOURCE) $(DEP_CPP_HTBOU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTBTree.c"
DEP_CPP_HTBTR=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTBTR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTBTree.obj" : $(SOURCE) $(DEP_CPP_HTBTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTBufWrt.c"
DEP_CPP_HTBUF=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTBUF=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTBufWrt.obj" : $(SOURCE) $(DEP_CPP_HTBUF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTCache.c"
DEP_CPP_HTCAC=\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTCache.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDialog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvntrg.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFilter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHist.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHome.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTRules.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSocket.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWApp.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTCAC=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTCache.obj" : $(SOURCE) $(DEP_CPP_HTCAC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTChannl.c"
DEP_CPP_HTCHA=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTCHA=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTChannl.obj" : $(SOURCE) $(DEP_CPP_HTCHA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTChunk.c"
DEP_CPP_HTCHU=\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTCHU=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTChunk.obj" : $(SOURCE) $(DEP_CPP_HTCHU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTConLen.c"
DEP_CPP_HTCON=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTConLen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTCON=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTConLen.obj" : $(SOURCE) $(DEP_CPP_HTCON) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTDescpt.c"
DEP_CPP_HTDES=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTDES=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTDescpt.obj" : $(SOURCE) $(DEP_CPP_HTDES) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTDialog.c"
DEP_CPP_HTDIA=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDialog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvntrg.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFilter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHist.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHome.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTRules.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPRes.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPServ.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWApp.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTDIA=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTDialog.obj" : $(SOURCE) $(DEP_CPP_HTDIA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTDir.c"
DEP_CPP_HTDIR=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDescpt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDir.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIcons.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTML.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTDIR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTDir.obj" : $(SOURCE) $(DEP_CPP_HTDIR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTDNS.c"
DEP_CPP_HTDNS=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTDNS=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTDNS.obj" : $(SOURCE) $(DEP_CPP_HTDNS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTEPtoCl.c"
DEP_CPP_HTEPT=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTEPT=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTEPtoCl.obj" : $(SOURCE) $(DEP_CPP_HTEPT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTError.c"
DEP_CPP_HTERR=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTERR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTError.obj" : $(SOURCE) $(DEP_CPP_HTERR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTEscape.c"
DEP_CPP_HTESC=\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTESC=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTEscape.obj" : $(SOURCE) $(DEP_CPP_HTESC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTEvent.c"
DEP_CPP_HTEVE=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTEVE=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTEvent.obj" : $(SOURCE) $(DEP_CPP_HTEVE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTEvntrg.c"
DEP_CPP_HTEVN=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvntrg.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTEVN=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTEvntrg.obj" : $(SOURCE) $(DEP_CPP_HTEVN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTFile.c"
DEP_CPP_HTFIL=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDescpt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDir.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFile.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIcons.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSocket.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWDir.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTFIL=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTFile.obj" : $(SOURCE) $(DEP_CPP_HTFIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTFilter.c"
DEP_CPP_HTFILT=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTCache.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFilter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTRules.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPRes.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPServ.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCache.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTFILT=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTFilter.obj" : $(SOURCE) $(DEP_CPP_HTFILT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTFormat.c"
DEP_CPP_HTFOR=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTFOR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTFormat.obj" : $(SOURCE) $(DEP_CPP_HTFOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTFWrite.c"
DEP_CPP_HTFWR=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTFWR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTFWrite.obj" : $(SOURCE) $(DEP_CPP_HTFWR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTGuess.c"
DEP_CPP_HTGUE=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTGuess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTGUE=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTGuess.obj" : $(SOURCE) $(DEP_CPP_HTGUE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTHeader.c"
DEP_CPP_HTHEA=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTHEA=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTHeader.obj" : $(SOURCE) $(DEP_CPP_HTHEA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTHInit.c"
DEP_CPP_HTHIN=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHInit.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTHIN=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTHInit.obj" : $(SOURCE) $(DEP_CPP_HTHIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTHist.c"
DEP_CPP_HTHIS=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHist.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTHIS=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTHist.obj" : $(SOURCE) $(DEP_CPP_HTHIS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTHome.c"
DEP_CPP_HTHOM=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHome.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTHOM=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTHome.obj" : $(SOURCE) $(DEP_CPP_HTHOM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTHost.c"
DEP_CPP_HTHOS=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTHOS=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTHost.obj" : $(SOURCE) $(DEP_CPP_HTHOS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTIcons.c"
DEP_CPP_HTICO=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIcons.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTICO=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTIcons.obj" : $(SOURCE) $(DEP_CPP_HTICO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTInet.c"
DEP_CPP_HTINE=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTINE=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTInet.obj" : $(SOURCE) $(DEP_CPP_HTINE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTInit.c"
DEP_CPP_HTINI=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBound.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTCache.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTConLen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDescpt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDialog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDir.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvntrg.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFile.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFilter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTGuess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHist.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHome.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIcons.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInit.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMerge.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMERq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMImp.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTRules.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSocket.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTee.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPRes.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPServ.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\HTXParse.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWApp.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCache.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWDir.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFile.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTML.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWStream.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTINI=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

"$(INTDIR)\HTInit.obj" : $(SOURCE) $(DEP_CPP_HTINI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTLib.c"
DEP_CPP_HTLIB=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTLIB=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTLib.obj" : $(SOURCE) $(DEP_CPP_HTLIB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTLink.c"
DEP_CPP_HTLIN=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTLIN=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTLink.obj" : $(SOURCE) $(DEP_CPP_HTLIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTList.c"
DEP_CPP_HTLIS=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTLIS=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTList.obj" : $(SOURCE) $(DEP_CPP_HTLIS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTLocal.c"
DEP_CPP_HTLOC=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTLOC=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTLocal.obj" : $(SOURCE) $(DEP_CPP_HTLOC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTLog.c"
DEP_CPP_HTLOG=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTLOG=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTLog.obj" : $(SOURCE) $(DEP_CPP_HTLOG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMemory.c"
DEP_CPP_HTMEM=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMEM=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMemory.obj" : $(SOURCE) $(DEP_CPP_HTMEM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMerge.c"
DEP_CPP_HTMER=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMerge.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMER=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMerge.obj" : $(SOURCE) $(DEP_CPP_HTMER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMethod.c"
DEP_CPP_HTMET=\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMET=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMethod.obj" : $(SOURCE) $(DEP_CPP_HTMET) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMIME.c"
DEP_CPP_HTMIM=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTCache.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTConLen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTGuess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMerge.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTee.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\HTXParse.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCache.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWStream.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMIM=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMIME.obj" : $(SOURCE) $(DEP_CPP_HTMIM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMIMERq.c"
DEP_CPP_HTMIME=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMERq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMIME=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMIMERq.obj" : $(SOURCE) $(DEP_CPP_HTMIME) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMIMImp.c"
DEP_CPP_HTMIMI=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMImp.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMIMI=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMIMImp.obj" : $(SOURCE) $(DEP_CPP_HTMIMI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMIMPrs.c"
DEP_CPP_HTMIMP=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMIMP=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMIMPrs.obj" : $(SOURCE) $(DEP_CPP_HTMIMP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTML.c"
DEP_CPP_HTML_=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HText.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStyle.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTML.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTML_=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTML.obj" : $(SOURCE) $(DEP_CPP_HTML_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMLGen.c"
DEP_CPP_HTMLG=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMLG=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMLGen.obj" : $(SOURCE) $(DEP_CPP_HTMLG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMLPDTD.c"
DEP_CPP_HTMLP=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMLP=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMLPDTD.obj" : $(SOURCE) $(DEP_CPP_HTMLP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMulti.c"
DEP_CPP_HTMUL=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFile.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMUL=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMulti.obj" : $(SOURCE) $(DEP_CPP_HTMUL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTMux.c"
DEP_CPP_HTMUX=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTMUX=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTMux.obj" : $(SOURCE) $(DEP_CPP_HTMUX) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTNet.c"
DEP_CPP_HTNET=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTNET=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTNet.obj" : $(SOURCE) $(DEP_CPP_HTNET) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTNetTxt.c"
DEP_CPP_HTNETT=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetTxt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTNETT=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTNetTxt.obj" : $(SOURCE) $(DEP_CPP_HTNETT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTParse.c"
DEP_CPP_HTPAR=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTPAR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTParse.obj" : $(SOURCE) $(DEP_CPP_HTPAR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTPEP.c"
DEP_CPP_HTPEP=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTPEP=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTPEP.obj" : $(SOURCE) $(DEP_CPP_HTPEP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTPlain.c"
DEP_CPP_HTPLA=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HText.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStyle.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTPLA=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTPlain.obj" : $(SOURCE) $(DEP_CPP_HTPLA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTProfil.c"
DEP_CPP_HTPRO=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBInit.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBound.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTCache.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTConLen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDescpt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDialog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDir.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvntrg.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFile.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFilter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTGuess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHInit.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHist.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHome.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIcons.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInit.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMerge.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMERq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMImp.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTRules.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSocket.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTee.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPRes.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPServ.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\HTXParse.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWApp.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCache.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWDir.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFile.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTML.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWInit.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWStream.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTPRO=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

"$(INTDIR)\HTProfil.obj" : $(SOURCE) $(DEP_CPP_HTPRO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTProt.c"
DEP_CPP_HTPROT=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTPROT=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTProt.obj" : $(SOURCE) $(DEP_CPP_HTPROT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTProxy.c"
DEP_CPP_HTPROX=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDialog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvntrg.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFilter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHist.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHome.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLog.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTRules.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPRes.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPServ.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWApp.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWHTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTPROX=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTProxy.obj" : $(SOURCE) $(DEP_CPP_HTPROX) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTReader.c"
DEP_CPP_HTREA=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTREA=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTReader.obj" : $(SOURCE) $(DEP_CPP_HTREA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTReqMan.c"
DEP_CPP_HTREQ=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTREQ=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTReqMan.obj" : $(SOURCE) $(DEP_CPP_HTREQ) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTResponse.c"
DEP_CPP_HTRES=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTRES=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTResponse.obj" : $(SOURCE) $(DEP_CPP_HTRES) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTRules.c"
DEP_CPP_HTRUL=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTRules.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWLib.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTRUL=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTRules.obj" : $(SOURCE) $(DEP_CPP_HTRUL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTSChunk.c"
DEP_CPP_HTSCH=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTSCH=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTSChunk.obj" : $(SOURCE) $(DEP_CPP_HTSCH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTSocket.c"
DEP_CPP_HTSOC=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSocket.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTSOC=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTSocket.obj" : $(SOURCE) $(DEP_CPP_HTSOC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTStream.c"
DEP_CPP_HTSTR=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTSTR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTStream.obj" : $(SOURCE) $(DEP_CPP_HTSTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTString.c"
DEP_CPP_HTSTRI=\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTSTRI=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTString.obj" : $(SOURCE) $(DEP_CPP_HTSTRI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTStyle.c"
DEP_CPP_HTSTY=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStyle.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTSTY=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTStyle.obj" : $(SOURCE) $(DEP_CPP_HTSTY) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTChunk.c"
DEP_CPP_HTTCH=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTCH=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTChunk.obj" : $(SOURCE) $(DEP_CPP_HTTCH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTCP.c"
DEP_CPP_HTTCP=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTCP=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTCP.obj" : $(SOURCE) $(DEP_CPP_HTTCP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTee.c"
DEP_CPP_HTTEE=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTee.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTEE=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTee.obj" : $(SOURCE) $(DEP_CPP_HTTEE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTP.c"
DEP_CPP_HTTP_=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBound.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTConLen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTGuess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMerge.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMERq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMImp.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSocket.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTee.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\HTXParse.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWStream.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTP_=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTP.obj" : $(SOURCE) $(DEP_CPP_HTTP_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTPGen.c"
DEP_CPP_HTTPG=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBound.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMERq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMImp.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSocket.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTPG=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTPGen.obj" : $(SOURCE) $(DEP_CPP_HTTPG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTPReq.c"
DEP_CPP_HTTPR=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTPR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTPReq.obj" : $(SOURCE) $(DEP_CPP_HTTPR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTPRes.c"
DEP_CPP_HTTPRE=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPRes.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTPRE=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTPRes.obj" : $(SOURCE) $(DEP_CPP_HTTPRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTPServ.c"
DEP_CPP_HTTPS=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTANSI.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBound.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBufWrt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTConLen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTGuess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLocal.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMerge.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMERq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMImp.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTSocket.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTCP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTee.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPRes.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPServ.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTPUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\HTXParse.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWMIME.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWStream.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTPS=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTPServ.obj" : $(SOURCE) $(DEP_CPP_HTTPS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTTrans.c"
DEP_CPP_HTTRA=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTTRA=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTTrans.obj" : $(SOURCE) $(DEP_CPP_HTTRA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTUser.c"
DEP_CPP_HTUSE=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTUSE=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTUser.obj" : $(SOURCE) $(DEP_CPP_HTUSE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTUTree.c"
DEP_CPP_HTUTR=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTUTR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTUTree.obj" : $(SOURCE) $(DEP_CPP_HTUTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTUU.c"
DEP_CPP_HTUU_=\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTUU_=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTUU.obj" : $(SOURCE) $(DEP_CPP_HTUU_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTWriter.c"
DEP_CPP_HTWRI=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWriter.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTWRI=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTWriter.obj" : $(SOURCE) $(DEP_CPP_HTWRI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTWSRC.c"
DEP_CPP_HTWSR=\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHeader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWSRC.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTWSR=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTWSRC.obj" : $(SOURCE) $(DEP_CPP_HTWSR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTWWWStr.c"
DEP_CPP_HTWWW=\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTWWW=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTWWWStr.obj" : $(SOURCE) $(DEP_CPP_HTWWW) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\HTXParse.c"
DEP_CPP_HTXPA=\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAssoc.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAtom.h"\
	"..\w3c-libwww-5.0a\Library\src\HTBind.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChannl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTDNS.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEPtoCl.h"\
	"..\w3c-libwww-5.0a\Library\src\HTError.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEscape.h"\
	"..\w3c-libwww-5.0a\Library\src\HTEvent.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFormat.h"\
	"..\w3c-libwww-5.0a\Library\src\HTFWrite.h"\
	"..\w3c-libwww-5.0a\Library\src\HTHost.h"\
	"..\w3c-libwww-5.0a\Library\src\HTInet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTIOStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLib.h"\
	"..\w3c-libwww-5.0a\Library\src\HTLink.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMethod.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTResponse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTTrans.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUser.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUTree.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUU.h"\
	"..\w3c-libwww-5.0a\Library\src\HTWWWStr.h"\
	"..\w3c-libwww-5.0a\Library\src\HTXParse.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWCore.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HTXPA=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\HTXParse.obj" : $(SOURCE) $(DEP_CPP_HTXPA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\w3c-libwww-5.0a\Library\src\SGML.c"
DEP_CPP_SGML_=\
	"..\w3c-libwww-5.0a\Library\src\HTArray.h"\
	"..\w3c-libwww-5.0a\Library\src\HTChunk.h"\
	"..\w3c-libwww-5.0a\Library\src\HTList.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMemory.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStream.h"\
	"..\w3c-libwww-5.0a\Library\src\HTString.h"\
	"..\w3c-libwww-5.0a\Library\src\HTStruct.h"\
	"..\w3c-libwww-5.0a\Library\src\HTUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\SGML.h"\
	"..\w3c-libwww-5.0a\Library\src\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SGML_=\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	

"$(INTDIR)\SGML.obj" : $(SOURCE) $(DEP_CPP_SGML_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

