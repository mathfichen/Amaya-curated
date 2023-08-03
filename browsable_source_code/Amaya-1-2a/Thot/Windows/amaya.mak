# Microsoft Developer Studio Generated NMAKE File, Based on amaya.dsp
!IF "$(CFG)" == ""
CFG=amaya - Win32 Release
!MESSAGE No configuration specified. Defaulting to amaya - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "amaya - Win32 Release" && "$(CFG)" != "amaya - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "amaya.mak" CFG="amaya - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "amaya - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "amaya - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "amaya - Win32 Release"

OUTDIR=.\bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\.\bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\amaya.exe"

!ELSE 

ALL : "libwww - Win32 Release" "libpng - Win32 Release"\
 "libjpeg - Win32 Release" "LibThotEditor - Win32 Release" "$(OUTDIR)\amaya.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"LibThotEditor - Win32 ReleaseCLEAN" "libjpeg - Win32 ReleaseCLEAN"\
 "libpng - Win32 ReleaseCLEAN" "libwww - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\AHTBridge.obj"
	-@erase "$(INTDIR)\AHTEvntrg.obj"
	-@erase "$(INTDIR)\AHTFWrite.obj"
	-@erase "$(INTDIR)\AHTMemConv.obj"
	-@erase "$(INTDIR)\AHTURLTools.obj"
	-@erase "$(INTDIR)\amaya.res"
	-@erase "$(INTDIR)\answer.obj"
	-@erase "$(INTDIR)\css.obj"
	-@erase "$(INTDIR)\EDITimage.obj"
	-@erase "$(INTDIR)\EDITORactions.obj"
	-@erase "$(INTDIR)\EDITORAPP.obj"
	-@erase "$(INTDIR)\EDITstyle.obj"
	-@erase "$(INTDIR)\html2thot.obj"
	-@erase "$(INTDIR)\HTMLactions.obj"
	-@erase "$(INTDIR)\HTMLAPP.obj"
	-@erase "$(INTDIR)\HTMLbook.obj"
	-@erase "$(INTDIR)\HTMLedit.obj"
	-@erase "$(INTDIR)\HTMLform.obj"
	-@erase "$(INTDIR)\HTMLhistory.obj"
	-@erase "$(INTDIR)\HTMLimage.obj"
	-@erase "$(INTDIR)\HTMLpresentation.obj"
	-@erase "$(INTDIR)\HTMLsave.obj"
	-@erase "$(INTDIR)\HTMLstyle.obj"
	-@erase "$(INTDIR)\HTMLtable.obj"
	-@erase "$(INTDIR)\init.obj"
	-@erase "$(INTDIR)\javaamaya.obj"
	-@erase "$(INTDIR)\Mathedit.obj"
	-@erase "$(INTDIR)\MathMLAPP.obj"
	-@erase "$(INTDIR)\p2css.obj"
	-@erase "$(INTDIR)\query.obj"
	-@erase "$(INTDIR)\tableH.obj"
	-@erase "$(INTDIR)\trans.obj"
	-@erase "$(INTDIR)\transparse.obj"
	-@erase "$(INTDIR)\UIcss.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\windialogapi.obj"
	-@erase "$(OUTDIR)\amaya.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\amaya" /I "..\thotlib\include" /I\
 "..\thotlib\internals\h" /I "..\thotlib\internals\var" /I\
 "..\thotlib\internals\f" /I "..\amaya\f" /I "..\w3c-libwww-5.0a\Library\src" /I\
 "..\libpng\zlib" /I "..\amaya" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "COUGAR"\
 /D "__STDC__" /D "WWW_WIN_ASYNC" /D "WWW_WIN_DLL" /D "SOCKS" /D "MATHML"\
 /Fp"$(INTDIR)\amaya.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\amaya.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\amaya.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib comctl32.lib wsock32.lib /nologo /subsystem:windows\
 /incremental:no /pdb:"$(OUTDIR)\amaya.pdb" /machine:I386\
 /out:"$(OUTDIR)\amaya.exe" 
LINK32_OBJS= \
	"$(INTDIR)\AHTBridge.obj" \
	"$(INTDIR)\AHTEvntrg.obj" \
	"$(INTDIR)\AHTFWrite.obj" \
	"$(INTDIR)\AHTMemConv.obj" \
	"$(INTDIR)\AHTURLTools.obj" \
	"$(INTDIR)\amaya.res" \
	"$(INTDIR)\answer.obj" \
	"$(INTDIR)\css.obj" \
	"$(INTDIR)\EDITimage.obj" \
	"$(INTDIR)\EDITORactions.obj" \
	"$(INTDIR)\EDITORAPP.obj" \
	"$(INTDIR)\EDITstyle.obj" \
	"$(INTDIR)\html2thot.obj" \
	"$(INTDIR)\HTMLactions.obj" \
	"$(INTDIR)\HTMLAPP.obj" \
	"$(INTDIR)\HTMLbook.obj" \
	"$(INTDIR)\HTMLedit.obj" \
	"$(INTDIR)\HTMLform.obj" \
	"$(INTDIR)\HTMLhistory.obj" \
	"$(INTDIR)\HTMLimage.obj" \
	"$(INTDIR)\HTMLpresentation.obj" \
	"$(INTDIR)\HTMLsave.obj" \
	"$(INTDIR)\HTMLstyle.obj" \
	"$(INTDIR)\HTMLtable.obj" \
	"$(INTDIR)\init.obj" \
	"$(INTDIR)\javaamaya.obj" \
	"$(INTDIR)\Mathedit.obj" \
	"$(INTDIR)\MathMLAPP.obj" \
	"$(INTDIR)\p2css.obj" \
	"$(INTDIR)\query.obj" \
	"$(INTDIR)\tableH.obj" \
	"$(INTDIR)\trans.obj" \
	"$(INTDIR)\transparse.obj" \
	"$(INTDIR)\UIcss.obj" \
	"$(INTDIR)\windialogapi.obj" \
	".\Libjpeg.lib" \
	".\Libpng.lib" \
	".\LibThotEditor.lib" \
	".\libwww.lib"

"$(OUTDIR)\amaya.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"

OUTDIR=.\bin
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\.\bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\amaya.exe" "$(OUTDIR)\amaya.bsc"

!ELSE 

ALL : "libwww - Win32 Debug" "libpng - Win32 Debug" "libjpeg - Win32 Debug"\
 "LibThotEditor - Win32 Debug" "$(OUTDIR)\amaya.exe" "$(OUTDIR)\amaya.bsc"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"LibThotEditor - Win32 DebugCLEAN" "libjpeg - Win32 DebugCLEAN"\
 "libpng - Win32 DebugCLEAN" "libwww - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\AHTBridge.obj"
	-@erase "$(INTDIR)\AHTBridge.sbr"
	-@erase "$(INTDIR)\AHTEvntrg.obj"
	-@erase "$(INTDIR)\AHTEvntrg.sbr"
	-@erase "$(INTDIR)\AHTFWrite.obj"
	-@erase "$(INTDIR)\AHTFWrite.sbr"
	-@erase "$(INTDIR)\AHTMemConv.obj"
	-@erase "$(INTDIR)\AHTMemConv.sbr"
	-@erase "$(INTDIR)\AHTURLTools.obj"
	-@erase "$(INTDIR)\AHTURLTools.sbr"
	-@erase "$(INTDIR)\amaya.res"
	-@erase "$(INTDIR)\answer.obj"
	-@erase "$(INTDIR)\answer.sbr"
	-@erase "$(INTDIR)\css.obj"
	-@erase "$(INTDIR)\css.sbr"
	-@erase "$(INTDIR)\EDITimage.obj"
	-@erase "$(INTDIR)\EDITimage.sbr"
	-@erase "$(INTDIR)\EDITORactions.obj"
	-@erase "$(INTDIR)\EDITORactions.sbr"
	-@erase "$(INTDIR)\EDITORAPP.obj"
	-@erase "$(INTDIR)\EDITORAPP.sbr"
	-@erase "$(INTDIR)\EDITstyle.obj"
	-@erase "$(INTDIR)\EDITstyle.sbr"
	-@erase "$(INTDIR)\html2thot.obj"
	-@erase "$(INTDIR)\html2thot.sbr"
	-@erase "$(INTDIR)\HTMLactions.obj"
	-@erase "$(INTDIR)\HTMLactions.sbr"
	-@erase "$(INTDIR)\HTMLAPP.obj"
	-@erase "$(INTDIR)\HTMLAPP.sbr"
	-@erase "$(INTDIR)\HTMLbook.obj"
	-@erase "$(INTDIR)\HTMLbook.sbr"
	-@erase "$(INTDIR)\HTMLedit.obj"
	-@erase "$(INTDIR)\HTMLedit.sbr"
	-@erase "$(INTDIR)\HTMLform.obj"
	-@erase "$(INTDIR)\HTMLform.sbr"
	-@erase "$(INTDIR)\HTMLhistory.obj"
	-@erase "$(INTDIR)\HTMLhistory.sbr"
	-@erase "$(INTDIR)\HTMLimage.obj"
	-@erase "$(INTDIR)\HTMLimage.sbr"
	-@erase "$(INTDIR)\HTMLpresentation.obj"
	-@erase "$(INTDIR)\HTMLpresentation.sbr"
	-@erase "$(INTDIR)\HTMLsave.obj"
	-@erase "$(INTDIR)\HTMLsave.sbr"
	-@erase "$(INTDIR)\HTMLstyle.obj"
	-@erase "$(INTDIR)\HTMLstyle.sbr"
	-@erase "$(INTDIR)\HTMLtable.obj"
	-@erase "$(INTDIR)\HTMLtable.sbr"
	-@erase "$(INTDIR)\init.obj"
	-@erase "$(INTDIR)\init.sbr"
	-@erase "$(INTDIR)\javaamaya.obj"
	-@erase "$(INTDIR)\javaamaya.sbr"
	-@erase "$(INTDIR)\Mathedit.obj"
	-@erase "$(INTDIR)\Mathedit.sbr"
	-@erase "$(INTDIR)\MathMLAPP.obj"
	-@erase "$(INTDIR)\MathMLAPP.sbr"
	-@erase "$(INTDIR)\p2css.obj"
	-@erase "$(INTDIR)\p2css.sbr"
	-@erase "$(INTDIR)\query.obj"
	-@erase "$(INTDIR)\query.sbr"
	-@erase "$(INTDIR)\tableH.obj"
	-@erase "$(INTDIR)\tableH.sbr"
	-@erase "$(INTDIR)\trans.obj"
	-@erase "$(INTDIR)\trans.sbr"
	-@erase "$(INTDIR)\transparse.obj"
	-@erase "$(INTDIR)\transparse.sbr"
	-@erase "$(INTDIR)\UIcss.obj"
	-@erase "$(INTDIR)\UIcss.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(INTDIR)\windialogapi.obj"
	-@erase "$(INTDIR)\windialogapi.sbr"
	-@erase "$(OUTDIR)\amaya.bsc"
	-@erase "$(OUTDIR)\amaya.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /I ".\amaya" /I "..\thotlib\include" /I\
 "..\thotlib\internals\h" /I "..\thotlib\internals\var" /I\
 "..\thotlib\internals\f" /I "..\amaya\f" /I "..\w3c-libwww-5.0a\Library\src" /I\
 "..\libpng\zlib" /I "..\amaya" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "COUGAR"\
 /D "__STDC__" /D "WWW_WIN_ASYNC" /D "WWW_WIN_DLL" /D "SOCKS" /D "MATHML"\
 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\amaya.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"\
 /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.\Debug/

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\amaya.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\amaya.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\AHTBridge.sbr" \
	"$(INTDIR)\AHTEvntrg.sbr" \
	"$(INTDIR)\AHTFWrite.sbr" \
	"$(INTDIR)\AHTMemConv.sbr" \
	"$(INTDIR)\AHTURLTools.sbr" \
	"$(INTDIR)\answer.sbr" \
	"$(INTDIR)\css.sbr" \
	"$(INTDIR)\EDITimage.sbr" \
	"$(INTDIR)\EDITORactions.sbr" \
	"$(INTDIR)\EDITORAPP.sbr" \
	"$(INTDIR)\EDITstyle.sbr" \
	"$(INTDIR)\html2thot.sbr" \
	"$(INTDIR)\HTMLactions.sbr" \
	"$(INTDIR)\HTMLAPP.sbr" \
	"$(INTDIR)\HTMLbook.sbr" \
	"$(INTDIR)\HTMLedit.sbr" \
	"$(INTDIR)\HTMLform.sbr" \
	"$(INTDIR)\HTMLhistory.sbr" \
	"$(INTDIR)\HTMLimage.sbr" \
	"$(INTDIR)\HTMLpresentation.sbr" \
	"$(INTDIR)\HTMLsave.sbr" \
	"$(INTDIR)\HTMLstyle.sbr" \
	"$(INTDIR)\HTMLtable.sbr" \
	"$(INTDIR)\init.sbr" \
	"$(INTDIR)\javaamaya.sbr" \
	"$(INTDIR)\Mathedit.sbr" \
	"$(INTDIR)\MathMLAPP.sbr" \
	"$(INTDIR)\p2css.sbr" \
	"$(INTDIR)\query.sbr" \
	"$(INTDIR)\tableH.sbr" \
	"$(INTDIR)\trans.sbr" \
	"$(INTDIR)\transparse.sbr" \
	"$(INTDIR)\UIcss.sbr" \
	"$(INTDIR)\windialogapi.sbr"

"$(OUTDIR)\amaya.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib comctl32.lib wsock32.lib /nologo /subsystem:windows /profile\
 /debug /machine:I386 /out:"$(OUTDIR)\amaya.exe" 
LINK32_OBJS= \
	"$(INTDIR)\AHTBridge.obj" \
	"$(INTDIR)\AHTEvntrg.obj" \
	"$(INTDIR)\AHTFWrite.obj" \
	"$(INTDIR)\AHTMemConv.obj" \
	"$(INTDIR)\AHTURLTools.obj" \
	"$(INTDIR)\amaya.res" \
	"$(INTDIR)\answer.obj" \
	"$(INTDIR)\css.obj" \
	"$(INTDIR)\EDITimage.obj" \
	"$(INTDIR)\EDITORactions.obj" \
	"$(INTDIR)\EDITORAPP.obj" \
	"$(INTDIR)\EDITstyle.obj" \
	"$(INTDIR)\html2thot.obj" \
	"$(INTDIR)\HTMLactions.obj" \
	"$(INTDIR)\HTMLAPP.obj" \
	"$(INTDIR)\HTMLbook.obj" \
	"$(INTDIR)\HTMLedit.obj" \
	"$(INTDIR)\HTMLform.obj" \
	"$(INTDIR)\HTMLhistory.obj" \
	"$(INTDIR)\HTMLimage.obj" \
	"$(INTDIR)\HTMLpresentation.obj" \
	"$(INTDIR)\HTMLsave.obj" \
	"$(INTDIR)\HTMLstyle.obj" \
	"$(INTDIR)\HTMLtable.obj" \
	"$(INTDIR)\init.obj" \
	"$(INTDIR)\javaamaya.obj" \
	"$(INTDIR)\Mathedit.obj" \
	"$(INTDIR)\MathMLAPP.obj" \
	"$(INTDIR)\p2css.obj" \
	"$(INTDIR)\query.obj" \
	"$(INTDIR)\tableH.obj" \
	"$(INTDIR)\trans.obj" \
	"$(INTDIR)\transparse.obj" \
	"$(INTDIR)\UIcss.obj" \
	"$(INTDIR)\windialogapi.obj" \
	".\Libjpeg.lib" \
	".\Libpng.lib" \
	".\LibThotEditor.lib" \
	".\libwww.lib"

"$(OUTDIR)\amaya.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "amaya - Win32 Release" || "$(CFG)" == "amaya - Win32 Debug"
SOURCE=..\amaya\AHTBridge.c
DEP_CPP_AHTBR=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\AHTBridge_f.h"\
	"..\amaya\f\AHTFWrite_f.h"\
	"..\amaya\f\answer_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_AHTBR=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\AHTBridge.obj" : $(SOURCE) $(DEP_CPP_AHTBR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\AHTBridge.obj"	"$(INTDIR)\AHTBridge.sbr" : $(SOURCE)\
 $(DEP_CPP_AHTBR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\AHTEvntrg.c
DEP_CPP_AHTEV=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\AHTBridge_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_AHTEV=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\AHTEvntrg.obj" : $(SOURCE) $(DEP_CPP_AHTEV) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\AHTEvntrg.obj"	"$(INTDIR)\AHTEvntrg.sbr" : $(SOURCE)\
 $(DEP_CPP_AHTEV) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\AHTFWrite.c
DEP_CPP_AHTFW=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_AHTFW=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\AHTFWrite.obj" : $(SOURCE) $(DEP_CPP_AHTFW) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\AHTFWrite.obj"	"$(INTDIR)\AHTFWrite.sbr" : $(SOURCE)\
 $(DEP_CPP_AHTFW) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\AHTMemConv.c
DEP_CPP_AHTME=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\AHTMemConv_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_AHTME=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\AHTMemConv.obj" : $(SOURCE) $(DEP_CPP_AHTME) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\AHTMemConv.obj"	"$(INTDIR)\AHTMemConv.sbr" : $(SOURCE)\
 $(DEP_CPP_AHTME) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\AHTURLTools.c
DEP_CPP_AHTUR=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_AHTUR=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\AHTURLTools.obj" : $(SOURCE) $(DEP_CPP_AHTUR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\AHTURLTools.obj"	"$(INTDIR)\AHTURLTools.sbr" : $(SOURCE)\
 $(DEP_CPP_AHTUR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\amaya.rc
DEP_RSC_AMAYA=\
	"..\amaya\amaya.bmp"\
	"..\amaya\appicon.ico"\
	"..\amaya\bcenter.bmp"\
	"..\amaya\bindent1.bmp"\
	"..\amaya\bindent2.bmp"\
	"..\amaya\bleft.bmp"\
	"..\amaya\bright.bmp"\
	"..\amaya\bslarge.bmp"\
	"..\amaya\bsmedium.bmp"\
	"..\amaya\bssmall.bmp"\
	"..\amaya\div.bmp"\
	"..\amaya\down.bmp"\
	"..\amaya\gkey001.bmp"\
	"..\amaya\gkey002.bmp"\
	"..\amaya\gkey003.bmp"\
	"..\amaya\gkey004.bmp"\
	"..\amaya\gkey005.bmp"\
	"..\amaya\gkey006.bmp"\
	"..\amaya\gkey007.bmp"\
	"..\amaya\gkey008.bmp"\
	"..\amaya\gkey009.bmp"\
	"..\amaya\gkey010.bmp"\
	"..\amaya\gkey011.bmp"\
	"..\amaya\gkey012.bmp"\
	"..\amaya\gkey013.bmp"\
	"..\amaya\gkey014.bmp"\
	"..\amaya\gkey015.bmp"\
	"..\amaya\gkey016.bmp"\
	"..\amaya\gkey017.bmp"\
	"..\amaya\gkey018.bmp"\
	"..\amaya\gkey019.bmp"\
	"..\amaya\gkey020.bmp"\
	"..\amaya\gkey021.bmp"\
	"..\amaya\gkey022.bmp"\
	"..\amaya\gkey023.bmp"\
	"..\amaya\gkey024.bmp"\
	"..\amaya\gkey025.bmp"\
	"..\amaya\gkey026.bmp"\
	"..\amaya\gkey027.bmp"\
	"..\amaya\gkey028.bmp"\
	"..\amaya\gkey029.bmp"\
	"..\amaya\gkey030.bmp"\
	"..\amaya\gkey031.bmp"\
	"..\amaya\gkey032.bmp"\
	"..\amaya\gkey033.bmp"\
	"..\amaya\gkey034.bmp"\
	"..\amaya\gkey035.bmp"\
	"..\amaya\gkey036.bmp"\
	"..\amaya\gkey037.bmp"\
	"..\amaya\gkey038.bmp"\
	"..\amaya\gkey039.bmp"\
	"..\amaya\gkey040.bmp"\
	"..\amaya\gkey041.bmp"\
	"..\amaya\gkey042.bmp"\
	"..\amaya\gkey043.bmp"\
	"..\amaya\gkey044.bmp"\
	"..\amaya\gkey045.bmp"\
	"..\amaya\gkey046.bmp"\
	"..\amaya\gkey047.bmp"\
	"..\amaya\gkey048.bmp"\
	"..\amaya\gkey049.bmp"\
	"..\amaya\gkey050.bmp"\
	"..\amaya\gkey051.bmp"\
	"..\amaya\gkey052.bmp"\
	"..\amaya\gkey053.bmp"\
	"..\amaya\gkey054.bmp"\
	"..\amaya\gkey055.bmp"\
	"..\amaya\gkey056.bmp"\
	"..\amaya\gkey057.bmp"\
	"..\amaya\gkey058.bmp"\
	"..\amaya\gkey059.bmp"\
	"..\amaya\gkey060.bmp"\
	"..\amaya\gkey061.bmp"\
	"..\amaya\gkey062.bmp"\
	"..\amaya\gkey063.bmp"\
	"..\amaya\gkey064.bmp"\
	"..\amaya\gkey065.bmp"\
	"..\amaya\gkey066.bmp"\
	"..\amaya\gkey067.bmp"\
	"..\amaya\gkey068.bmp"\
	"..\amaya\gkey069.bmp"\
	"..\amaya\gkey070.bmp"\
	"..\amaya\gkey071.bmp"\
	"..\amaya\gkey072.bmp"\
	"..\amaya\gkey073.bmp"\
	"..\amaya\gkey074.bmp"\
	"..\amaya\gkey075.bmp"\
	"..\amaya\gkey076.bmp"\
	"..\amaya\gkey077.bmp"\
	"..\amaya\gkey078.bmp"\
	"..\amaya\gkey079.bmp"\
	"..\amaya\gkey080.bmp"\
	"..\amaya\gkey081.bmp"\
	"..\amaya\gkey082.bmp"\
	"..\amaya\gkey083.bmp"\
	"..\amaya\gkey084.bmp"\
	"..\amaya\gkey085.bmp"\
	"..\amaya\gkey086.bmp"\
	"..\amaya\gkey087.bmp"\
	"..\amaya\gkey088.bmp"\
	"..\amaya\gkey089.bmp"\
	"..\amaya\gkey090.bmp"\
	"..\amaya\gkey091.bmp"\
	"..\amaya\gkey092.bmp"\
	"..\amaya\gkey093.bmp"\
	"..\amaya\gkey094.bmp"\
	"..\amaya\gkey095.bmp"\
	"..\amaya\gkey096.bmp"\
	"..\amaya\gkey097.bmp"\
	"..\amaya\gkey098.bmp"\
	"..\amaya\gkey099.bmp"\
	"..\amaya\gkey100.bmp"\
	"..\amaya\gkey101.bmp"\
	"..\amaya\gkey102.bmp"\
	"..\amaya\gkey103.bmp"\
	"..\amaya\gkey104.bmp"\
	"..\amaya\gkey105.bmp"\
	"..\amaya\gkey106.bmp"\
	"..\amaya\gkey107.bmp"\
	"..\amaya\gkey108.bmp"\
	"..\amaya\gkey109.bmp"\
	"..\amaya\gkey110.bmp"\
	"..\amaya\gkey111.bmp"\
	"..\amaya\gkey112.bmp"\
	"..\amaya\gkey113.bmp"\
	"..\amaya\gkey114.bmp"\
	"..\amaya\gkey115.bmp"\
	"..\amaya\gkey116.bmp"\
	"..\amaya\gkey117.bmp"\
	"..\amaya\gkey118.bmp"\
	"..\amaya\gkey119.bmp"\
	"..\amaya\gkey120.bmp"\
	"..\amaya\gkey121.bmp"\
	"..\amaya\gkey122.bmp"\
	"..\amaya\gkey123.bmp"\
	"..\amaya\gkey124.bmp"\
	"..\amaya\gkey125.bmp"\
	"..\amaya\gkey126.bmp"\
	"..\amaya\gkey127.bmp"\
	"..\amaya\gkey128.bmp"\
	"..\amaya\gkey129.bmp"\
	"..\amaya\gkey130.bmp"\
	"..\amaya\gkey131.bmp"\
	"..\amaya\gkey132.bmp"\
	"..\amaya\gkey133.bmp"\
	"..\amaya\gkey134.bmp"\
	"..\amaya\gkey135.bmp"\
	"..\amaya\gkey136.bmp"\
	"..\amaya\gkey137.bmp"\
	"..\amaya\gkey138.bmp"\
	"..\amaya\gkey139.bmp"\
	"..\amaya\gkey140.bmp"\
	"..\amaya\gkey141.bmp"\
	"..\amaya\gkey142.bmp"\
	"..\amaya\gkey143.bmp"\
	"..\amaya\gkey144.bmp"\
	"..\amaya\gkey145.bmp"\
	"..\amaya\gkey146.bmp"\
	"..\amaya\gkey147.bmp"\
	"..\amaya\gkey148.bmp"\
	"..\amaya\gkey149.bmp"\
	"..\amaya\gkey150.bmp"\
	"..\amaya\gkey151.bmp"\
	"..\amaya\gkey152.bmp"\
	"..\amaya\gkey153.bmp"\
	"..\amaya\gkey154.bmp"\
	"..\amaya\gkey155.bmp"\
	"..\amaya\gkey156.bmp"\
	"..\amaya\gkey157.bmp"\
	"..\amaya\gkey158.bmp"\
	"..\amaya\gkey159.bmp"\
	"..\amaya\gkey160.bmp"\
	"..\amaya\ind.bmp"\
	"..\amaya\math.bmp"\
	"..\amaya\mathd.bmp"\
	"..\amaya\parexp.bmp"\
	"..\amaya\pow.bmp"\
	"..\amaya\powind.bmp"\
	"..\amaya\root.bmp"\
	"..\amaya\sroot.bmp"\
	"..\amaya\sym.bmp"\
	"..\amaya\toolbar1.bmp"\
	"..\amaya\udlr.bmp"\
	"..\amaya\up.bmp"\
	"..\amaya\updn.bmp"\
	"..\amaya\wincurso.cur"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\amaya.res" : $(SOURCE) $(DEP_RSC_AMAYA) "$(INTDIR)"
	$(RSC) /l 0x40c /fo"$(INTDIR)\amaya.res" /i "\users\guetari\opera\amaya" /i\
 "E:\users\guetari\opera\amaya" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\amaya.res" : $(SOURCE) $(DEP_RSC_AMAYA) "$(INTDIR)"
	$(RSC) /l 0x40c /fo"$(INTDIR)\amaya.res" /i "\users\guetari\opera\amaya" /i\
 "E:\users\guetari\opera\amaya" /d "_DEBUG" $(SOURCE)


!ENDIF 

SOURCE=..\amaya\answer.c
DEP_CPP_ANSWE=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_ANSWE=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\answer.obj" : $(SOURCE) $(DEP_CPP_ANSWE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\answer.obj"	"$(INTDIR)\answer.sbr" : $(SOURCE) $(DEP_CPP_ANSWE)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\css.c
DEP_CPP_CSS_C=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\f\p2css_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\f\UIcss_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_CSS_C=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\css.obj" : $(SOURCE) $(DEP_CPP_CSS_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\css.obj"	"$(INTDIR)\css.sbr" : $(SOURCE) $(DEP_CPP_CSS_C)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\EDITimage.c
DEP_CPP_EDITI=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\EDITimage_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLedit_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLpresentation_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_EDITI=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\EDITimage.obj" : $(SOURCE) $(DEP_CPP_EDITI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\EDITimage.obj"	"$(INTDIR)\EDITimage.sbr" : $(SOURCE)\
 $(DEP_CPP_EDITI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\EDITORactions.c
DEP_CPP_EDITO=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\EDITORactions_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLedit_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_EDITO=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\EDITORactions.obj" : $(SOURCE) $(DEP_CPP_EDITO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\EDITORactions.obj"	"$(INTDIR)\EDITORactions.sbr" : $(SOURCE)\
 $(DEP_CPP_EDITO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\amaya\EDITORAPP.c

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\EDITORAPP.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\EDITORAPP.obj"	"$(INTDIR)\EDITORAPP.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\EDITstyle.c
DEP_CPP_EDITS=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLpresentation_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\UIcss_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_EDITS=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\EDITstyle.obj" : $(SOURCE) $(DEP_CPP_EDITS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\EDITstyle.obj"	"$(INTDIR)\EDITstyle.sbr" : $(SOURCE)\
 $(DEP_CPP_EDITS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\html2thot.c
DEP_CPP_HTML2=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLedit_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\HTMLtable_f.h"\
	"..\amaya\f\Mathedit_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\libpng\zlib\zconf.h"\
	"..\libpng\zlib\zlib.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTML2=\
	"..\amaya\EDITOR.h"\
	"..\amaya\MathML.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\html2thot.obj" : $(SOURCE) $(DEP_CPP_HTML2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\html2thot.obj"	"$(INTDIR)\html2thot.sbr" : $(SOURCE)\
 $(DEP_CPP_HTML2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLactions.c
DEP_CPP_HTMLA=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\EDITimage_f.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLedit_f.h"\
	"..\amaya\f\HTMLform_f.h"\
	"..\amaya\f\HTMLhistory_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\f\trans_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLA=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLactions.obj" : $(SOURCE) $(DEP_CPP_HTMLA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLactions.obj"	"$(INTDIR)\HTMLactions.sbr" : $(SOURCE)\
 $(DEP_CPP_HTMLA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\amaya\HTMLAPP.c

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLAPP.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLAPP.obj"	"$(INTDIR)\HTMLAPP.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLbook.c
DEP_CPP_HTMLB=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLbook_f.h"\
	"..\amaya\f\HTMLedit_f.h"\
	"..\amaya\f\HTMLhistory_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\print.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLB=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLbook.obj" : $(SOURCE) $(DEP_CPP_HTMLB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLbook.obj"	"$(INTDIR)\HTMLbook.sbr" : $(SOURCE) $(DEP_CPP_HTMLB)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLedit.c
DEP_CPP_HTMLE=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\EDITimage_f.h"\
	"..\amaya\f\EDITORactions_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLedit_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLpresentation_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLE=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLedit.obj" : $(SOURCE) $(DEP_CPP_HTMLE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLedit.obj"	"$(INTDIR)\HTMLedit.sbr" : $(SOURCE) $(DEP_CPP_HTMLE)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLform.c
DEP_CPP_HTMLF=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLform_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLF=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLform.obj" : $(SOURCE) $(DEP_CPP_HTMLF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLform.obj"	"$(INTDIR)\HTMLform.sbr" : $(SOURCE) $(DEP_CPP_HTMLF)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLhistory.c
DEP_CPP_HTMLH=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\HTMLhistory_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLH=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLhistory.obj" : $(SOURCE) $(DEP_CPP_HTMLH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLhistory.obj"	"$(INTDIR)\HTMLhistory.sbr" : $(SOURCE)\
 $(DEP_CPP_HTMLH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLimage.c
DEP_CPP_HTMLI=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\EDITimage_f.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLedit_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLI=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLimage.obj" : $(SOURCE) $(DEP_CPP_HTMLI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLimage.obj"	"$(INTDIR)\HTMLimage.sbr" : $(SOURCE)\
 $(DEP_CPP_HTMLI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLpresentation.c
DEP_CPP_HTMLP=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\EDITstyle_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLP=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLpresentation.obj" : $(SOURCE) $(DEP_CPP_HTMLP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLpresentation.obj"	"$(INTDIR)\HTMLpresentation.sbr" : $(SOURCE)\
 $(DEP_CPP_HTMLP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLsave.c
DEP_CPP_HTMLS=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\EDITimage_f.h"\
	"..\amaya\f\HTMLbook_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLsave_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLS=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLsave.obj" : $(SOURCE) $(DEP_CPP_HTMLS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLsave.obj"	"$(INTDIR)\HTMLsave.sbr" : $(SOURCE) $(DEP_CPP_HTMLS)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLstyle.c
DEP_CPP_HTMLST=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLpresentation_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\UIcss_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\HTMLstyleColor.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLST=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLstyle.obj" : $(SOURCE) $(DEP_CPP_HTMLST) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLstyle.obj"	"$(INTDIR)\HTMLstyle.sbr" : $(SOURCE)\
 $(DEP_CPP_HTMLST) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\HTMLtable.c
DEP_CPP_HTMLT=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_HTMLT=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\HTMLtable.obj" : $(SOURCE) $(DEP_CPP_HTMLT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\HTMLtable.obj"	"$(INTDIR)\HTMLtable.sbr" : $(SOURCE)\
 $(DEP_CPP_HTMLT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\init.c
DEP_CPP_INIT_=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\B.xpm"\
	"..\amaya\Back.xpm"\
	"..\amaya\BackNo.xpm"\
	"..\amaya\Bullet.xpm"\
	"..\amaya\css.h"\
	"..\amaya\css.xpm"\
	"..\amaya\DL.xpm"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\EDITimage_f.h"\
	"..\amaya\f\EDITORactions_f.h"\
	"..\amaya\f\EDITstyle_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLactions_f.h"\
	"..\amaya\f\HTMLbook_f.h"\
	"..\amaya\f\HTMLedit_f.h"\
	"..\amaya\f\HTMLhistory_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLsave_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\f\javaamaya_f.h"\
	"..\amaya\f\Mathedit_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\f\trans_f.h"\
	"..\amaya\f\UIcss_f.h"\
	"..\amaya\find.xpm"\
	"..\amaya\Forward.xpm"\
	"..\amaya\ForwardNo.xpm"\
	"..\amaya\H1.xpm"\
	"..\amaya\H2.xpm"\
	"..\amaya\H3.xpm"\
	"..\amaya\HTML.h"\
	"..\amaya\I.xpm"\
	"..\amaya\Image.xpm"\
	"..\amaya\Java.xpm"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\amaya\Link.xpm"\
	"..\amaya\Num.xpm"\
	"..\amaya\Plugin.xpm"\
	"..\amaya\Print.xpm"\
	"..\amaya\Reload.xpm"\
	"..\amaya\save.xpm"\
	"..\amaya\stopN.xpm"\
	"..\amaya\stopR.xpm"\
	"..\amaya\T.xpm"\
	"..\amaya\Table.xpm"\
	"..\amaya\trans.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\plugin.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_INIT_=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\init.obj" : $(SOURCE) $(DEP_CPP_INIT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\init.obj"	"$(INTDIR)\init.sbr" : $(SOURCE) $(DEP_CPP_INIT_)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\javaamaya.c
DEP_CPP_JAVAA=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\EDITstyle_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\init_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\javaamaya.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_JAVAA=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\javaamaya.obj" : $(SOURCE) $(DEP_CPP_JAVAA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\javaamaya.obj"	"$(INTDIR)\javaamaya.sbr" : $(SOURCE)\
 $(DEP_CPP_JAVAA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\Mathedit.c
DEP_CPP_MATHE=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\fence.xpm"\
	"..\amaya\frac.xpm"\
	"..\amaya\greek.xpm"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\amaya\Math.xpm"\
	"..\amaya\mathdisp.xpm"\
	"..\amaya\mscript.xpm"\
	"..\amaya\over.xpm"\
	"..\amaya\overunder.xpm"\
	"..\amaya\root.xpm"\
	"..\amaya\sqrt.xpm"\
	"..\amaya\sub.xpm"\
	"..\amaya\subsup.xpm"\
	"..\amaya\sup.xpm"\
	"..\amaya\trans.h"\
	"..\amaya\under.xpm"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_MATHE=\
	"..\amaya\EDITOR.h"\
	"..\amaya\MathML.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\Mathedit.obj" : $(SOURCE) $(DEP_CPP_MATHE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\Mathedit.obj"	"$(INTDIR)\Mathedit.sbr" : $(SOURCE) $(DEP_CPP_MATHE)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\amaya\MathMLAPP.c

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\MathMLAPP.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\MathMLAPP.obj"	"$(INTDIR)\MathMLAPP.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\p2css.c
DEP_CPP_P2CSS=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\HTMLstyle_f.h"\
	"..\amaya\f\p2css_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_P2CSS=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\p2css.obj" : $(SOURCE) $(DEP_CPP_P2CSS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\p2css.obj"	"$(INTDIR)\p2css.sbr" : $(SOURCE) $(DEP_CPP_P2CSS)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\query.c
DEP_CPP_QUERY=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\AHTBridge_f.h"\
	"..\amaya\f\AHTFWrite_f.h"\
	"..\amaya\f\AHTMemConv_f.h"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\answer_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_QUERY=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\query.obj" : $(SOURCE) $(DEP_CPP_QUERY) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\query.obj"	"$(INTDIR)\query.sbr" : $(SOURCE) $(DEP_CPP_QUERY)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\tablelib\tableH.c
DEP_CPP_TABLE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxrelations_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_TABLE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\tableH.obj" : $(SOURCE) $(DEP_CPP_TABLE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\tableH.obj"	"$(INTDIR)\tableH.sbr" : $(SOURCE) $(DEP_CPP_TABLE)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\trans.c
DEP_CPP_TRANS=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\HTMLimage_f.h"\
	"..\amaya\f\transparse_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\amaya\trans.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_TRANS=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\trans.obj" : $(SOURCE) $(DEP_CPP_TRANS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\trans.obj"	"$(INTDIR)\trans.sbr" : $(SOURCE) $(DEP_CPP_TRANS)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\transparse.c
DEP_CPP_TRANSP=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\f\html2thot_f.h"\
	"..\amaya\f\transparse_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\amaya\trans.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_TRANSP=\
	"..\amaya\EDITOR.h"\
	"..\amaya\parser.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\transparse.obj" : $(SOURCE) $(DEP_CPP_TRANSP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\transparse.obj"	"$(INTDIR)\transparse.sbr" : $(SOURCE)\
 $(DEP_CPP_TRANSP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\UIcss.c
DEP_CPP_UICSS=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\css.h"\
	"..\amaya\destroy.xpm"\
	"..\amaya\f\AHTURLTools_f.h"\
	"..\amaya\f\css_f.h"\
	"..\amaya\f\p2css_f.h"\
	"..\amaya\f\query_f.h"\
	"..\amaya\f\UIcss_f.h"\
	"..\amaya\HTML.h"\
	"..\amaya\lcopy.xpm"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\amaya\lmerge.xpm"\
	"..\amaya\rcopy.xpm"\
	"..\amaya\rmerge.xpm"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\genericdriver.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_UICSS=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\UIcss.obj" : $(SOURCE) $(DEP_CPP_UICSS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\UIcss.obj"	"$(INTDIR)\UIcss.sbr" : $(SOURCE) $(DEP_CPP_UICSS)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\amaya\windialogapi.c
DEP_CPP_WINDI=\
	"..\amaya\amaya.h"\
	"..\amaya\amayamsg.h"\
	"..\amaya\HTML.h"\
	"..\amaya\libilu.h"\
	"..\amaya\libjava.h"\
	"..\amaya\libwww.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\browser.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\reference.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAABrow.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAAUtil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAccess.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAlert.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAnchor.h"\
	"..\w3c-libwww-5.0a\Library\src\HTAncMan.h"\
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
	"..\w3c-libwww-5.0a\Library\src\HTMIMPrs.h"\
	"..\w3c-libwww-5.0a\Library\src\HTML.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLGen.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMLPDTD.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulpar.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMulti.h"\
	"..\w3c-libwww-5.0a\Library\src\HTMux.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNet.h"\
	"..\w3c-libwww-5.0a\Library\src\HTNetMan.h"\
	"..\w3c-libwww-5.0a\Library\src\HTParse.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPEP.h"\
	"..\w3c-libwww-5.0a\Library\src\HTPlain.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProfil.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProt.h"\
	"..\w3c-libwww-5.0a\Library\src\HTProxy.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReader.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReq.h"\
	"..\w3c-libwww-5.0a\Library\src\HTReqMan.h"\
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
	
NODEP_CPP_WINDI=\
	"..\amaya\EDITOR.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\HTVMSUtils.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWFTP.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWGophe.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWNews.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWTelnt.h"\
	"..\w3c-libwww-5.0a\Library\src\WWWWAIS.h"\
	

!IF  "$(CFG)" == "amaya - Win32 Release"


"$(INTDIR)\windialogapi.obj" : $(SOURCE) $(DEP_CPP_WINDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"


"$(INTDIR)\windialogapi.obj"	"$(INTDIR)\windialogapi.sbr" : $(SOURCE)\
 $(DEP_CPP_WINDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

!IF  "$(CFG)" == "amaya - Win32 Release"

"LibThotEditor - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F .\LibThotEditor.mak\
 CFG="LibThotEditor - Win32 Release" 
   cd "."

"LibThotEditor - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\LibThotEditor.mak\
 CFG="LibThotEditor - Win32 Release" RECURSE=1 
   cd "."

!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"

"LibThotEditor - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F .\LibThotEditor.mak\
 CFG="LibThotEditor - Win32 Debug" 
   cd "."

"LibThotEditor - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\LibThotEditor.mak\
 CFG="LibThotEditor - Win32 Debug" RECURSE=1 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "amaya - Win32 Release"

"libjpeg - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F .\libjpeg.mak CFG="libjpeg - Win32 Release" 
   cd "."

"libjpeg - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\libjpeg.mak CFG="libjpeg - Win32 Release"\
 RECURSE=1 
   cd "."

!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"

"libjpeg - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F .\libjpeg.mak CFG="libjpeg - Win32 Debug" 
   cd "."

"libjpeg - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\libjpeg.mak CFG="libjpeg - Win32 Debug"\
 RECURSE=1 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "amaya - Win32 Release"

"libpng - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F .\libpng.mak CFG="libpng - Win32 Release" 
   cd "."

"libpng - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\libpng.mak CFG="libpng - Win32 Release"\
 RECURSE=1 
   cd "."

!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"

"libpng - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F .\libpng.mak CFG="libpng - Win32 Debug" 
   cd "."

"libpng - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\libpng.mak CFG="libpng - Win32 Debug"\
 RECURSE=1 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "amaya - Win32 Release"

"libwww - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F .\libwww.mak CFG="libwww - Win32 Release" 
   cd "."

"libwww - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\libwww.mak CFG="libwww - Win32 Release"\
 RECURSE=1 
   cd "."

!ELSEIF  "$(CFG)" == "amaya - Win32 Debug"

"libwww - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F .\libwww.mak CFG="libwww - Win32 Debug" 
   cd "."

"libwww - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\libwww.mak CFG="libwww - Win32 Debug"\
 RECURSE=1 
   cd "."

!ENDIF 


!ENDIF 

