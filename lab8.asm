; Michael Masterson
; E00942993
; COSC 221 Sec.0
; Lab 8
; November 20, 2014
; Write an LC-3 assembly language program to read in a
; sequence of single-digit positive integers from the
; keyboard (one integer per line) until the sentinel value
; of 0 is reached and then display the largest positive integer.

	.ORIG x3000							; WHERE PROGRAM WILL START IN LC-3

	AND 	R1,R1,#0						; CLEAR R1
	AND 	R0,R0,#0						; CLEAR R0
	AND	R2, R2, #0						; MAX NUMBER

AGAIN	LEA	R0,MSG1							; LOAD MESSAGE 1
	PUTS								; DISPLAY MESSAGE 1

	GETC								; READ CHAR1
	OUT								; ECHO CHAR
	ST R0,	FIRST							; STORE CHAR

	LD	R0,NEWLINE						; LOAD NEW LINE
	OUT

	LD R5, NEG48							; LOAD NEG48
	LD R3, FIRST							; LOAD SECOND
	LD R2, MAX							; LOAD MAX
	ADD R4, R5,R3							; ADD CHAR TO NEG48
	BRz	OUTPUT							; IF ALREADY ZERO BREAK
	NOT R4, R4							; FLIP NUM
	ADD R2, R4, #1							; ADD NUMBERS AND ADD 1
	ADD R1, R3,R4							; COMPARE
	BRp	NEWMAX							; BREAK IF POSITIVE
	BR	AGAIN	 						; REPEAT

NEWMAX	ST R1, MAX							; LOAD MAX
	BR	AGAIN							; BREAK TO 'AGAIN'


	LD	R0,NEWLINE						; LOAD NEW LINE
	OUT								; DISPLAY NEW LINE

OUTPUT	LD	R0,NEWLINE						; LOAD NEW LINE
	OUT								; DISPLAY NEW LINE

	LEA	R0,MSG2							; LOAD MESSAGE 2
	PUTS								; DISPLAY MESSAGE 2

	LD R7, POS48							; LOAD POS48
	LD R4, MAX							; LOAD MAX
	ADD R3, R7,R4							; ADD
	OUT								; DISPLAY OUTPUT

	HALT								; HALT PROGRAM

; DATA AREA
	NEWLINE	.FILL		#10					; NEWLINE
	POS48	.FILL		#48
	NEG48	.FILL		#-48					; NEG48
	MSG1	.STRINGZ	"ENTER A SINGLE-DIGIT INTEGER. "	; MESSAGE 1
	MSG2	.STRINGZ	"THE LARGEST INTEGER IS: . "		; MESSAGE 2
	FIRST	.BLKW	1						; PLACE FOR 1ST NUM
	MAX	.BLKW	1						; PLACE FOR 2RD NUM

	.END								; END PROGRAM