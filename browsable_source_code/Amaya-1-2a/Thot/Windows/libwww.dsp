# Microsoft Developer Studio Project File - Name="libwww" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=libwww - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "libwww.mak".
!MESSAGE 
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

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe

!IF  "$(CFG)" == "libwww - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "."
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "WWW_WIN_ASYNC" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "libwww - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "."
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I "..\w3c-libwww-5.0a\Library\src" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "WWW_WIN_ASYNC" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"libwww.lib"

!ENDIF 

# Begin Target

# Name "libwww - Win32 Release"
# Name "libwww - Win32 Debug"
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTAABrow.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTAAUtil.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTAccess.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTAlert.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTAnchor.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTANSI.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTArray.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTAssoc.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTAtom.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTBind.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTBInit.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTBound.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTBTree.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTBufWrt.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTCache.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTChannl.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTChunk.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTConLen.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTDescpt.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTDialog.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTDir.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTDNS.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTEPtoCl.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTError.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTEscape.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTEvent.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTEvntrg.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTFile.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTFilter.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTFormat.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTFWrite.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTGuess.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTHeader.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTHInit.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTHist.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTHome.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTHost.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTIcons.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTInet.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTInit.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTLib.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTLink.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTList.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTLocal.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTLog.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMemory.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMerge.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMethod.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMIME.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMIMERq.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMIMImp.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMIMPrs.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTML.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMLGen.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMLPDTD.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMulti.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTMux.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTNet.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTNetTxt.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTParse.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTPEP.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTPlain.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTProfil.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTProt.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTProxy.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTReader.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTReqMan.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTResponse.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTRules.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTSChunk.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTSocket.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTStream.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTString.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTStyle.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTChunk.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTCP.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTee.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTP.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTPGen.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTPReq.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTPRes.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTPServ.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTTrans.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTUser.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTUTree.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTUU.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTWriter.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTWSRC.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTWWWStr.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\HTXParse.c"
# End Source File
# Begin Source File

SOURCE="..\w3c-libwww-5.0a\Library\src\SGML.c"
# End Source File
# End Target
# End Project
