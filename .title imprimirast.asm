title imprimirasterisco
.model small
.stack 100h
.data
    msg1 db 13,10, 'Digite um numero de 0 a 9:$'

.code 
main PROC

    mov ax,@data
    mov ds,ax

    mov ah,09h          ;imprime string msg1
    mov dx,offset msg1
    int 21h

    mov ah,01h          ;le um caractere inserido pelo usuario
    int 21h
    sub al,30h          ;converte o caractere para numero
    mov bl,al          ;inicializa o contador com o numero lido
   
    mov cl,bl          ;incializa o contador com valor em bl
   

imprimir:
     mov dl,'*'   ;caractere a ser impresso
    
    mov ah,02h          ;FUNCAO DO INT21H QUE IMPRIME UM CARACTERE
    int 21h
    dec cl     ;decrementa cx e repete se cl 
    jnz imprimir    ;se cl diferente de zero


    mov ah,4Ch         ;finaliza o programa
    int 21h
    


main ENDP
end main
