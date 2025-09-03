title bag
.model small
.stack 100h

.code
MAIN:
 
    mov ah,2
    mov cx,200
    mov dl,20

print_loop:
    int 21h 
    inc dl
    dec cx
    jnz print_loop ;not zero jump
    mov ah,4ch


End  main

