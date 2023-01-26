.MODEL SMALL
.STACK 100H
.DATA  
t db 0 
                    
.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here 
    
; first two 
 ; a - bh
 ; b - bl
 
mov bh, 0 
mov bl, 1

mov cx, 7

fib:
   mov t, bl
   add bl, bh
   mov ah, 2
   mov dl, bh 
   add dl, 48
   int 21h
   mov bh, t
   
   cmp cl, 0 
   jz exit
   loop fib
   
;int 21h       
       
exit:
;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN

