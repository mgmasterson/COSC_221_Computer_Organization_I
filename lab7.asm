; Michael Masterson
; E00942993
; COSC 221 SEC. 0
; LAB 7
; NOVEMBER 6, 2014

; WRITE AN LC-3 ASSEMBLY LANGUAGE PROGRAM TO READ IN A
; TWO-DIGIT NUMBER WHOSE DIGITS ADD UP TO LESS THAN 10
; AND DISPLAY THE SUM OF THOSE DIGITS IN THE NEXT LINE.

	.ORIG	x3000			; WHERE PROGRAM WILL START
	
	LEA R0, MSG1			; LOAD MESSAGE 1
	PUTS				; DISPLAY MESSAGE 1
	
	GETC				; READ CHAR1
	OUT				; ECHO CHAR1
	ST R0,CHAR1			; STORE CHAR1

	GETC				; READ CHAR2
	OUT				; ECHO CHAR2
	ST R0,CHAR2			; STORE CHAR2

	LD R0,NEWLINE			; LOAD NEW LINE
	OUT				; RETURN NEW LINE

	LEA R0, MSG2			; LOAD MESSAGE 2
	PUTS				; DISPLAY MESSAGE 2

	LD R1, NEG48			; LOAD NEG48
	LD R0, CHAR1			; LOAD CHAR1
	ADD R4, R1,R0			; ADD CHAR1 TO NEG48
	ST R4, CHAR3			; STORE CHAR3
	
	LD R1, NEG48			; LOAD POS48
	LD R0, CHAR2			; LOAD CHAR1
	ADD R5, R1,R0			; ADD CHAR1 TO NEG48
	ST R5, CHAR4			; STORE CHAR4				

	LD R7, POS48			; LOAD POS48
	LD R5,CHAR4			; LOAD CHAR4
	LD R4, CHAR3			; LOAD CHAR3
	ADD R1, R5,R4			; ADD CHAR 3 AND CHAR4
	ADD R0, R1, R7			; CONVERT TO POS48
	OUT				; DISPLAY RESULT

	HALT				; HALT PROGRAM

; DATA AREA	

	POS48	.FILL 		#48	; POSITIVE 48
	NEG48	.FILL		#-48	; SUBTRACT 48 FROM CURRENT CHAR
	NEWLINE	.FILL		#10	; NEW LINE
	MSG1	.STRINGZ	"PLEASE ENTER A TWO-DIGIT DECIMAL NUMBER. " 	; MESSAGE1
	MSG2	.STRINGZ	"THE SUM OF THE DIGITS IS. "			; MESSAGE2
	CHAR1	.BLKW		1	; PLACE FOR CHAR1
	CHAR2	.BLKW		1	; PLACE FOR CHAR2
	CHAR3	.BLKW		1	; PLACE FOR CHAR3
	CHAR4	.BLKW		1	; PLACE FOR CHAR4

	.END				; END PROGRAM