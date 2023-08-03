INTRODUCTION

This is release 0.9 of the jBYTEmark, a port of the BYTEmark benchmarks to Java. This is a release candidate: Barring unforseen circumstances and after updating portions of the Application version (said updates will *not* effect the scores), this version should be available in full release (1.0) within a month (i.e., the July-August '96 timeframe).

Please read the following DISCLAIMER, USAGE, and REPORTING topics. You should also read the documentation in the DOCS subdirectory before working with the benchmarks. If you have any questions, contact BYTE Magazine at (603) 924-9281 and ask for the BYTE Lab.

The diskette is organized as follows:

README.TXT                        This file

APPLET\                           Java applet subdirectory
 SRC\                              Java source files for applet
 CLASS\                            Java class files for applet

APP\                              Java appliction subdirectory
 SRC\                              Java source files for application
 CLASS\                            Java class files for application

DOCS\                             Documentation
 JAPPEND.TXT                       Java appendix to BYTEmark doc.
 BDOC.TXT                          Original BYTEmark doc.

The actual file names in both the APPLET\SRC and APP\SRC subdirectories are identical. These files are the Java source code files for the jBYTEmark:

 AssignmentTest.java
 BitOpsTest.java
 BmarkTest.java
 BMglobals.java
 EMFloatTest.java
 EmFloatPnt.java
 FourierTest.java
 HuffmanTest.java
 huff_node.java
 IDEATest.java
 InternalFPF.java
 jBYTEmark.java
 LuTest.java
 NeuralNetTest.java
 NumericSortTEst.java
 RandNum.java
 StringSortTest.java

The APPLET\SRC subdirectory includes the following additional files:
  jBYTEmark.html
  ErrorDialog.java
  ResultsFrame.java

Similarly, the file names in both the APPLET\CLASS and APP\CLASS subdirectories are identical. These files are the Java bytecode (binary, if you will) for the benchmark. Their names are identical to the *.java files (in the SRC\ subdirectories) from which they were built.

For the most part, this is a "straight port" of the original BYTEmark benchmarks. We have not added Java-esque entities such as multi- threading. Those alterations that Java forced us to make (such as turning what was a structure into a class), we of course made. The JAPPEND.TXT file contains a reasonablye --------

DISCLAIMER

1. The source, executable, and documentation files that comprise the jBYTEmark benchmarks are made available on an "as is" basis.  This means that we at BYTE Magazine have made every reasonable effort to verify that the there are no errors in the source and executable code.  We cannot, however, guarantee that the programs are error-free.  Consequently, McGraw-HIll and BYTE Magazine make no claims in regard to the fitness of the source code, executable code, and documentation of the BYTEmark.  Furthermore, BYTE Magazine, McGraw-Hill, and all employees of McGraw-Hill cannot be held responsible for any damages resulting from the use of this code or the results obtained from using this code.

USAGE

1. The source and executables for these benchmarks may be distributed freely, as long as a) the files remain unaltered and b) all the supporting documentation files are included in the distribution.

2. Modifications to the code will be made by BYTE Magazine only.  Suggested modifications should be submitted to the BYTE Lab. (Land mail such suggestions to: Byte Magazine, One Phoenix Mill Ln, Peterborough, NH, 03458, Attn: BYTE Lab.)

3. Please see the "RUNNING..." sections below for instructions covering how to run the tests.

REPORTING RESULTS

1. Do NOT report results from the 0.9 version of the jBYTEmark. BYTE Lab should be finalizing details of this distribution in the near future, and will make Version 1.0 available to the public. You may report results from Version 1.0, subject to the guidelines that will be released with that version.

2. FYI: Indexes reported by the Version 0.9 jBYTEmark are based on a 90 MHz DELL Pentium running Windows '95. The execution environment was Symantec's Cafe, version 1.0.

==== RUNNING THE BENCHMARK =====
(This topic is in two sections, because the jBYTEmark is available in two executable forms -- application and applet. Individual instructions for each follow.)

RUNNING THE JAVA APPLICATION

Before you run the Java Application version, you must have a Java runtime system (i.e., Java interpreter and the support classes such as java.lang, etc.) You could use the Java interpreter and classes from Sun, as well as Symantec Cafe, Borlands Java system (bundled with Borland C++ 5.), or the Metrowerks Code Warrior Java system (for the Macintosh).

1. Create a subdirectory on your hard disk to hold the application's files. We'll presume you call the subdirectory C:\JBYTE

2. Copy the contents of the diskette's APP\CLASS subdirectory to C:\JBYTE.

(Macintosh users may have to do some extra work after steps 1 and 2. In particular, the file names will be copied as "short" filenames, and must be edited to their proper "full" names. See the above list of files for the correct names.)

3. Run the application by typing:
    java jBYTEmark

4. Note that you can use a command file to override the benchmark's default parameters. (See the original BYTEmark documentation on how to do this.) So, if you've created a command file named COMFILE.DAT, you can enter:
   java jBYTEmark -CCOMFILE.DAT
and the program will read the contents of COMFILE.DAT.

RUNNING THE JAVA APPLET
(This presumes that you have a Java-enabled browser.)

1. Create a subdirectory on your hard disk to hold the application's files. We'll presume you call the subdirectory C:\JBYTE

2. Copy the contents of the diskette's APPLET\CLASS subdiretory to C:\JBYTE. (This will also copy the HTML file that the applet requires.)

(See the note for Macintosh users between steps 2 and 3 above.)

3. Launch your browser, and enter the path to the HTML file as the URL: C:\JBYTE\JBYTEMARK.HTML

Note that the APPLET does not (at this time) allow you to use the COMMAND FILE to override application parameters.

--Rick Grehan
--Dave Rowell
BYTE Magazine

=====END OF FILE====

