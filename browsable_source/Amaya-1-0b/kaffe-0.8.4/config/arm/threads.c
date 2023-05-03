/*
 * arm/threads.c
 * ARM threading information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Antonio Lombrano <antonio@aloha.iet.unipi.it>
 */

asm("

;
; thread-ARM.s
;
; Machine dependent function for dealing with thread
;

	AREA threadARMfunctions, CODE, READONLY

; --------------------------------------------------------------------------

threadSwitch
	;Create a stack backtrace structure as specified
	;in the ArmProcedureCallStandard. Pushes in the stack the parameter
	;register a1-a4, the variable register v1-v7, the frame pointer fp,
	;the stack pointer sp, the link return lr, and the program counter pc.
	;It makes fp point to pc in the stack, as specified in the APCS.
	MOV     ip, sp
	STMFD   sp!, {a1-a4,v1-v6, fp, ip, lr, pc}
	SUB     fp, ip, #4
	;do a stack checking
	CMP     sp,sl
	BLMI    __rt_stkovf_split_small
	;We must now save the current stack pointer sp in from->restorePoint
	STR     sp, [a2]        ;a2 is the second argument, struct ctx* from
	;We now change context, making sp pointing to the new stack saved 
	;in to->restorePoint
	LDR     sp, [a1]        ;a1 is the first argument, struct ctx* to
	;We calculate the right frame pointer
	MOV     fp, sp
	ADD     fp, fp, #52     ;fp is 52 bytes more than sp
	;Now we pop all the registers and exit
	LDMEA   fp, {a1-a4, v1-v6, fp, sp, pc}

; --------------------------------------------------------------------------

threadInit
	;Creates the initial backtrace structure (56 bytes), and set the 
	;appropriate restore point
	LDR     a3, [a1, #4]    ;Loads in register a3 the pointer to->stackEnd
	STR     pc, [a3, #-4]   ;Stores the pc - this is probably unusefull !
	STR     a2, [a3, #-8]   ;Stores the fun add. passed as second arg. as lr
	MOV     a4, a3
	SUB     a4, a4,  #4
	STR     a4, [a3, #-12]  ;(to->stackEnd - 4) for sp - check !
	STR     a3, [a3, #-16]  ;(to->stackEnd) for fp - check !
	MOV     a4, #0
	STR     a4, [a3, #-20]  ;0 for v6
	STR     a4, [a3, #-24]  ;0 for v5
	STR     a4, [a3, #-28]  ;0 for v4
	STR     a4, [a3, #-32]  ;0 for v3
	STR     a4, [a3, #-36]  ;0 for v2
	STR     a4, [a3, #-40]  ;0 for v1
	STR     a4, [a3, #-44]  ;0 for a4
	STR     a4, [a3, #-48]  ;0 for a3
	STR     a4, [a3, #-52]  ;0 for a2
	STR     a4, [a3, #-56]  ;0 for a1
	;We now save in to->restorePoint the value (to->stackEnd - 56)
	SUB     a3, a3, #56
	STR     a3, [a1]
	;We exit
	MOV     pc, lr

; --------------------------------------------------------------------------

threadInfo
	;Initialize the stack for the main thread. It has been necessary to
	;write it entirely in assembler, because the armcc compiler does not
	MOV     a2,fp                   ;unsigned char** ptr= 'register fp'
	MOV     a3,#0                   ;int i=0 step    
	LDR     a2,[a2,#-12]            ;for(i=0;i!=2;i++)
	ADD     a3,a3,#1                ;       ptr=*(ptr-12)
	TEQ     a3,#2                   ;We must backtrace in the stack
	BNE     step                    ;for two times
	ADD     a2,a2,#4
	MOV     a3,#0
	STR     a2,[a1,#4]              ;ee->stackEnd=ptr
	SUB     a2,a2,#&8000            ;THREADSTACKSIZE=32*1024
	STR     a2,[a1,#8]              ;ee->stackBase=ee->stackBase - THREADSTACKSIZE
	STR     a3,[a1,#0]              ;ee->restorePoint=0
	;The following instructions have been removed because the flags member
	;is initialized in the calling function(InitThreads).
	;Should be necessary to include them again, modify the ctx struct, so that
	;flags member occupy 32 bit (instead of 8, being an uint8).  Doing not
	;so the following instructions will overwrite other members.
	;MOV    a2,1
	;STR    a2,[a1,#&c]             ;ee->flags=1
	MOV     pc,lr

; --------------------------------------------------------------------------

threadFrames
	;This must be probably modified to adapt it to version 0.8.2
	MOV     a2,#0                   ;int cnt=0
	MOV     a3,#0                   ;void** ptr=0
	LDR     a4,[pc, #externData-.-8]  
	LDR     a4,[a4,#0]              ;extern thread* currentThread

	TEQ     a1,a4                   ;if tid = currentThread ptr='reg. fp'
	BNE     notEqual
	MOV     a3,fp                   ;  else ptr=((void***)tid->PrivateInfo->restorePoint)[10]
	B       goOn        
notEqual        
	LDR     a1,[a1,#0]
	LDR     a1,[a1,#0]
	LDR     a3,[a1,#40]!

goOn        
	LDR     a1,[a3,#0]              ;'reg.a1'=*ptr
	TEQ     a1,#0                   ;if *ptr=0
	BEQ     exitLoop
loop
	ADD     a2,a2,#1                ;cnt++
	LDR     a3,[a3,#-12]            ;ptr=*(ptr-12) /* ptr=fp in stack */
	LDR     a1,[a3,#0]
	TEQ     a1,#0                   ;if *ptr=0
	BNE     loop
exitLoop
	MOV     a1,a2                   ;'reg.a1'=cont
	MOV     pc,lr                   ;return cnt
externData
	DCD     currentThread

; --------------------------------------------------------------------------

	IMPORT  currentThread
	IMPORT  __rt_stkovf_split_small

	EXPORT  threadSwitch
	EXPORT  threadInit
	EXPORT  threadInfo
	EXPORT  threadFrames

	END

");
