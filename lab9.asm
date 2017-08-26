; Michael Masterson
; E00942993
; COSC 221 Sec. 0
; Lab 9
; December 4, 2014
; Write an LC3 program subroutine, name GETS,
; Which will allow an user input and store in
; memory a character string (length <= 9)
; until the newline character (10) is typed.
; the beginning address of the memory location
; where the string is to be stored is passed to
; subroutine in R1.
;
; Write program that calls the subroutine GETS
; to input a string and then uses PUTS to display
; it on screen.

	.ORIG x3000
;******MAIN************************************
	LEA R0, MSG1	;READ MSG1
	PUTS		;DISPLAY
	LEA R1, DIGIT	;READ
	JSR	GETS	;JUMP TO SUBROUTINE
	
	HALT		;HALT PROGRAM

;DATA AREA FOR MAIN
DIGIT	.BLKW	10	;STORAGE FOR ARRAY
MSG1	.STRINGZ  "ENTER 10 CHARACTERS: "

;*****SUBROUTINE*******************************
; Which will allow an user input and store in
; memory a character string (length <= 9)
; until the newline character (10) is typed.
; the beginning address of the memory location
; where the string is to be stored is passed to
; subroutine in R1.
;**********************************************
GETS	ST R1, SAVER1	;SAVE R1
	ST R2, SAVER2	;SAVE R2
	ST R7, SAVER7	;SAVE R7

	ADD R2, R2,#-10	;OFFSET

AGAIN	ADD R2, R2, #1	;INCREMENT R2
	BRz DONEM	;BREAK IF ZERO
	AND R0,R0,#1	;CLEAR R0(COUNTER)

	GETC		;GET CHAR
	OUT		;DISPLAY CHAR

	LD R5, NEG10	;LOAD NEG10
	ADD R0, R0,R5	;ADD NEG10 TO R0
	BRz DONEM	;BREAK IF ZERO
	
	ADD R0, R0, #10	;ADD 10 TO R0
	STR R0, R1, #0	;STORE
	ADD R1, R1, #1	;ADD 
	ADD R2, R2, #1	;
	;BRz DONEM	;BREAK IF ZERO
	BR AGAIN	;LOOP

DONEM	AND R0, R0, #0	;CLEAR REGISTER
	ADD R0, R0, #0	;CLEAR REGISTER
	STR R0, R1, #0	;STORE
	LEA R0, MSG2	;READ MSG2
	PUTS		;OUTPUT MSG2
	LEA R0, DIGIT	;READ DIGITS
	PUTS 		;DISPLAY DIGITS
	LD R1, SAVER1	;RETORE R1
	LD R2, SAVER2	;RESTORE R2
	LD R7, SAVER7	;RESTORE R7
	RET		;RETURN TO MAIN

; REGISTER STORAGE AREA FOR SUBROUTINE

SAVER1	.BLKW 1
SAVER2	.BLKW 1
SAVER7	.BLKW 1
NEWLINE	.FILL	#10
NEG10	.FILL	#-10
MSG2	.STRINGZ  "YOUR STRING: "
;**********************************************
	
	.END