;! Contributed by Ateya Shuborna

.MODEL SMALL
macro power b,p	
cmp p,0
je edge:    		
mov al,1
mov bl,b
mov bh,0 
loop:
cmp bh,p
je exit
mul bl
inc bh
jmp loop
edge:
mov ax,1
jmp exit 
endm
.STACK 100H
.DATA
bin db "111$" 
ARR DB 50 DUP(?)
.CODE
MAIN PROC 
;iniitialize DS 
MOV AX,@DATA
MOV DS,AX
mov es,ax 
; enter your code here
and dx,0
and cx,0
and ax,0
and bx,0 
;;
mov bl,2
mov cl,3
power bl,cl
;exit to DOS
exit:
mov dx,ax
add dx,30h
mov ah,2
int 21h         	
MOV AX,4C00H
INT 21H
MAIN ENDP
	END MAIN

