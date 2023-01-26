MODEL SMALL
 
.STACK 100H
.DATA
msg db "Enter one number: $"   
ans db "You entered $"   
abig db "a big$"
bbig db "b big$" 
cbig db "c big$"  
a db ?
b db ? 
c db ? 
sum db ?
.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
  ;enter your code here
    mov ah, 9 
    lea bx, msg
    mov dx, bx
    int 21h  
    
    mov ah, 1
    int 21h  
    mov a, al 
    
    mov ah, 2
    mov dl, 10 
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9 
    lea bx, msg
    mov dx, bx
    int 21h  
    mov ah, 1
    int 21h 
    mov b, al    
    
    mov ah, 2
    mov dl, 10 
    int 21h
    mov dl, 13
    int 21h

    mov ah, 9 
    lea bx, msg
    mov dx, bx
    int 21h  
    mov ah, 1
    int 21h 
    mov c, al    
        
    mov ah, a 
    mov al, b 
    mov bh, c
    
    cmp ah, al 
    jge ac
    
    cmp al, bh 
    jge bc
    ac: 
        cmp ah, bh
        jge printa
        jmp printc 
    bc: 
        cmp al, bh
        jge printb
        jmp printc
    
    printa:
        mov ah, 2
        mov dl, 10
        int 21h 
        mov dl, 13
        int 21h
        mov ah, 9 
        lea bx, abig
        mov dx, bx
        int 21h 
        jmp exit            
    printb:
        mov ah, 2
        mov dl, 10
        int 21h 
        mov dl, 13
        int 21h
        mov ah, 9 
        lea bx, bbig
        mov dx, bx
        int 21h 
        jmp exit                     
    printc:
        mov ah, 2
        mov dl, 10
        int 21h 
        mov dl, 13
        int 21h
        mov ah, 9 
        lea bx, cbig
        mov dx, bx
        int 21h 
        jmp exit
exit:                 
;exit to DOS
lesscheck: 
        mov ah, a 
        mov al, b 
        mov bh, c
        cmp ah, al
        jle acless
        cmp al, bh
        jle pbless
        
        pcless:  
            mov ah, 2
            mov dl, 10
            int 21h 
            mov dl, 13
            int 21h
            mov ah, 2
            mov dx, "c"
            int 21h
            jmp finally
    acless:
        cmp ah, bh
        jle paless
        jmp pcless
    paless:    
        mov ah, 2
        mov dl, 10
        int 21h 
        mov dl, 13
        int 21h
        mov ah, 2 
        mov dx, "a" 
        int 21h 
        jmp finally
    pbless:   
        mov ah, 2
        mov dl, 10
        int 21h 
        mov dl, 13
        int 21h
        mov ah, 2 
        mov dx, "b"
        int 21h 
        jmp finally
    
      
        

finally:                  
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
