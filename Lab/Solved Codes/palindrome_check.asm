.model small
.data
.stack 100h

    ; add your data here!
    s db "input length: $"
    yes db " Palindrome$"
    no db " Not a Palindrome $"
    a db 100 dup(?)
    p db " input string:$"

.code
main proc

    mov ax,@data
    mov ds, ax
   
    mov ah,9
    lea dx,s
    int 21h
   
    mov ah,1
    int 21h
    mov bl,al
    sub bl,30h
    and bh,0
   
    mov ah,9
    lea dx,p
    int 21h
   
    mov cx,bx
    mov si, 0
    mov ah,1
   
    input:
    int 21h
    mov dl,al
    mov a[si],dl
    inc si
    loop input

   
    mov cx,bx
    mov si, 0
   
    start:
    mov dl, a[si]
    mov dh, 0
    push dx
    inc si
    loop start

    mov cx,bx
    mov si, 0
   
    check:
    pop dx      
    mov dh, 0
    cmp a[si], dl
    jne nomatch
    inc si
    loop check

    mov ah, 9
    lea dx, yes
    int 21h
    jmp exit
      
    nomatch:
    mov ah, 9
    lea dx, no
    int 21h
     
;exit to DOS
exit:              
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN

