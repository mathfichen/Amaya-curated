# Microsoft Developer Studio Generated NMAKE File, Based on LibThotEditor.dsp
!IF "$(CFG)" == ""
CFG=LibThotEditor - Win32 Release
!MESSAGE No configuration specified. Defaulting to LibThotEditor - Win32\
 Release.
!ENDIF 

!IF "$(CFG)" != "LibThotEditor - Win32 Release" && "$(CFG)" !=\
 "LibThotEditor - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "LibThotEditor.mak" CFG="LibThotEditor - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "LibThotEditor - Win32 Release" (based on\
 "Win32 (x86) Static Library")
!MESSAGE "LibThotEditor - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "LibThotEditor - Win32 Release"

OUTDIR=.\.
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\.
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\LibThotEditor.lib"

!ELSE 

ALL : "$(OUTDIR)\LibThotEditor.lib"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\Absboxes.obj"
	-@erase "$(INTDIR)\abspictures.obj"
	-@erase "$(INTDIR)\Actions.obj"
	-@erase "$(INTDIR)\Alloca.obj"
	-@erase "$(INTDIR)\appdialogue.obj"
	-@erase "$(INTDIR)\Appli.obj"
	-@erase "$(INTDIR)\applicationapi.obj"
	-@erase "$(INTDIR)\attributeapi.obj"
	-@erase "$(INTDIR)\attributes.obj"
	-@erase "$(INTDIR)\Attrmenu.obj"
	-@erase "$(INTDIR)\attrpresent.obj"
	-@erase "$(INTDIR)\boxlocate.obj"
	-@erase "$(INTDIR)\Boxmoves.obj"
	-@erase "$(INTDIR)\boxparams.obj"
	-@erase "$(INTDIR)\boxpositions.obj"
	-@erase "$(INTDIR)\boxrelations.obj"
	-@erase "$(INTDIR)\boxselection.obj"
	-@erase "$(INTDIR)\Browser.obj"
	-@erase "$(INTDIR)\buildboxes.obj"
	-@erase "$(INTDIR)\buildlines.obj"
	-@erase "$(INTDIR)\Callback.obj"
	-@erase "$(INTDIR)\callbackinit.obj"
	-@erase "$(INTDIR)\changeabsbox.obj"
	-@erase "$(INTDIR)\changepresent.obj"
	-@erase "$(INTDIR)\checkaccess.obj"
	-@erase "$(INTDIR)\checkermenu.obj"
	-@erase "$(INTDIR)\Closedoc.obj"
	-@erase "$(INTDIR)\Colors.obj"
	-@erase "$(INTDIR)\Config.obj"
	-@erase "$(INTDIR)\Content.obj"
	-@erase "$(INTDIR)\contentapi.obj"
	-@erase "$(INTDIR)\Context.obj"
	-@erase "$(INTDIR)\createabsbox.obj"
	-@erase "$(INTDIR)\createdoc.obj"
	-@erase "$(INTDIR)\createpages.obj"
	-@erase "$(INTDIR)\creationmenu.obj"
	-@erase "$(INTDIR)\dialogapi.obj"
	-@erase "$(INTDIR)\dictionary.obj"
	-@erase "$(INTDIR)\displaybox.obj"
	-@erase "$(INTDIR)\displayselect.obj"
	-@erase "$(INTDIR)\Docs.obj"
	-@erase "$(INTDIR)\documentapi.obj"
	-@erase "$(INTDIR)\Draw.obj"
	-@erase "$(INTDIR)\editcommands.obj"
	-@erase "$(INTDIR)\epshandler.obj"
	-@erase "$(INTDIR)\exceptions.obj"
	-@erase "$(INTDIR)\externalref.obj"
	-@erase "$(INTDIR)\extprintmenu.obj"
	-@erase "$(INTDIR)\fileaccess.obj"
	-@erase "$(INTDIR)\Font.obj"
	-@erase "$(INTDIR)\Frame.obj"
	-@erase "$(INTDIR)\genericdriver.obj"
	-@erase "$(INTDIR)\Geom.obj"
	-@erase "$(INTDIR)\gifhandler.obj"
	-@erase "$(INTDIR)\Hyphen.obj"
	-@erase "$(INTDIR)\inites.obj"
	-@erase "$(INTDIR)\Input.obj"
	-@erase "$(INTDIR)\interface.obj"
	-@erase "$(INTDIR)\jpeghandler.obj"
	-@erase "$(INTDIR)\keyboards.obj"
	-@erase "$(INTDIR)\labelalloc.obj"
	-@erase "$(INTDIR)\Language.obj"
	-@erase "$(INTDIR)\LiteClue.obj"
	-@erase "$(INTDIR)\Lookup.obj"
	-@erase "$(INTDIR)\Memory.obj"
	-@erase "$(INTDIR)\Message.obj"
	-@erase "$(INTDIR)\modiftype.obj"
	-@erase "$(INTDIR)\Opendoc.obj"
	-@erase "$(INTDIR)\Openview.obj"
	-@erase "$(INTDIR)\pagecommands.obj"
	-@erase "$(INTDIR)\Paginate.obj"
	-@erase "$(INTDIR)\Picture.obj"
	-@erase "$(INTDIR)\pictureapi.obj"
	-@erase "$(INTDIR)\picturebase.obj"
	-@erase "$(INTDIR)\picturemenu.obj"
	-@erase "$(INTDIR)\Pivot.obj"
	-@erase "$(INTDIR)\Platform.obj"
	-@erase "$(INTDIR)\pnghandler.obj"
	-@erase "$(INTDIR)\presentationapi.obj"
	-@erase "$(INTDIR)\presentdriver.obj"
	-@erase "$(INTDIR)\presentmenu.obj"
	-@erase "$(INTDIR)\presrules.obj"
	-@erase "$(INTDIR)\presvariables.obj"
	-@erase "$(INTDIR)\printmenu.obj"
	-@erase "$(INTDIR)\pschemaapi.obj"
	-@erase "$(INTDIR)\Quit.obj"
	-@erase "$(INTDIR)\readpivot.obj"
	-@erase "$(INTDIR)\Readprs.obj"
	-@erase "$(INTDIR)\Readstr.obj"
	-@erase "$(INTDIR)\Readtra.obj"
	-@erase "$(INTDIR)\referenceapi.obj"
	-@erase "$(INTDIR)\references.obj"
	-@erase "$(INTDIR)\Registry.obj"
	-@erase "$(INTDIR)\Res.obj"
	-@erase "$(INTDIR)\Resgen.obj"
	-@erase "$(INTDIR)\Resmatch.obj"
	-@erase "$(INTDIR)\Savedoc.obj"
	-@erase "$(INTDIR)\Schemas.obj"
	-@erase "$(INTDIR)\Schtrad.obj"
	-@erase "$(INTDIR)\Scroll.obj"
	-@erase "$(INTDIR)\Search.obj"
	-@erase "$(INTDIR)\searchmenu.obj"
	-@erase "$(INTDIR)\searchmenustr.obj"
	-@erase "$(INTDIR)\searchref.obj"
	-@erase "$(INTDIR)\selectionapi.obj"
	-@erase "$(INTDIR)\specificdriver.obj"
	-@erase "$(INTDIR)\spellchecker.obj"
	-@erase "$(INTDIR)\structchange.obj"
	-@erase "$(INTDIR)\structcommands.obj"
	-@erase "$(INTDIR)\structcreation.obj"
	-@erase "$(INTDIR)\structlist.obj"
	-@erase "$(INTDIR)\structlocate.obj"
	-@erase "$(INTDIR)\structmodif.obj"
	-@erase "$(INTDIR)\structschema.obj"
	-@erase "$(INTDIR)\structselect.obj"
	-@erase "$(INTDIR)\textcommands.obj"
	-@erase "$(INTDIR)\Thotmsg.obj"
	-@erase "$(INTDIR)\translation.obj"
	-@erase "$(INTDIR)\Tree.obj"
	-@erase "$(INTDIR)\Treeapi.obj"
	-@erase "$(INTDIR)\Units.obj"
	-@erase "$(INTDIR)\unstructchange.obj"
	-@erase "$(INTDIR)\unstructlocate.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\Viewapi.obj"
	-@erase "$(INTDIR)\viewcommands.obj"
	-@erase "$(INTDIR)\Views.obj"
	-@erase "$(INTDIR)\visibility.obj"
	-@erase "$(INTDIR)\windowdisplay.obj"
	-@erase "$(INTDIR)\Word.obj"
	-@erase "$(INTDIR)\writepivot.obj"
	-@erase "$(INTDIR)\xbmhandler.obj"
	-@erase "$(INTDIR)\xpmhandler.obj"
	-@erase "$(INTDIR)\Zoom.obj"
	-@erase "$(OUTDIR)\LibThotEditor.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /I "..\thotlib\include" /I\
 "..\thotlib\internals\h" /I "..\thotlib\internals\var" /I\
 "..\thotlib\internals\f" /I "..\libjpeg" /I "..\libpng" /I "..\libpng\zlib" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "__STDC__" /D "STDC_HEADERS"\
 /Fp"$(INTDIR)\LibThotEditor.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\LibThotEditor.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\LibThotEditor.lib" 
LIB32_OBJS= \
	"$(INTDIR)\Absboxes.obj" \
	"$(INTDIR)\abspictures.obj" \
	"$(INTDIR)\Actions.obj" \
	"$(INTDIR)\Alloca.obj" \
	"$(INTDIR)\appdialogue.obj" \
	"$(INTDIR)\Appli.obj" \
	"$(INTDIR)\applicationapi.obj" \
	"$(INTDIR)\attributeapi.obj" \
	"$(INTDIR)\attributes.obj" \
	"$(INTDIR)\Attrmenu.obj" \
	"$(INTDIR)\attrpresent.obj" \
	"$(INTDIR)\boxlocate.obj" \
	"$(INTDIR)\Boxmoves.obj" \
	"$(INTDIR)\boxparams.obj" \
	"$(INTDIR)\boxpositions.obj" \
	"$(INTDIR)\boxrelations.obj" \
	"$(INTDIR)\boxselection.obj" \
	"$(INTDIR)\Browser.obj" \
	"$(INTDIR)\buildboxes.obj" \
	"$(INTDIR)\buildlines.obj" \
	"$(INTDIR)\Callback.obj" \
	"$(INTDIR)\callbackinit.obj" \
	"$(INTDIR)\changeabsbox.obj" \
	"$(INTDIR)\changepresent.obj" \
	"$(INTDIR)\checkaccess.obj" \
	"$(INTDIR)\checkermenu.obj" \
	"$(INTDIR)\Closedoc.obj" \
	"$(INTDIR)\Colors.obj" \
	"$(INTDIR)\Config.obj" \
	"$(INTDIR)\Content.obj" \
	"$(INTDIR)\contentapi.obj" \
	"$(INTDIR)\Context.obj" \
	"$(INTDIR)\createabsbox.obj" \
	"$(INTDIR)\createdoc.obj" \
	"$(INTDIR)\createpages.obj" \
	"$(INTDIR)\creationmenu.obj" \
	"$(INTDIR)\dialogapi.obj" \
	"$(INTDIR)\dictionary.obj" \
	"$(INTDIR)\displaybox.obj" \
	"$(INTDIR)\displayselect.obj" \
	"$(INTDIR)\Docs.obj" \
	"$(INTDIR)\documentapi.obj" \
	"$(INTDIR)\Draw.obj" \
	"$(INTDIR)\editcommands.obj" \
	"$(INTDIR)\epshandler.obj" \
	"$(INTDIR)\exceptions.obj" \
	"$(INTDIR)\externalref.obj" \
	"$(INTDIR)\extprintmenu.obj" \
	"$(INTDIR)\fileaccess.obj" \
	"$(INTDIR)\Font.obj" \
	"$(INTDIR)\Frame.obj" \
	"$(INTDIR)\genericdriver.obj" \
	"$(INTDIR)\Geom.obj" \
	"$(INTDIR)\gifhandler.obj" \
	"$(INTDIR)\Hyphen.obj" \
	"$(INTDIR)\inites.obj" \
	"$(INTDIR)\Input.obj" \
	"$(INTDIR)\interface.obj" \
	"$(INTDIR)\jpeghandler.obj" \
	"$(INTDIR)\keyboards.obj" \
	"$(INTDIR)\labelalloc.obj" \
	"$(INTDIR)\Language.obj" \
	"$(INTDIR)\LiteClue.obj" \
	"$(INTDIR)\Lookup.obj" \
	"$(INTDIR)\Memory.obj" \
	"$(INTDIR)\Message.obj" \
	"$(INTDIR)\modiftype.obj" \
	"$(INTDIR)\Opendoc.obj" \
	"$(INTDIR)\Openview.obj" \
	"$(INTDIR)\pagecommands.obj" \
	"$(INTDIR)\Paginate.obj" \
	"$(INTDIR)\Picture.obj" \
	"$(INTDIR)\pictureapi.obj" \
	"$(INTDIR)\picturebase.obj" \
	"$(INTDIR)\picturemenu.obj" \
	"$(INTDIR)\Pivot.obj" \
	"$(INTDIR)\Platform.obj" \
	"$(INTDIR)\pnghandler.obj" \
	"$(INTDIR)\presentationapi.obj" \
	"$(INTDIR)\presentdriver.obj" \
	"$(INTDIR)\presentmenu.obj" \
	"$(INTDIR)\presrules.obj" \
	"$(INTDIR)\presvariables.obj" \
	"$(INTDIR)\printmenu.obj" \
	"$(INTDIR)\pschemaapi.obj" \
	"$(INTDIR)\Quit.obj" \
	"$(INTDIR)\readpivot.obj" \
	"$(INTDIR)\Readprs.obj" \
	"$(INTDIR)\Readstr.obj" \
	"$(INTDIR)\Readtra.obj" \
	"$(INTDIR)\referenceapi.obj" \
	"$(INTDIR)\references.obj" \
	"$(INTDIR)\Registry.obj" \
	"$(INTDIR)\Res.obj" \
	"$(INTDIR)\Resgen.obj" \
	"$(INTDIR)\Resmatch.obj" \
	"$(INTDIR)\Savedoc.obj" \
	"$(INTDIR)\Schemas.obj" \
	"$(INTDIR)\Schtrad.obj" \
	"$(INTDIR)\Scroll.obj" \
	"$(INTDIR)\Search.obj" \
	"$(INTDIR)\searchmenu.obj" \
	"$(INTDIR)\searchmenustr.obj" \
	"$(INTDIR)\searchref.obj" \
	"$(INTDIR)\selectionapi.obj" \
	"$(INTDIR)\specificdriver.obj" \
	"$(INTDIR)\spellchecker.obj" \
	"$(INTDIR)\structchange.obj" \
	"$(INTDIR)\structcommands.obj" \
	"$(INTDIR)\structcreation.obj" \
	"$(INTDIR)\structlist.obj" \
	"$(INTDIR)\structlocate.obj" \
	"$(INTDIR)\structmodif.obj" \
	"$(INTDIR)\structschema.obj" \
	"$(INTDIR)\structselect.obj" \
	"$(INTDIR)\textcommands.obj" \
	"$(INTDIR)\Thotmsg.obj" \
	"$(INTDIR)\translation.obj" \
	"$(INTDIR)\Tree.obj" \
	"$(INTDIR)\Treeapi.obj" \
	"$(INTDIR)\Units.obj" \
	"$(INTDIR)\unstructchange.obj" \
	"$(INTDIR)\unstructlocate.obj" \
	"$(INTDIR)\Viewapi.obj" \
	"$(INTDIR)\viewcommands.obj" \
	"$(INTDIR)\Views.obj" \
	"$(INTDIR)\visibility.obj" \
	"$(INTDIR)\windowdisplay.obj" \
	"$(INTDIR)\Word.obj" \
	"$(INTDIR)\writepivot.obj" \
	"$(INTDIR)\xbmhandler.obj" \
	"$(INTDIR)\xpmhandler.obj" \
	"$(INTDIR)\Zoom.obj"

"$(OUTDIR)\LibThotEditor.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "LibThotEditor - Win32 Debug"

OUTDIR=.\.
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\.
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\LibThotEditor.lib"

!ELSE 

ALL : "$(OUTDIR)\LibThotEditor.lib"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\Absboxes.obj"
	-@erase "$(INTDIR)\abspictures.obj"
	-@erase "$(INTDIR)\Actions.obj"
	-@erase "$(INTDIR)\Alloca.obj"
	-@erase "$(INTDIR)\appdialogue.obj"
	-@erase "$(INTDIR)\Appli.obj"
	-@erase "$(INTDIR)\applicationapi.obj"
	-@erase "$(INTDIR)\attributeapi.obj"
	-@erase "$(INTDIR)\attributes.obj"
	-@erase "$(INTDIR)\Attrmenu.obj"
	-@erase "$(INTDIR)\attrpresent.obj"
	-@erase "$(INTDIR)\boxlocate.obj"
	-@erase "$(INTDIR)\Boxmoves.obj"
	-@erase "$(INTDIR)\boxparams.obj"
	-@erase "$(INTDIR)\boxpositions.obj"
	-@erase "$(INTDIR)\boxrelations.obj"
	-@erase "$(INTDIR)\boxselection.obj"
	-@erase "$(INTDIR)\Browser.obj"
	-@erase "$(INTDIR)\buildboxes.obj"
	-@erase "$(INTDIR)\buildlines.obj"
	-@erase "$(INTDIR)\Callback.obj"
	-@erase "$(INTDIR)\callbackinit.obj"
	-@erase "$(INTDIR)\changeabsbox.obj"
	-@erase "$(INTDIR)\changepresent.obj"
	-@erase "$(INTDIR)\checkaccess.obj"
	-@erase "$(INTDIR)\checkermenu.obj"
	-@erase "$(INTDIR)\Closedoc.obj"
	-@erase "$(INTDIR)\Colors.obj"
	-@erase "$(INTDIR)\Config.obj"
	-@erase "$(INTDIR)\Content.obj"
	-@erase "$(INTDIR)\contentapi.obj"
	-@erase "$(INTDIR)\Context.obj"
	-@erase "$(INTDIR)\createabsbox.obj"
	-@erase "$(INTDIR)\createdoc.obj"
	-@erase "$(INTDIR)\createpages.obj"
	-@erase "$(INTDIR)\creationmenu.obj"
	-@erase "$(INTDIR)\dialogapi.obj"
	-@erase "$(INTDIR)\dictionary.obj"
	-@erase "$(INTDIR)\displaybox.obj"
	-@erase "$(INTDIR)\displayselect.obj"
	-@erase "$(INTDIR)\Docs.obj"
	-@erase "$(INTDIR)\documentapi.obj"
	-@erase "$(INTDIR)\Draw.obj"
	-@erase "$(INTDIR)\editcommands.obj"
	-@erase "$(INTDIR)\epshandler.obj"
	-@erase "$(INTDIR)\exceptions.obj"
	-@erase "$(INTDIR)\externalref.obj"
	-@erase "$(INTDIR)\extprintmenu.obj"
	-@erase "$(INTDIR)\fileaccess.obj"
	-@erase "$(INTDIR)\Font.obj"
	-@erase "$(INTDIR)\Frame.obj"
	-@erase "$(INTDIR)\genericdriver.obj"
	-@erase "$(INTDIR)\Geom.obj"
	-@erase "$(INTDIR)\gifhandler.obj"
	-@erase "$(INTDIR)\Hyphen.obj"
	-@erase "$(INTDIR)\inites.obj"
	-@erase "$(INTDIR)\Input.obj"
	-@erase "$(INTDIR)\interface.obj"
	-@erase "$(INTDIR)\jpeghandler.obj"
	-@erase "$(INTDIR)\keyboards.obj"
	-@erase "$(INTDIR)\labelalloc.obj"
	-@erase "$(INTDIR)\Language.obj"
	-@erase "$(INTDIR)\LiteClue.obj"
	-@erase "$(INTDIR)\Lookup.obj"
	-@erase "$(INTDIR)\Memory.obj"
	-@erase "$(INTDIR)\Message.obj"
	-@erase "$(INTDIR)\modiftype.obj"
	-@erase "$(INTDIR)\Opendoc.obj"
	-@erase "$(INTDIR)\Openview.obj"
	-@erase "$(INTDIR)\pagecommands.obj"
	-@erase "$(INTDIR)\Paginate.obj"
	-@erase "$(INTDIR)\Picture.obj"
	-@erase "$(INTDIR)\pictureapi.obj"
	-@erase "$(INTDIR)\picturebase.obj"
	-@erase "$(INTDIR)\picturemenu.obj"
	-@erase "$(INTDIR)\Pivot.obj"
	-@erase "$(INTDIR)\Platform.obj"
	-@erase "$(INTDIR)\pnghandler.obj"
	-@erase "$(INTDIR)\presentationapi.obj"
	-@erase "$(INTDIR)\presentdriver.obj"
	-@erase "$(INTDIR)\presentmenu.obj"
	-@erase "$(INTDIR)\presrules.obj"
	-@erase "$(INTDIR)\presvariables.obj"
	-@erase "$(INTDIR)\printmenu.obj"
	-@erase "$(INTDIR)\pschemaapi.obj"
	-@erase "$(INTDIR)\Quit.obj"
	-@erase "$(INTDIR)\readpivot.obj"
	-@erase "$(INTDIR)\Readprs.obj"
	-@erase "$(INTDIR)\Readstr.obj"
	-@erase "$(INTDIR)\Readtra.obj"
	-@erase "$(INTDIR)\referenceapi.obj"
	-@erase "$(INTDIR)\references.obj"
	-@erase "$(INTDIR)\Registry.obj"
	-@erase "$(INTDIR)\Res.obj"
	-@erase "$(INTDIR)\Resgen.obj"
	-@erase "$(INTDIR)\Resmatch.obj"
	-@erase "$(INTDIR)\Savedoc.obj"
	-@erase "$(INTDIR)\Schemas.obj"
	-@erase "$(INTDIR)\Schtrad.obj"
	-@erase "$(INTDIR)\Scroll.obj"
	-@erase "$(INTDIR)\Search.obj"
	-@erase "$(INTDIR)\searchmenu.obj"
	-@erase "$(INTDIR)\searchmenustr.obj"
	-@erase "$(INTDIR)\searchref.obj"
	-@erase "$(INTDIR)\selectionapi.obj"
	-@erase "$(INTDIR)\specificdriver.obj"
	-@erase "$(INTDIR)\spellchecker.obj"
	-@erase "$(INTDIR)\structchange.obj"
	-@erase "$(INTDIR)\structcommands.obj"
	-@erase "$(INTDIR)\structcreation.obj"
	-@erase "$(INTDIR)\structlist.obj"
	-@erase "$(INTDIR)\structlocate.obj"
	-@erase "$(INTDIR)\structmodif.obj"
	-@erase "$(INTDIR)\structschema.obj"
	-@erase "$(INTDIR)\structselect.obj"
	-@erase "$(INTDIR)\textcommands.obj"
	-@erase "$(INTDIR)\Thotmsg.obj"
	-@erase "$(INTDIR)\translation.obj"
	-@erase "$(INTDIR)\Tree.obj"
	-@erase "$(INTDIR)\Treeapi.obj"
	-@erase "$(INTDIR)\Units.obj"
	-@erase "$(INTDIR)\unstructchange.obj"
	-@erase "$(INTDIR)\unstructlocate.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\Viewapi.obj"
	-@erase "$(INTDIR)\viewcommands.obj"
	-@erase "$(INTDIR)\Views.obj"
	-@erase "$(INTDIR)\visibility.obj"
	-@erase "$(INTDIR)\windowdisplay.obj"
	-@erase "$(INTDIR)\Word.obj"
	-@erase "$(INTDIR)\writepivot.obj"
	-@erase "$(INTDIR)\xbmhandler.obj"
	-@erase "$(INTDIR)\xpmhandler.obj"
	-@erase "$(INTDIR)\Zoom.obj"
	-@erase "$(OUTDIR)\LibThotEditor.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /GX /Z7 /I "..\thotlib\include" /I\
 "..\thotlib\internals\h" /I "..\thotlib\internals\var" /I\
 "..\thotlib\internals\f" /I "..\libjpeg" /I "..\libpng" /I "..\libpng\zlib" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "__STDC__" /D "STDC_HEADERS"\
 /Fp"$(INTDIR)\LibThotEditor.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\LibThotEditor.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\LibThotEditor.lib" 
LIB32_OBJS= \
	"$(INTDIR)\Absboxes.obj" \
	"$(INTDIR)\abspictures.obj" \
	"$(INTDIR)\Actions.obj" \
	"$(INTDIR)\Alloca.obj" \
	"$(INTDIR)\appdialogue.obj" \
	"$(INTDIR)\Appli.obj" \
	"$(INTDIR)\applicationapi.obj" \
	"$(INTDIR)\attributeapi.obj" \
	"$(INTDIR)\attributes.obj" \
	"$(INTDIR)\Attrmenu.obj" \
	"$(INTDIR)\attrpresent.obj" \
	"$(INTDIR)\boxlocate.obj" \
	"$(INTDIR)\Boxmoves.obj" \
	"$(INTDIR)\boxparams.obj" \
	"$(INTDIR)\boxpositions.obj" \
	"$(INTDIR)\boxrelations.obj" \
	"$(INTDIR)\boxselection.obj" \
	"$(INTDIR)\Browser.obj" \
	"$(INTDIR)\buildboxes.obj" \
	"$(INTDIR)\buildlines.obj" \
	"$(INTDIR)\Callback.obj" \
	"$(INTDIR)\callbackinit.obj" \
	"$(INTDIR)\changeabsbox.obj" \
	"$(INTDIR)\changepresent.obj" \
	"$(INTDIR)\checkaccess.obj" \
	"$(INTDIR)\checkermenu.obj" \
	"$(INTDIR)\Closedoc.obj" \
	"$(INTDIR)\Colors.obj" \
	"$(INTDIR)\Config.obj" \
	"$(INTDIR)\Content.obj" \
	"$(INTDIR)\contentapi.obj" \
	"$(INTDIR)\Context.obj" \
	"$(INTDIR)\createabsbox.obj" \
	"$(INTDIR)\createdoc.obj" \
	"$(INTDIR)\createpages.obj" \
	"$(INTDIR)\creationmenu.obj" \
	"$(INTDIR)\dialogapi.obj" \
	"$(INTDIR)\dictionary.obj" \
	"$(INTDIR)\displaybox.obj" \
	"$(INTDIR)\displayselect.obj" \
	"$(INTDIR)\Docs.obj" \
	"$(INTDIR)\documentapi.obj" \
	"$(INTDIR)\Draw.obj" \
	"$(INTDIR)\editcommands.obj" \
	"$(INTDIR)\epshandler.obj" \
	"$(INTDIR)\exceptions.obj" \
	"$(INTDIR)\externalref.obj" \
	"$(INTDIR)\extprintmenu.obj" \
	"$(INTDIR)\fileaccess.obj" \
	"$(INTDIR)\Font.obj" \
	"$(INTDIR)\Frame.obj" \
	"$(INTDIR)\genericdriver.obj" \
	"$(INTDIR)\Geom.obj" \
	"$(INTDIR)\gifhandler.obj" \
	"$(INTDIR)\Hyphen.obj" \
	"$(INTDIR)\inites.obj" \
	"$(INTDIR)\Input.obj" \
	"$(INTDIR)\interface.obj" \
	"$(INTDIR)\jpeghandler.obj" \
	"$(INTDIR)\keyboards.obj" \
	"$(INTDIR)\labelalloc.obj" \
	"$(INTDIR)\Language.obj" \
	"$(INTDIR)\LiteClue.obj" \
	"$(INTDIR)\Lookup.obj" \
	"$(INTDIR)\Memory.obj" \
	"$(INTDIR)\Message.obj" \
	"$(INTDIR)\modiftype.obj" \
	"$(INTDIR)\Opendoc.obj" \
	"$(INTDIR)\Openview.obj" \
	"$(INTDIR)\pagecommands.obj" \
	"$(INTDIR)\Paginate.obj" \
	"$(INTDIR)\Picture.obj" \
	"$(INTDIR)\pictureapi.obj" \
	"$(INTDIR)\picturebase.obj" \
	"$(INTDIR)\picturemenu.obj" \
	"$(INTDIR)\Pivot.obj" \
	"$(INTDIR)\Platform.obj" \
	"$(INTDIR)\pnghandler.obj" \
	"$(INTDIR)\presentationapi.obj" \
	"$(INTDIR)\presentdriver.obj" \
	"$(INTDIR)\presentmenu.obj" \
	"$(INTDIR)\presrules.obj" \
	"$(INTDIR)\presvariables.obj" \
	"$(INTDIR)\printmenu.obj" \
	"$(INTDIR)\pschemaapi.obj" \
	"$(INTDIR)\Quit.obj" \
	"$(INTDIR)\readpivot.obj" \
	"$(INTDIR)\Readprs.obj" \
	"$(INTDIR)\Readstr.obj" \
	"$(INTDIR)\Readtra.obj" \
	"$(INTDIR)\referenceapi.obj" \
	"$(INTDIR)\references.obj" \
	"$(INTDIR)\Registry.obj" \
	"$(INTDIR)\Res.obj" \
	"$(INTDIR)\Resgen.obj" \
	"$(INTDIR)\Resmatch.obj" \
	"$(INTDIR)\Savedoc.obj" \
	"$(INTDIR)\Schemas.obj" \
	"$(INTDIR)\Schtrad.obj" \
	"$(INTDIR)\Scroll.obj" \
	"$(INTDIR)\Search.obj" \
	"$(INTDIR)\searchmenu.obj" \
	"$(INTDIR)\searchmenustr.obj" \
	"$(INTDIR)\searchref.obj" \
	"$(INTDIR)\selectionapi.obj" \
	"$(INTDIR)\specificdriver.obj" \
	"$(INTDIR)\spellchecker.obj" \
	"$(INTDIR)\structchange.obj" \
	"$(INTDIR)\structcommands.obj" \
	"$(INTDIR)\structcreation.obj" \
	"$(INTDIR)\structlist.obj" \
	"$(INTDIR)\structlocate.obj" \
	"$(INTDIR)\structmodif.obj" \
	"$(INTDIR)\structschema.obj" \
	"$(INTDIR)\structselect.obj" \
	"$(INTDIR)\textcommands.obj" \
	"$(INTDIR)\Thotmsg.obj" \
	"$(INTDIR)\translation.obj" \
	"$(INTDIR)\Tree.obj" \
	"$(INTDIR)\Treeapi.obj" \
	"$(INTDIR)\Units.obj" \
	"$(INTDIR)\unstructchange.obj" \
	"$(INTDIR)\unstructlocate.obj" \
	"$(INTDIR)\Viewapi.obj" \
	"$(INTDIR)\viewcommands.obj" \
	"$(INTDIR)\Views.obj" \
	"$(INTDIR)\visibility.obj" \
	"$(INTDIR)\windowdisplay.obj" \
	"$(INTDIR)\Word.obj" \
	"$(INTDIR)\writepivot.obj" \
	"$(INTDIR)\xbmhandler.obj" \
	"$(INTDIR)\xpmhandler.obj" \
	"$(INTDIR)\Zoom.obj"

"$(OUTDIR)\LibThotEditor.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "LibThotEditor - Win32 Release" || "$(CFG)" ==\
 "LibThotEditor - Win32 Debug"
SOURCE=..\Thotlib\View\Absboxes.c
DEP_CPP_ABSBO=\
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
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\structlist_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\page_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ABSBO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Absboxes.obj" : $(SOURCE) $(DEP_CPP_ABSBO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\abspictures.c
DEP_CPP_ABSPI=\
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
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ABSPI=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\abspictures.obj" : $(SOURCE) $(DEP_CPP_ABSPI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Actions.c
DEP_CPP_ACTIO=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ACTIO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Actions.obj" : $(SOURCE) $(DEP_CPP_ACTIO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Alloca.c
NODEP_CPP_ALLOC=\
	"..\Thotlib\Base\config.h"\
	

"$(INTDIR)\Alloca.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\appdialogue.c
DEP_CPP_APPDI=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxparams_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\context_f.h"\
	"..\thotlib\internals\f\dialogapi_f.h"\
	"..\thotlib\internals\f\dictionary_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\input_f.h"\
	"..\thotlib\internals\f\liteclue_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\sortmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\liteclue.h"\
	"..\thotlib\internals\h\logowindow.h"\
	"..\thotlib\internals\h\modif.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\units_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_APPDI=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\appdialogue.obj" : $(SOURCE) $(DEP_CPP_APPDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Appli.c
DEP_CPP_APPLI=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxparams_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\context_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\input_f.h"\
	"..\thotlib\internals\f\keyboards_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\message_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\selectmenu_f.h"\
	"..\thotlib\internals\f\structcommands_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thot_key.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_APPLI=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Appli.obj" : $(SOURCE) $(DEP_CPP_APPLI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\applicationapi.c
DEP_CPP_APPLIC=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\checkaccess_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\dialogapi_f.h"\
	"..\thotlib\internals\f\input_f.h"\
	"..\thotlib\internals\f\language_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\schtrad_f.h"\
	"..\thotlib\internals\f\searchmenu_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\dictionary.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\thotpattern.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\appevents_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\print_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	"..\thotlib\internals\var\thotpalette_tv.h"\
	"..\thotlib\internals\var\units_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_APPLIC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\applicationapi.obj" : $(SOURCE) $(DEP_CPP_APPLIC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\attributeapi.c
DEP_CPP_ATTRI=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\attributeapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ATTRI=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\attributeapi.obj" : $(SOURCE) $(DEP_CPP_ATTRI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\attributes.c
DEP_CPP_ATTRIB=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attrmenu_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ATTRIB=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\attributes.obj" : $(SOURCE) $(DEP_CPP_ATTRIB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Attrmenu.c
DEP_CPP_ATTRM=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\language_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\selectmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
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
	"..\thotlib\internals\h\winsys.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ATTRM=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Attrmenu.obj" : $(SOURCE) $(DEP_CPP_ATTRM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\attrpresent.c
DEP_CPP_ATTRP=\
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
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ATTRP=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\attrpresent.obj" : $(SOURCE) $(DEP_CPP_ATTRP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\boxlocate.c
DEP_CPP_BOXLO=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\geom_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\units_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BOXLO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\boxlocate.obj" : $(SOURCE) $(DEP_CPP_BOXLO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\Boxmoves.c
DEP_CPP_BOXMO=\
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
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
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
	
NODEP_CPP_BOXMO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Boxmoves.obj" : $(SOURCE) $(DEP_CPP_BOXMO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\boxparams.c
DEP_CPP_BOXPA=\
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
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxparams_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
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
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BOXPA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\boxparams.obj" : $(SOURCE) $(DEP_CPP_BOXPA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\boxpositions.c
DEP_CPP_BOXPO=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxpositions_f.h"\
	"..\thotlib\internals\f\boxrelations_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\units_f.h"\
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
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BOXPO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\boxpositions.obj" : $(SOURCE) $(DEP_CPP_BOXPO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\boxrelations.c
DEP_CPP_BOXRE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
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
	"..\thotlib\internals\var\boxes_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BOXRE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\boxrelations.obj" : $(SOURCE) $(DEP_CPP_BOXRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\boxselection.c
DEP_CPP_BOXSE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\displayselect_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
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
	"..\thotlib\internals\var\creation_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BOXSE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\boxselection.obj" : $(SOURCE) $(DEP_CPP_BOXSE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Browser.c
DEP_CPP_BROWS=\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\thotdir.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BROWS=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Browser.obj" : $(SOURCE) $(DEP_CPP_BROWS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\buildboxes.c
DEP_CPP_BUILD=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxpositions_f.h"\
	"..\thotlib\internals\f\boxrelations_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\displayselect_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BUILD=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\buildboxes.obj" : $(SOURCE) $(DEP_CPP_BUILD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\buildlines.c
DEP_CPP_BUILDL=\
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
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\hyphen_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BUILDL=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\buildlines.obj" : $(SOURCE) $(DEP_CPP_BUILDL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Callback.c
DEP_CPP_CALLB=\
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
	"..\thotlib\internals\f\callbackinit_f.h"\
	"..\thotlib\internals\f\readstr_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\modif.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appevents_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CALLB=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Callback.obj" : $(SOURCE) $(DEP_CPP_CALLB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\callbackinit.c
DEP_CPP_CALLBA=\
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
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\readstr_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\modif.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appevents_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CALLBA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\callbackinit.obj" : $(SOURCE) $(DEP_CPP_CALLBA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\changeabsbox.c
DEP_CPP_CHANG=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
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
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchref_f.h"\
	"..\thotlib\internals\f\structlist_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\writepivot_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CHANG=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\changeabsbox.obj" : $(SOURCE) $(DEP_CPP_CHANG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\changepresent.c
DEP_CPP_CHANGE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\boxpositions_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\unstructchange_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CHANGE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\changepresent.obj" : $(SOURCE) $(DEP_CPP_CHANGE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\checkaccess.c
DEP_CPP_CHECK=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\labelAllocator.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\labelalloc_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\res.h"\
	"..\thotlib\internals\h\resdynmsg.h"\
	"..\thotlib\internals\h\SelectRestruct.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CHECK=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\checkaccess.obj" : $(SOURCE) $(DEP_CPP_CHECK) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\checkermenu.c
DEP_CPP_CHECKE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\dictionary_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\savedoc_f.h"\
	"..\thotlib\internals\f\spellchecker_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\word_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constcorr.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\corrmenu.h"\
	"..\thotlib\internals\h\corrmsg.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\spell_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CHECKE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\checkermenu.obj" : $(SOURCE) $(DEP_CPP_CHECKE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Closedoc.c
DEP_CPP_CLOSE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CLOSE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Closedoc.obj" : $(SOURCE) $(DEP_CPP_CLOSE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Colors.c
DEP_CPP_COLOR=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\h\winsys.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_COLOR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Colors.obj" : $(SOURCE) $(DEP_CPP_COLOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Config.c
DEP_CPP_CONFI=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\message_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\units_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CONFI=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Config.obj" : $(SOURCE) $(DEP_CPP_CONFI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Content\Content.c
DEP_CPP_CONTE=\
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
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CONTE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Content.obj" : $(SOURCE) $(DEP_CPP_CONTE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Content\contentapi.c
DEP_CPP_CONTEN=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\writepivot_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CONTEN=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\contentapi.obj" : $(SOURCE) $(DEP_CPP_CONTEN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Context.c
DEP_CPP_CONTEX=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\checkermenu_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\registry_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CONTEX=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Context.obj" : $(SOURCE) $(DEP_CPP_CONTEX) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\createabsbox.c
DEP_CPP_CREAT=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CREAT=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\createabsbox.obj" : $(SOURCE) $(DEP_CPP_CREAT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\createdoc.c
DEP_CPP_CREATE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\browser_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\opendoc_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CREATE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\createdoc.obj" : $(SOURCE) $(DEP_CPP_CREATE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\createpages.c
DEP_CPP_CREATEP=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxpositions_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structlist_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CREATEP=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\createpages.obj" : $(SOURCE) $(DEP_CPP_CREATEP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\creationmenu.c
DEP_CPP_CREATI=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CREATI=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\creationmenu.obj" : $(SOURCE) $(DEP_CPP_CREATI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\dialogapi.c
DEP_CPP_DIALO=\
	"..\Thotlib\Dialogue\winerrdata.c"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\copyright.xbm"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\h\winsys.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_DIALO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\dialogapi.obj" : $(SOURCE) $(DEP_CPP_DIALO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Content\dictionary.c
DEP_CPP_DICTI=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\dictionary.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_DICTI=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\dictionary.obj" : $(SOURCE) $(DEP_CPP_DICTI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\displaybox.c
DEP_CPP_DISPL=\
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
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\displaybox_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_DISPL=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\displaybox.obj" : $(SOURCE) $(DEP_CPP_DISPL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\displayselect.c
DEP_CPP_DISPLA=\
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
	"..\thotlib\internals\f\displayselect_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_DISPLA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\displayselect.obj" : $(SOURCE) $(DEP_CPP_DISPLA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Docs.c
DEP_CPP_DOCS_=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\paginate_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchref_f.h"\
	"..\thotlib\internals\f\structcommands_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\writepivot_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\print_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_DOCS_=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Docs.obj" : $(SOURCE) $(DEP_CPP_DOCS_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\documentapi.c
DEP_CPP_DOCUM=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\readstr_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\translation_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\writepivot_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constpiv.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_DOCUM=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\documentapi.obj" : $(SOURCE) $(DEP_CPP_DOCUM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\Draw.c
DEP_CPP_DRAW_=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_DRAW_=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Draw.obj" : $(SOURCE) $(DEP_CPP_DRAW_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\editcommands.c
DEP_CPP_EDITC=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxparams_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\geom_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\structcommands_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\unstructchange_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_EDITC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\editcommands.obj" : $(SOURCE) $(DEP_CPP_EDITC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\epshandler.c
DEP_CPP_EPSHA=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\picture_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_EPSHA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\epshandler.obj" : $(SOURCE) $(DEP_CPP_EPSHA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\exceptions.c
DEP_CPP_EXCEP=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_EXCEP=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\exceptions.obj" : $(SOURCE) $(DEP_CPP_EXCEP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\externalref.c
DEP_CPP_EXTER=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
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
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\message_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constpiv.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_EXTER=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\externalref.obj" : $(SOURCE) $(DEP_CPP_EXTER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\extprintmenu.c
DEP_CPP_EXTPR=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\print.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\printmenu_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\print_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_EXTPR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\extprintmenu.obj" : $(SOURCE) $(DEP_CPP_EXTPR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\fileaccess.c
DEP_CPP_FILEA=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
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
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\registry_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_FILEA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\fileaccess.obj" : $(SOURCE) $(DEP_CPP_FILEA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Font.c
DEP_CPP_FONT_=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\language_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\registry_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
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
	"..\thotlib\internals\h\xpm.h"\
	"..\thotlib\internals\h\xpmP.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\units_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_FONT_=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Font.obj" : $(SOURCE) $(DEP_CPP_FONT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\Frame.c
DEP_CPP_FRAME=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\displaybox_f.h"\
	"..\thotlib\internals\f\displayselect_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_FRAME=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Frame.obj" : $(SOURCE) $(DEP_CPP_FRAME) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\genericdriver.c
DEP_CPP_GENER=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
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
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presentdriver_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_GENER=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\genericdriver.obj" : $(SOURCE) $(DEP_CPP_GENER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Geom.c
DEP_CPP_GEOM_=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
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
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_GEOM_=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Geom.obj" : $(SOURCE) $(DEP_CPP_GEOM_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\gifhandler.c
DEP_CPP_GIFHA=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\gifhandler_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\win_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\h\winsys.h"\
	"..\thotlib\internals\h\xpm.h"\
	"..\thotlib\internals\h\xpmP.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\picture_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_GIFHA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\gifhandler.obj" : $(SOURCE) $(DEP_CPP_GIFHA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\Hyphen.c
DEP_CPP_HYPHE=\
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
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\dictionary.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HYPHE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Hyphen.obj" : $(SOURCE) $(DEP_CPP_HYPHE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\thotlib\view\inites.c
DEP_CPP_INITE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\context_f.h"\
	"..\thotlib\internals\f\registry_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\pattern.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_INITE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\inites.obj" : $(SOURCE) $(DEP_CPP_INITE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Input.c
DEP_CPP_INPUT=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\context_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\input_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\message_f.h"\
	"..\thotlib\internals\f\registry_f.h"\
	"..\thotlib\internals\f\structcommands_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thot_key.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_INPUT=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Input.obj" : $(SOURCE) $(DEP_CPP_INPUT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\interface.c
DEP_CPP_INTER=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\context_f.h"\
	"..\thotlib\internals\f\dialogapi_f.h"\
	"..\thotlib\internals\f\displaybox_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\input_f.h"\
	"..\thotlib\internals\f\keyboards_f.h"\
	"..\thotlib\internals\f\message_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_INTER=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\interface.obj" : $(SOURCE) $(DEP_CPP_INTER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\jpeghandler.c
DEP_CPP_JPEGH=\
	"..\libjpeg\jconfig.h"\
	"..\libjpeg\jerror.h"\
	"..\libjpeg\jmorecfg.h"\
	"..\libjpeg\jpegint.h"\
	"..\libjpeg\jpeglib.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\gifhandler_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\picture_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_JPEGH=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\jpeghandler.obj" : $(SOURCE) $(DEP_CPP_JPEGH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\keyboards.c
DEP_CPP_KEYBO=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_KEYBO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\keyboards.obj" : $(SOURCE) $(DEP_CPP_KEYBO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\labelalloc.c
DEP_CPP_LABEL=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\labelAllocator.h"\
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
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_LABEL=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\labelalloc.obj" : $(SOURCE) $(DEP_CPP_LABEL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Language.c
DEP_CPP_LANGU=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\dictionary.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_LANGU=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Language.obj" : $(SOURCE) $(DEP_CPP_LANGU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\LiteClue.c
DEP_CPP_LITEC=\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\internals\h\liteclue.h"\
	"..\thotlib\internals\h\LiteClueP.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_LITEC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\LiteClue.obj" : $(SOURCE) $(DEP_CPP_LITEC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Lookup.c
DEP_CPP_LOOKU=\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_LOOKU=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Lookup.obj" : $(SOURCE) $(DEP_CPP_LOOKU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Memory.c
DEP_CPP_MEMOR=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_MEMOR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Memory.obj" : $(SOURCE) $(DEP_CPP_MEMOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Message.c
DEP_CPP_MESSA=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\dialogapi_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\message_f.h"\
	"..\thotlib\internals\f\registry_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_MESSA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Message.obj" : $(SOURCE) $(DEP_CPP_MESSA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\modiftype.c
DEP_CPP_MODIF=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\attrmenu_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\creationmenu_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\input_f.h"\
	"..\thotlib\internals\f\keyboards_f.h"\
	"..\thotlib\internals\f\picturemenu_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_MODIF=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\modiftype.obj" : $(SOURCE) $(DEP_CPP_MODIF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Opendoc.c
DEP_CPP_OPEND=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\browser_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\opendoc_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_OPEND=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Opendoc.obj" : $(SOURCE) $(DEP_CPP_OPEND) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Openview.c
DEP_CPP_OPENV=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_OPENV=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Openview.obj" : $(SOURCE) $(DEP_CPP_OPENV) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\pagecommands.c
DEP_CPP_PAGEC=\
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
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\boxpositions_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\pagecommands_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\page_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PAGEC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\pagecommands.obj" : $(SOURCE) $(DEP_CPP_PAGEC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\Paginate.c
DEP_CPP_PAGIN=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\boxpositions_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\pagecommands_f.h"\
	"..\thotlib\internals\f\paginate_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\print_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structlist_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\writepivot_f.h"\
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
	"..\thotlib\internals\var\page_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PAGIN=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Paginate.obj" : $(SOURCE) $(DEP_CPP_PAGIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\Picture.c
DEP_CPP_PICTU=\
	"..\libpng\png.h"\
	"..\libpng\pngconf.h"\
	"..\libpng\zlib\zconf.h"\
	"..\libpng\zlib\zlib.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
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
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\epshandler_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\gifhandler_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\jpeghandler_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\pnghandler_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\win_f.h"\
	"..\thotlib\internals\f\xbmhandler_f.h"\
	"..\thotlib\internals\f\xpmhandler_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\epsflogo.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\lost.xpm"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\h\winsys.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\picture_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PICTU=\
	"..\libpng\alloc.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Picture.obj" : $(SOURCE) $(DEP_CPP_PICTU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\pictureapi.c
DEP_CPP_PICTUR=\
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
	"..\thotlib\internals\f\memory_f.h"\
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
	"..\thotlib\internals\h\xpm.h"\
	"..\thotlib\internals\h\xpmP.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PICTUR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\pictureapi.obj" : $(SOURCE) $(DEP_CPP_PICTUR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\picturebase.c
DEP_CPP_PICTURE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
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
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\h\xpm.h"\
	"..\thotlib\internals\h\xpmP.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PICTURE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\picturebase.obj" : $(SOURCE) $(DEP_CPP_PICTURE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\picturemenu.c
DEP_CPP_PICTUREM=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\browser_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\savedoc_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PICTUREM=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\picturemenu.obj" : $(SOURCE) $(DEP_CPP_PICTUREM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Pivot.c
DEP_CPP_PIVOT=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\labelAllocator.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\labelalloc_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\writepivot_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constpiv.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PIVOT=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Pivot.obj" : $(SOURCE) $(DEP_CPP_PIVOT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Platform.c
DEP_CPP_PLATF=\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PLATF=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Platform.obj" : $(SOURCE) $(DEP_CPP_PLATF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\pnghandler.c
DEP_CPP_PNGHA=\
	"..\libpng\png.h"\
	"..\libpng\pngconf.h"\
	"..\libpng\zlib\zconf.h"\
	"..\libpng\zlib\zlib.h"\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\gifhandler_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\picture_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PNGHA=\
	"..\libpng\alloc.h"\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\pnghandler.obj" : $(SOURCE) $(DEP_CPP_PNGHA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\presentationapi.c
DEP_CPP_PRESE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\boxpositions_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\compilmsg_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PRESE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\presentationapi.obj" : $(SOURCE) $(DEP_CPP_PRESE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\presentdriver.c
DEP_CPP_PRESEN=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PRESEN=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\presentdriver.obj" : $(SOURCE) $(DEP_CPP_PRESEN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\presentmenu.c
DEP_CPP_PRESENT=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\unstructchange_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PRESENT=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\presentmenu.obj" : $(SOURCE) $(DEP_CPP_PRESENT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\presrules.c
DEP_CPP_PRESR=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
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
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\boxpositions_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PRESR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\presrules.obj" : $(SOURCE) $(DEP_CPP_PRESR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\presvariables.c
DEP_CPP_PRESV=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
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
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PRESV=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\presvariables.obj" : $(SOURCE) $(DEP_CPP_PRESV) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\printmenu.c
DEP_CPP_PRINT=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
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
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attrmenu_f.h"\
	"..\thotlib\internals\f\browser_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\creationmenu_f.h"\
	"..\thotlib\internals\f\dialogapi_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presentmenu_f.h"\
	"..\thotlib\internals\f\printmenu_f.h"\
	"..\thotlib\internals\f\registry_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchmenu_f.h"\
	"..\thotlib\internals\f\selectmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\print_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PRINT=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\printmenu.obj" : $(SOURCE) $(DEP_CPP_PRINT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\pschemaapi.c
DEP_CPP_PSCHE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\compilmsg_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PSCHE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\pschemaapi.obj" : $(SOURCE) $(DEP_CPP_PSCHE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Quit.c
DEP_CPP_QUIT_=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\closedoc_f.h"\
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
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_QUIT_=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Quit.obj" : $(SOURCE) $(DEP_CPP_QUIT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\readpivot.c
DEP_CPP_READP=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\labelAllocator.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\labelalloc_f.h"\
	"..\thotlib\internals\f\language_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\message_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constpiv.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_READP=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\readpivot.obj" : $(SOURCE) $(DEP_CPP_READP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Readprs.c
DEP_CPP_READPR=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\readprs_f.h"\
	"..\thotlib\internals\f\readstr_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constpiv.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_READPR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Readprs.obj" : $(SOURCE) $(DEP_CPP_READPR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Readstr.c
DEP_CPP_READS=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\readstr_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_READS=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Readstr.obj" : $(SOURCE) $(DEP_CPP_READS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Readtra.c
DEP_CPP_READT=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\message_f.h"\
	"..\thotlib\internals\f\readtra_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_READT=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Readtra.obj" : $(SOURCE) $(DEP_CPP_READT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\referenceapi.c
DEP_CPP_REFER=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
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
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemastr_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_REFER=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\referenceapi.obj" : $(SOURCE) $(DEP_CPP_REFER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\references.c
DEP_CPP_REFERE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_REFERE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\references.obj" : $(SOURCE) $(DEP_CPP_REFERE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Registry.c
DEP_CPP_REGIS=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_REGIS=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Registry.obj" : $(SOURCE) $(DEP_CPP_REGIS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\Res.c
DEP_CPP_RES_C=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\resgen_f.h"\
	"..\thotlib\internals\f\resmatch_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\constres.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\typestr.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_RES_C=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Res.obj" : $(SOURCE) $(DEP_CPP_RES_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\Resgen.c
DEP_CPP_RESGE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\resmatch_f.h"\
	"..\thotlib\internals\h\constres.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\typestr.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_RESGE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Resgen.obj" : $(SOURCE) $(DEP_CPP_RESGE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\Resmatch.c
DEP_CPP_RESMA=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\h\constres.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\typestr.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_RESMA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Resmatch.obj" : $(SOURCE) $(DEP_CPP_RESMA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Savedoc.c
DEP_CPP_SAVED=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\browser_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\createdoc_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\opendoc_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\translation_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SAVED=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Savedoc.obj" : $(SOURCE) $(DEP_CPP_SAVED) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Schemas.c
DEP_CPP_SCHEM=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\readprs_f.h"\
	"..\thotlib\internals\f\readstr_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SCHEM=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Schemas.obj" : $(SOURCE) $(DEP_CPP_SCHEM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Schtrad.c
DEP_CPP_SCHTR=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\readstr_f.h"\
	"..\thotlib\internals\f\readtra_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\schtrad_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SCHTR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Schtrad.obj" : $(SOURCE) $(DEP_CPP_SCHTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\Scroll.c
DEP_CPP_SCROL=\
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
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SCROL=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Scroll.obj" : $(SOURCE) $(DEP_CPP_SCROL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Content\Search.c
DEP_CPP_SEARC=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SEARC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Search.obj" : $(SOURCE) $(DEP_CPP_SEARC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\searchmenu.c
DEP_CPP_SEARCH=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\regexp_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchmenu_f.h"\
	"..\thotlib\internals\f\searchref_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\word_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SEARCH=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\searchmenu.obj" : $(SOURCE) $(DEP_CPP_SEARCH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\searchmenustr.c
DEP_CPP_SEARCHM=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\regexp_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\word_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SEARCHM=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\searchmenustr.obj" : $(SOURCE) $(DEP_CPP_SEARCHM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Content\searchref.c
DEP_CPP_SEARCHR=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\labelAllocator.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\labelalloc_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SEARCHR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\searchref.obj" : $(SOURCE) $(DEP_CPP_SEARCHR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\selectionapi.c
DEP_CPP_SELEC=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SELEC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\selectionapi.obj" : $(SOURCE) $(DEP_CPP_SELEC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\presentation\specificdriver.c
DEP_CPP_SPECI=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\presentdriver.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\specificdriver.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presentationapi_f.h"\
	"..\thotlib\internals\f\presentdriver_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SPECI=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\specificdriver.obj" : $(SOURCE) $(DEP_CPP_SPECI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\spellchecker.c
DEP_CPP_SPELL=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\dictionary_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\hyphen_f.h"\
	"..\thotlib\internals\f\registry_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\spellchecker_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\word_f.h"\
	"..\thotlib\internals\h\constcorr.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmot.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\corrmsg.h"\
	"..\thotlib\internals\h\dictionary.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\spell_tv.h"\
	"..\thotlib\internals\var\word_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SPELL=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\spellchecker.obj" : $(SOURCE) $(DEP_CPP_SPELL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\structchange.c
DEP_CPP_STRUC=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
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
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\contentapi_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchref_f.h"\
	"..\thotlib\internals\f\selectmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structlocate_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\modif.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\creation_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_STRUC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\structchange.obj" : $(SOURCE) $(DEP_CPP_STRUC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\structcommands.c
DEP_CPP_STRUCT=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
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
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\contentapi_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\res_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\selectmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\constres.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\modif.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\creation_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_STRUCT=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\structcommands.obj" : $(SOURCE) $(DEP_CPP_STRUCT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\structcreation.c
DEP_CPP_STRUCTC=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\creationmenu_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\creation_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_STRUCTC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\structcreation.obj" : $(SOURCE) $(DEP_CPP_STRUCTC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\structlist.c
DEP_CPP_STRUCTL=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\structlist_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_STRUCTL=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\structlist.obj" : $(SOURCE) $(DEP_CPP_STRUCTL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\structlocate.c
DEP_CPP_STRUCTLO=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\geom_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_STRUCTLO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\structlocate.obj" : $(SOURCE) $(DEP_CPP_STRUCTLO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\structmodif.c
DEP_CPP_STRUCTM=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\content.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\contentapi_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchref_f.h"\
	"..\thotlib\internals\f\selectmenu_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\modif.h"\
	"..\thotlib\internals\h\res.h"\
	"..\thotlib\internals\h\resdynmsg.h"\
	"..\thotlib\internals\h\SelectRestruct.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\creation_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_STRUCTM=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\structmodif.obj" : $(SOURCE) $(DEP_CPP_STRUCTM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\structschema.c
DEP_CPP_STRUCTS=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\schemastr_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_STRUCTS=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\structschema.obj" : $(SOURCE) $(DEP_CPP_STRUCTS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\structselect.c
DEP_CPP_STRUCTSE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\displayselect_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\keyboards_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchref_f.h"\
	"..\thotlib\internals\f\selectmenu_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_STRUCTSE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\structselect.obj" : $(SOURCE) $(DEP_CPP_STRUCTSE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\textcommands.c
DEP_CPP_TEXTC=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxparams_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\geom_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\windowdisplay_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_TEXTC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\textcommands.obj" : $(SOURCE) $(DEP_CPP_TEXTC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Thotmsg.c
DEP_CPP_THOTM=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_THOTM=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Thotmsg.obj" : $(SOURCE) $(DEP_CPP_THOTM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\translation.c
DEP_CPP_TRANS=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\readprs_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\schtrad_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\translation_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_TRANS=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\translation.obj" : $(SOURCE) $(DEP_CPP_TRANS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\Tree.c
DEP_CPP_TREE_=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\labelAllocator.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\abspictures_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\labelalloc_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\res.h"\
	"..\thotlib\internals\h\resdynmsg.h"\
	"..\thotlib\internals\h\SelectRestruct.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_TREE_=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Tree.obj" : $(SOURCE) $(DEP_CPP_TREE_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Tree\Treeapi.c
DEP_CPP_TREEA=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\labelAllocator.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributeapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\documentapi_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\labelalloc_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\translation_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
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
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_TREEA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Treeapi.obj" : $(SOURCE) $(DEP_CPP_TREEA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Base\Units.c
DEP_CPP_UNITS=\
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
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\units_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_UNITS=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Units.obj" : $(SOURCE) $(DEP_CPP_UNITS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\unstructchange.c
DEP_CPP_UNSTR=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
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
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\contentapi_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\editcommands_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchref_f.h"\
	"..\thotlib\internals\f\selectmenu_f.h"\
	"..\thotlib\internals\f\structcommands_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\unstructlocate_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\modif.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\creation_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_UNSTR=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\unstructchange.obj" : $(SOURCE) $(DEP_CPP_UNSTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\unstructlocate.c
DEP_CPP_UNSTRU=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxmoves_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\geom_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_UNSTRU=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\unstructlocate.obj" : $(SOURCE) $(DEP_CPP_UNSTRU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\Viewapi.c
DEP_CPP_VIEWA=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\selection.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\attrpresent_f.h"\
	"..\thotlib\internals\f\boxlocate_f.h"\
	"..\thotlib\internals\f\boxparams_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\context_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\paginate_f.h"\
	"..\thotlib\internals\f\presrules_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\scroll_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\boxes_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_VIEWA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Viewapi.obj" : $(SOURCE) $(DEP_CPP_VIEWA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Editing\viewcommands.c
DEP_CPP_VIEWC=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\application.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\registry.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\exceptions_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\savedoc_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structlist_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\textcommands_f.h"\
	"..\thotlib\internals\f\thotmsg_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
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
	"..\thotlib\internals\var\creation_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\print_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_VIEWC=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\viewcommands.obj" : $(SOURCE) $(DEP_CPP_VIEWC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\Views.c
DEP_CPP_VIEWS=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\absboxes_f.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\appli_f.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\boxselection_f.h"\
	"..\thotlib\internals\f\buildboxes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changeabsbox_f.h"\
	"..\thotlib\internals\f\closedoc_f.h"\
	"..\thotlib\internals\f\config_f.h"\
	"..\thotlib\internals\f\createabsbox_f.h"\
	"..\thotlib\internals\f\createpages_f.h"\
	"..\thotlib\internals\f\docs_f.h"\
	"..\thotlib\internals\f\draw_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\frame_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\paginate_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\presvariables_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\search_f.h"\
	"..\thotlib\internals\f\searchref_f.h"\
	"..\thotlib\internals\f\structcommands_f.h"\
	"..\thotlib\internals\f\structcreation_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\viewapi_f.h"\
	"..\thotlib\internals\f\viewcommands_f.h"\
	"..\thotlib\internals\f\views_f.h"\
	"..\thotlib\internals\f\writepivot_f.h"\
	"..\thotlib\internals\h\appdialogue.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\appdialogue_tv.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\page_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	"..\thotlib\internals\var\select_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_VIEWS=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Views.obj" : $(SOURCE) $(DEP_CPP_VIEWS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\visibility.c
DEP_CPP_VISIB=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\boxparams_f.h"\
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
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_VISIB=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\visibility.obj" : $(SOURCE) $(DEP_CPP_VISIB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\View\windowdisplay.c
DEP_CPP_WINDO=\
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
	"..\thotlib\internals\f\buildlines_f.h"\
	"..\thotlib\internals\f\context_f.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\thotcolor.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\edit_tv.h"\
	"..\thotlib\internals\var\font_tv.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\thotcolor_tv.h"\
	"..\thotlib\internals\var\units_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_WINDO=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\windowdisplay.obj" : $(SOURCE) $(DEP_CPP_WINDO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Content\Word.c
DEP_CPP_WORD_=\
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
	"..\thotlib\internals\f\hyphen_f.h"\
	"..\thotlib\internals\f\structselect_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_WORD_=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Word.obj" : $(SOURCE) $(DEP_CPP_WORD_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Document\writepivot.c
DEP_CPP_WRITE=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\fileaccess.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\labelAllocator.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\applicationapi_f.h"\
	"..\thotlib\internals\f\attributes_f.h"\
	"..\thotlib\internals\f\callback_f.h"\
	"..\thotlib\internals\f\changepresent_f.h"\
	"..\thotlib\internals\f\content_f.h"\
	"..\thotlib\internals\f\externalref_f.h"\
	"..\thotlib\internals\f\fileaccess_f.h"\
	"..\thotlib\internals\f\labelalloc_f.h"\
	"..\thotlib\internals\f\language_f.h"\
	"..\thotlib\internals\f\memory_f.h"\
	"..\thotlib\internals\f\platform_f.h"\
	"..\thotlib\internals\f\readpivot_f.h"\
	"..\thotlib\internals\f\references_f.h"\
	"..\thotlib\internals\f\schemas_f.h"\
	"..\thotlib\internals\f\structmodif_f.h"\
	"..\thotlib\internals\f\structschema_f.h"\
	"..\thotlib\internals\f\tree_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\f\writepivot_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constpiv.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotdir.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\modif_tv.h"\
	"..\thotlib\internals\var\platform_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_WRITE=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\writepivot.obj" : $(SOURCE) $(DEP_CPP_WRITE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\xbmhandler.c
DEP_CPP_XBMHA=\
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
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\picture_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_XBMHA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\xbmhandler.obj" : $(SOURCE) $(DEP_CPP_XBMHA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Image\xpmhandler.c
DEP_CPP_XPMHA=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\font_f.h"\
	"..\thotlib\internals\f\inites_f.h"\
	"..\thotlib\internals\f\picture_f.h"\
	"..\thotlib\internals\f\units_f.h"\
	"..\thotlib\internals\h\constint.h"\
	"..\thotlib\internals\h\constmedia.h"\
	"..\thotlib\internals\h\constmenu.h"\
	"..\thotlib\internals\h\constprs.h"\
	"..\thotlib\internals\h\conststr.h"\
	"..\thotlib\internals\h\consttra.h"\
	"..\thotlib\internals\h\frame.h"\
	"..\thotlib\internals\h\picture.h"\
	"..\thotlib\internals\h\thotkey.h"\
	"..\thotlib\internals\h\typecorr.h"\
	"..\thotlib\internals\h\typeint.h"\
	"..\thotlib\internals\h\typemedia.h"\
	"..\thotlib\internals\h\typeprs.h"\
	"..\thotlib\internals\h\typestr.h"\
	"..\thotlib\internals\h\typetra.h"\
	"..\thotlib\internals\h\xpm.h"\
	"..\thotlib\internals\h\xpmP.h"\
	"..\thotlib\internals\var\frame_tv.h"\
	"..\thotlib\internals\var\picture_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_XPMHA=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\xpmhandler.obj" : $(SOURCE) $(DEP_CPP_XPMHA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\Thotlib\Dialogue\Zoom.c
DEP_CPP_ZOOM_=\
	"..\thotlib\include\app.h"\
	"..\thotlib\include\appaction.h"\
	"..\thotlib\include\attribute.h"\
	"..\thotlib\include\dialog.h"\
	"..\thotlib\include\document.h"\
	"..\thotlib\include\interface.h"\
	"..\thotlib\include\language.h"\
	"..\thotlib\include\libmsg.h"\
	"..\thotlib\include\message.h"\
	"..\thotlib\include\presentation.h"\
	"..\thotlib\include\pschema.h"\
	"..\thotlib\include\simx.h"\
	"..\thotlib\include\sysdep.h"\
	"..\thotlib\include\thot_gui.h"\
	"..\thotlib\include\thot_sys.h"\
	"..\thotlib\include\tree.h"\
	"..\thotlib\include\typebase.h"\
	"..\thotlib\include\view.h"\
	"..\thotlib\internals\f\actions_f.h"\
	"..\thotlib\internals\f\appdialogue_f.h"\
	"..\thotlib\internals\f\boxparams_f.h"\
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
	"..\thotlib\internals\var\frame_tv.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ZOOM_=\
	"..\thotlib\include\HTVMSUtils.h"\
	

"$(INTDIR)\Zoom.obj" : $(SOURCE) $(DEP_CPP_ZOOM_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

