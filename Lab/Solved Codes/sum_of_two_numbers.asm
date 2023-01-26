.MODEL SMALL
 
.STACK 100H

.DATA
a db ?
b db ?      
r db ?
msg1 db "?:$"
msg2 db 10,13, "THE SUM OF$"
msg3 db "and $"
msg4 db "is $"

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
     sub al, 48
     mov a, al
     
     mov ah, 1
     int 21h
     sub al, 48 
     mov b, al    
     
     mov ah, a 
     mov al, b
     add ah, al
     mov r, ah
     
     mov ah, 9 
     mov dx, offset msg2
     int 21h      
                 
     mov ah, 2  
     mov dl, a  
     add dl, 48
     int 21h 
     
     mov ah, 9 
     mov dl, offset msg3
     int 21h 
     
     mov ah, 2
     mov dl, b  
     add dl, 48
     int 21h 
     
     mov ah, 9 
     mov dl, offset msg4
     int 21h 
     
     mov ah, 2
     mov dl, r  
     add dl, 48
     int 21h
                 
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
