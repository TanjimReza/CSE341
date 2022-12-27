.MODEL SMALL
.STACK 100H
.DATA 

a db ?


.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 

mov cx,0

mov ah,1
int 21h
mov cl,al
sub cl,30h 
mov si,0

input:
int 21h

mov a[si],al
inc si

loop input

mov ah,2

dec si

print:
mov dl,a[si]
sub dl,20h
dec si
int 21h
cmp si,0
jl exit
jmp print

exit:


;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN