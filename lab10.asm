; Michael Masterson

; E00942993

; COSC 221 Sec. 0

; Lab 10

; December 12, 2014

; Write an LC3 assembly program that calls a 

; subroutine, name BITCNT, to count the number

; of 1's in a bit string stored in a word in

; memory. The address of the word is passed to

; the subroutine in register R1 and the total

; count is returned by the subroutine in

; register R0.

	
	.ORIG x3000

;******MAIN************************************
	

	LEA R1, WORD	;READ STRING
	JSR	BITCNT	;JUMP TO SUBROUTINE
	
	ST R0,COUNT	;STORE COUNT
	LEA R0, MSG	;READ MSG
	PUTS		;DISPLAY MESSAGE
	LD R0, COUNT	;LOAD COUNTER
	LD  R2, POS48	;LOAD POS48
	ADD R0, R0, R2	;ADD
	OUT

	HALT		;HALT PROGRAM



;DATA AREA FOR MAIN

WORD	.FILL	xF102
POS48	.FILL	#48
MSG		.STRINGZ	"BIT COUNT IS: "
COUNT	.BLKW	1

;*****SUBROUTINE***********************************

; Counts the number of 1's in a bit string stored *

; in a word in memory. The address of the word is *

; passed to the subroutine in R1 and the total    *

; count is returned in R0			  *

;**************************************************

BITCNT	ST R1, SAVER1		;SAVE R1
		
	ST R2, SAVER2		;SAVE R2
	AND	R0,R0,#0	;CLEAR COUNTER
		
	LD R5,POS15		;LOAD POS15

		
	LDR R2,R1,#0		;LOAD WORD

LOOP 	ADD R2,R2, #0		; PUT INTO SCOP
	BRn LOOP2		;BREAK TO LOOP
	ADD R2,R2,R2		;SHIFT SPOT
	ADD R3,R3,#-1		;DECREMENT COUNTER
	BRz DONE		;BREAK IF ZERO
	BR	LOOP		;BREAK TO LOOP

LOOP2	ADD R0,R0,#1		;INTIALIZE COUNTER
	ADD R2,R2,R2		;SHIFT SPOT
	ADD R3,R3,#-1		;DECREMENT COUNTER
	BR LOOP			;BREAK TO LOOP

DONE	LD R1, SAVER1		;LOAD SAVER1
	LD R2, SAVER2		;LOAD SAVER2

	RET			;RETURN TO MAIN




; REGISTER STORAGE AREA FOR SUBROUTINE


SAVER1	.BLKW 1

SAVER2	.BLKW 1
POS15	.FILL #15

;**********************************************
	
	
	.END
