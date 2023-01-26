
.MODEL SMALL
.STACK 100H
.DATA
l db ?
b db ?      
r db ?
msg1 db "Enter Length:$"
str db ?

 
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
    add al, 1
    mov l, al
    
    mov ah, 2 
    mov dx, 10 
    int 21h 
    mov ah, 2
    mov dx, 13
    int 21h
    ; loop 
    
    mov cl, l 
    mov si, 0 
    loopstart: 
       mov ah, 1
       int 21h 
       mov str[si], al
       inc si 
       dec cl
       jnz loopstart

output:  
    mov cl,l
    mov ah,2
    mov si,5
    start:
        mov dl, str[si]
        int 21h
        sub si, 1
        dec cl
        jnz start

exit:     
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN

