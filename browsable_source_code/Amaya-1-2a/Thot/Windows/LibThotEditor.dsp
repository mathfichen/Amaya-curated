# Microsoft Developer Studio Project File - Name="LibThotEditor" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=LibThotEditor - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "LibThotEditor.mak".
!MESSAGE 
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

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe

!IF  "$(CFG)" == "LibThotEditor - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "."
# PROP Intermediate_Dir ".\Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /I "..\thotlib\include" /I "..\thotlib\internals\h" /I "..\thotlib\internals\var" /I "..\thotlib\internals\f" /I "..\libjpeg" /I "..\libpng" /I "..\libpng\zlib" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "__STDC__" /D "STDC_HEADERS" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "LibThotEditor - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "."
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /Z7 /I "..\thotlib\include" /I "..\thotlib\internals\h" /I "..\thotlib\internals\var" /I "..\thotlib\internals\f" /I "..\libjpeg" /I "..\libpng" /I "..\libpng\zlib" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "__STDC__" /D "STDC_HEADERS" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"LibThotEditor.lib"

!ENDIF 

# Begin Target

# Name "LibThotEditor - Win32 Release"
# Name "LibThotEditor - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\Thotlib\View\Absboxes.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\abspictures.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Actions.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Alloca.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\appdialogue.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Appli.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\applicationapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\attributeapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\attributes.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Attrmenu.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\attrpresent.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\boxlocate.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\Boxmoves.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\boxparams.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\boxpositions.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\boxrelations.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\boxselection.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Browser.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\buildboxes.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\buildlines.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Callback.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\callbackinit.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\changeabsbox.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\changepresent.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\checkaccess.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\checkermenu.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Closedoc.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Colors.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Config.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Content\Content.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Content\contentapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Context.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\createabsbox.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\createdoc.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\createpages.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\creationmenu.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\dialogapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Content\dictionary.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\displaybox.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\displayselect.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Docs.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\documentapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\Draw.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\editcommands.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\epshandler.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\exceptions.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\externalref.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\extprintmenu.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\fileaccess.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Font.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\Frame.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\genericdriver.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Geom.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\gifhandler.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\Hyphen.c
# End Source File
# Begin Source File

SOURCE=..\thotlib\view\inites.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Input.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\interface.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\jpeghandler.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\keyboards.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\labelalloc.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Language.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\LiteClue.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Lookup.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Memory.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Message.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\modiftype.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Opendoc.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Openview.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\pagecommands.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\Paginate.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\Picture.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\pictureapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\picturebase.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\picturemenu.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Pivot.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Platform.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\pnghandler.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\presentationapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\presentdriver.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\presentmenu.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\presrules.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\presvariables.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\printmenu.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\pschemaapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Quit.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\readpivot.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Readprs.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Readstr.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Readtra.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\referenceapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\references.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Registry.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\Res.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\Resgen.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\Resmatch.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Savedoc.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Schemas.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Schtrad.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\Scroll.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Content\Search.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\searchmenu.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\searchmenustr.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Content\searchref.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\selectionapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\presentation\specificdriver.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\spellchecker.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\structchange.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\structcommands.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\structcreation.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\structlist.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\structlocate.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\structmodif.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\structschema.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\structselect.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\textcommands.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Thotmsg.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\translation.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\Tree.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Tree\Treeapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Base\Units.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\unstructchange.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\unstructlocate.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\Viewapi.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Editing\viewcommands.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\Views.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\visibility.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\View\windowdisplay.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Content\Word.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Document\writepivot.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\xbmhandler.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Image\xpmhandler.c
# End Source File
# Begin Source File

SOURCE=..\Thotlib\Dialogue\Zoom.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
