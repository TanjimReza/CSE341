.MODEL SMALL
.STACK 100H
.DATA
a db ?
b db ?      
r db ?
msg1 db "?:$"
msg2 db 10,13, "A is bigger than 5$"
msg3 db 10,13, "A is less than 5$"
msg4 db 10,13, "a is $"

.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
    mov ah, 9
    mov dl, offset msg1 
    int 21h 
    
    mov ah, 1
    int 21h
    sub al, 48
    mov a, al 
    
    cmp a, 5
    jge big
    mov a, 5  
    mov ah, 9 
    mov dl, offset msg3
    int 21h
    
    mov ah, 9 
    mov dl, offset msg4
    int 21h 
    
    mov ah, 2
    mov dl, a
    add dl, 48 
    int 21h
    jmp exit
    
    big: 
        mov ah, 9 
        mov dl, offset msg2 
        int 21h 
        jmp exit
          
exit:     
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN

