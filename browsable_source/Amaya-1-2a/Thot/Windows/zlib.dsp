# Microsoft Developer Studio Project File - Name="zlib" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=zlib - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "zlib.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "zlib.mak" CFG="zlib - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "zlib - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "zlib - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe

!IF  "$(CFG)" == "zlib - Win32 Release"

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
# ADD CPP /nologo /W3 /GX /O2 /I "..\libpng\zlib" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "zlib - Win32 Debug"

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
# ADD CPP /nologo /W3 /GX /Z7 /Od /I "..\libpng\zlib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"zlib.lib"

!ENDIF 

# Begin Target

# Name "zlib - Win32 Release"
# Name "zlib - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\libpng\zlib\adler32.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\compress.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\crc32.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\deflate.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\gzio.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\infblock.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\infcodes.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\inffast.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\inflate.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\inftrees.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\infutil.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\trees.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\uncompr.c
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\zutil.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=..\libpng\zlib\deflate.h
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\infblock.h
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\infcodes.h
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\inffast.h
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\inftrees.h
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\infutil.h
# End Source File
# Begin Source File

SOURCE=..\libpng\zlib\zutil.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
