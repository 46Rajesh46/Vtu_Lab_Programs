.MODEL small 
.STACK 100h 
.DATA 
messl DB 10, 13, 'Today is $' ; 1041, 13=CR 

.CODE 
Today PROC 
MOV AX, @data 
MOV DS, AX 
MOV DX, OFFSET messl
MOV AH, 09h
INT 21H

MOV AH,2AH
INT 21H
PUSH CX
MOV CX,0
MOV CL, DL 
PUSH CX
MOV CL,DH
PUSH CX
MOV DH, 0
	;DISPLAY MONTH
MOV DX, 0
POP AX
MOV CX,0
MOV BX,10

DIVIDEM:DIV BX
PUSH DX
ADD CX,1
MOV DX, 0
CMP AX, 0
JNE DIVIDEM

DIVDISPM:POP DX
ADD DL,30h
MOV AH, 02h
INT 21H
LOOP DIVDISPM
MOV DL,'/'
MOV AH,02h
INT 21H
	;DISPLAY DAY
MOV DX, 0
POP AX
MOV CX,0
MOV BX,10

DIVIDED:DIV BX
PUSH DX
ADD CX,1
MOV DX,0
CMP AX,0
JNE DIVIDED

DIVDISPD:POP DX
ADD DL,30H
MOV AH,02H
INT 21H
LOOP DIVDISPD
MOV DL,'/'
MOV AH,02H
INT 21H
	;DISPLAY YEAR
MOV DX,0
POP AX
MOV CX,0
MOV BX,10
DIVIDEY:DIV BX
PUSH DX
ADD CX,1
MOV DX,0
CMP AX,0
JNE DIVIDEY

DIVDISPY:POP DX
ADD DL,30H
MOV AH,02H
INT 21H
LOOP DIVDISPY

MOV AL,0
MOV AH,4CH
INT 21H
TODAY ENDP
END TODAY