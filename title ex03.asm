title ex03
.model small
.stack 100h
.data
    msg1 db 'esse algoritimo imprime todas as letras maiusculas e minusculas na tela:$'
.code 
 
 main proc
    mov ax,@data
    mov ds,ax

    mov ah,09
    mov dx, offset msg1
    int 21h
    

    mov cx,26
    mov al,'A'
   

 
letras:
    mov ah, 02h
    mov dl,al
    int 21h
    inc al
    loop letras 
    

    mov cx,26
    mov al, 'a'

letrasminusculas:
    mov ah, 02h
    mov dl,al
    int 21h
    inc al
    loop letrasminusculas







end main
main endp