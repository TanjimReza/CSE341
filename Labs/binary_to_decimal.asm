;! Contributed by Ateya Shuborna

.MODEL SMALL
.STACK 100H 
.DATA
arr db "1234"
len db 4
p db 0
s dw 0 
.CODE
MAIN PROC
;iniitialize DS 
MOV AX,@DATA
MOV DS,AX
mov es,ax
; enter your code here
mov bx,0
mov ah,1
for:
int 21h
cmp al,0dh
je end
sub al,30h
shl bx,1
or bl,al
jmp for 
end:
mov ah,2
mov dl,bl
add dl,30h
int 21h     	
;exit to DOS
exit:          	
MOV AX,4C00H
INT 21H 
MAIN ENDP
	END MAIN
