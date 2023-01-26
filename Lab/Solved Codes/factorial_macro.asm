;! Contributed by Ateya Shuborna

.model small
factorial macro var1
    mov cx, var1
    mov ax, 1
    fact:
    mov bl,cx
    mul bl
    loop fact
endm
.stack 100h
.data
a db 5
b db 5 dup(?)
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    factorial a
