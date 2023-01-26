# NUMBER ODD/EVEN
.MODEL SMALL
 
.STACK 100H

.DATA
a dw ?
b db ?    
msg1 db "Enter Number: $"
evenmsg db 10,13, "Number is Even$"
oddmsg db 10,13, "Number is Odd$" 
.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

    mov ah, 9 
    mov dx, offset msg1
    int 21h 
    
    mov ah, 1
    int 21h
    mov a, ax

    ; CHECK 
    mov ax, a
    mov bl , 2   
    
    div bl ; rem -> ah, res -> al
    
    cmp ah, 0 
    jz printeven
    mov ah, 9 
    mov dx, oddmsg offset
    int 21h 
    jmp exit:
    
    printeven:
        mov ah, 9 
        mov dx, evenmsg offset
        int 21h 
        jmp exit    
exit:     

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN

