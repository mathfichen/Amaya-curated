# Microsoft Developer Studio Project File - Name="libjpeg" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=libjpeg - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "libjpeg.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "libjpeg.mak" CFG="libjpeg - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "libjpeg - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "libjpeg - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "libjpeg - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I "..\..\libjpeg" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "libjpeg - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I "..\..\libjpeg" /I "..\..\thotlib\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "libjpeg - Win32 Release"
# Name "libjpeg - Win32 Debug"
# Begin Source File

SOURCE=..\..\libjpeg\jcapimin.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcapistd.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jccoefct.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jccolor.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcdctmgr.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jchuff.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcinit.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcmainct.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcmarker.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcmaster.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcomapi.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcparam.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcphuff.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcprepct.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jcsample.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jctrans.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdapimin.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdapistd.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdatadst.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdatasrc.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdcoefct.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdcolor.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jddctmgr.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdhuff.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdinput.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdmainct.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdmarker.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdmaster.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdmerge.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdphuff.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdpostct.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdsample.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jdtrans.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jerror.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jfdctflt.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jfdctfst.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jfdctint.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jidctflt.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jidctfst.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jidctint.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jidctred.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jmemmgr.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jmemnobs.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jquant1.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jquant2.c
# End Source File
# Begin Source File

SOURCE=..\..\libjpeg\jutils.c
# End Source File
# End Target
# End Project