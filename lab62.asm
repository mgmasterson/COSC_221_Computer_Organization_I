; Michael Masterson
; E00942993
; COSC 221
; Lab 6
; October 30, 2014
; Write an LC-3 assembly language program to read in the
; first, middel, and the last initial of a person's name in
; lower-case characters and then display them down the left
; margin in upper-case characters.

	.ORIG x3000

	LEA	R0,MSG1
	PUTS

	GETC
	OUT
	ST	R0,CHAR

	LD	R0,NEWLINE
	OUT

	LEA	R0,MSG2
	PUTS

	LD	R0,CHAR
	LD	R2,NEG32
	ADD	R0,R0,R2
	OUT

;DATA AREA
	
	NEG32	.FILL	#-32
	NEWLINE	.FILL	#10
	MSG1	.STRINGZ	"YOU NEED TO ENTER A LOWERCASE CHARACTER. "
	MSG2	.STRINGZ	"HERE'S THE UPPERCASE CHARACTER. "
	CHAR	.BLKW	1

	.END