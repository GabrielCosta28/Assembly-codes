title ex02
.model small
.stack 100h
.data
    msg1 db 'ESSE ALGORITIMO IMPRIME 50 * USANDO LOOP$'
.code 
Main proc

    MOV ax,@data
    Mov ds,ax

    mov ah,09h
    mov dx, offset msg1
    int 21h


    mov CX,50 ;INICIALIZA COM 50 O CONTADOR CX

IMPRESSÃO:


    mov ah,02h
    mov dl,'*'
    int 21h
loop IMPRESSÃO



main endp
end main
