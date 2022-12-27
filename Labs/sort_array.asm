;! Contributed by Ateya Shuborna

include 'emu8086.inc'

 .model small

.data

    arr db 5 dup(?)

.code

main proc

    mov ax,@data

    mov ds,ax

    

    print "Enter 5 Number in Array:"

    

    mov cx, 5

    mov bx,offset arr

    mov ah, 1

    

    inputs:

    int 21h

    mov [bx], al

    inc bx

    loop inputs

    

    mov cx, 5

    dec cx

    

    OuterLoop:

    mov bx, cx

    mov si, 0    

    

    CompLoop:

    mov al,arr[si]

    mov dl,arr[si-1], al   

    cmp al,dl

    

    jc noSwap

    mov arr[si], dl

    mov arr[si+1], al

    

    noSwap: 

    inc si

    dec bx

    jnz CompLoop

    

    loop OuterLoop

    

    mov ah,2

    mov dl,10

    int 21h

    

    mov dl, 13

    int 21h

    

    print "After Sorting Array:"

    

    mov cx,5

    mov bx, offset arr

    

    Outputs:

    

    mov dl,[bx]

    mov ah, 2

    int 21h

    

    mov dl,32

    mov ah, 2

    int 21h

    

    inc bx

    loop Outputs

main endp 

 ret
