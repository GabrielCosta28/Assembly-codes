title receberate0
.model small
.stack 100h
.data
    msg1 db 13,10,'DIGITE CARACTERES (QUANDO QUISER PARAR DIGITE ZERO):$'

.code
main PROC
    mov ax,@data
    mov ds,ax

    ; imprime a mensagem inicial
    mov ah,09h
    mov dx,offset msg1
    int 21h

loop_leitura:
    mov ah,01h      ; lê caractere (DOS já imprime)
    int 21h
    mov bl,al   ; armazena o caractere lido em bl
    cmp bl,'0'      ; se for '0', termina
    je fim
    jne loop_leitura

fim:
    mov ah,4Ch      ; encerra programa
    int 21h
main ENDP
end main
