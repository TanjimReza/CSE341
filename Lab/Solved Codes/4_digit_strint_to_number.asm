;! Contributed by Ateya Shuborna

.MODEL SMALL
macro power b,p	
cmp p,0
je edge:    	
mov al,1
mov bl,b
mov bh,0
loop:
cmp bh,p
je multi
mul bl
inc bh
jmp loop
edge:
mov ax,1
jmp multi
endm
.STACK 100H
.DATA
arr db "1234"
len db 4
p db 0
s dw 0 
.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
mov es,ax
; enter your code here
and dx,0
and cx,0
and bx,0
mov cl,len
sub cl,1
mov si,0
start:
mov bl,10
and ax,0
cmp cl,-1
je exit
mov bh,arr[si]
sub bh,30h
mov p,bh     	
power bl,cl
multi:
mov bl,p
mov bh,0
mul bx
mov dx,s
add dx,ax
mov s,dx
inc si
dec cl
jmp start      	
;exit to DOS
exit:          	
MOV AX,4C00H
INT 21H
MAIN ENDP
	END MAIN