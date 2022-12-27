.model small
macro parenthesis str 
mov dx,"@"
push dx
and dx,0	
mov si,0	
loop:
mov bl,str[si]
cmp bl,"\"
je check
cmp bl,"("
je append
cmp bl,"{"
je append
cmp bl,"["
je append
cmp bl,")"
je see(
cmp bl,"}"
je see{
cmp bl,"]"
je seet
inc si
jmp loop
append:
mov dl,bl
and dh,0
push dx
inc si
jmp loop 
see(:
pop dx
cmp dl,"("
jne nomatch
inc si
jmp loop
see{:
pop dx
cmp dl,"{"
jne nomatch
inc si
jmp loop
seet:
pop dx
cmp dl,"["
jne nomatch
inc si
jmp loop
check:
pop dx
cmp dl,"@"
je match
jne nomatch
match:
lea dx,right
mov ah,9
int 21h
jmp exit
nomatch:
lea dx,wrong
mov ah,9
int 21h
jmp exit
 
 	endm
.data
 
wrong db "no match$"
right db "match$"
 
ARR DB "10+(3+5)}\$"
.stack 300h
.code
mov ax, @data
mov ds, ax
mov es, ax
parenthesis arr
exit:
MOV AX,4C00H
INT 21H
