.MODEL SMALL
.STACK 100H
.DATA
A DB 7,3,1,2,5    
B DB ?
.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov dx,0 
FIRST:
cmp dx,5  ; LOOP LIMIT 5
jge SHOWRESULT  ; IF DX >= 5 then SHOW OUTPUT
 
mov cx,0  ; STARTING WIH 0 
SECOND:
    cmp cx,dx ; CHECK CX & DX
    jg TEMP   ; IF Greater then dl+1 and FIRST LOOP 
    mov si,dx ; Else, get DX into SI 
    
    mov bh,a[si]  ; Current i of ARRAY = A[i]
    
    mov si,cx     ; FOR THE NEXT ITEM 
    
    mov bl,a[si]  ; Current next(cx) of ARRAY = A[j]
    
    
    cmp bh,bl    ; CHECK IF BH <= BL ; Then A[i] <= A[j], Need to Change Position
    jle CHANGEPOS  ; Go to Change Position                
    inc cx   ;   Increase CX to check with the next-next item ++
    jmp SECOND ; REPEAT

TEMP:
    inc dl
    jmp FIRST

CHANGEPOS:
    mov si,dx     ;   DX = Current
    mov a[si],bl  ;   BL = Value Store
    
    mov si,cx     ; CX = Next One
    mov a[si],bh  ; BH = Prev Value Store
    inc cx
    jmp SECOND


SHOWRESULT:
    mov cx,5      ; RESET
    mov ah,2
    mov si,0

PRINTOUTPUT:
    mov dl,a[si]   ; PRINT OUTPUT    
    add dl,30h
    int 21h   
    
   ; mov AX, B
;    add DX, 30h
;    int 21h
    
    add si,1
    loop PRINTOUTPUT


mov cl, 5
mov si, 4
output:
    mov ah, 2
    mov dl, a[si]
    add dl, 30h
    int 21h    
    
    sub si, 1
    loop output

;exit to DOS
exit:              
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
