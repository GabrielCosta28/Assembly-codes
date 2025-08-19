title converter
.model small
.stack 100h

.data
    mensagem1 db 'Digite uma letra minuscula: $'
    mensagem2 db 13,10, 'Letra maiuscula correspondente: $'

.code
main PROC
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, mensagem1
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al

    sub bl, 32

    mov ah, 09h
    lea dx, mensagem2
    int 21h

    mov dl, bl
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h

main ENDP
END main
