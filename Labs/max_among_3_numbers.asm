
;! Contributed by Ateya Shuborna

.model small
macro max n1,n2,n3	
mov bx,n1
mov cx,n2
mov dx,n3    	 
cmp bx,cx
jg n1gn2
jmp n2gn1
n2gn1:
cmp cx,dx
jg n2g
jmp n3g 
n1gn2:
cmp bx,dx
jg n1g
jmp n3g
n1g:
mov ax,n1
jmp max 
n3g:
mov ax,n3
jmp max 
n2g:
mov ax,n2
jmp max
max:
mov dx,ax
add dx,30h
mov ah,2
int 21h 
 endm
.data 
A dw 9
B dw 5
C dw 7 
.stack 3000h 
.code
mov ax, @data
mov ds, ax
mov es, ax 
max A,B,C 
exit:
MOV AX,4C00H
INT 21H
