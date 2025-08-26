title numero.ou.nao
.model small
.stack 100h

.data
    msg1 db 13,10, 'Digite um caractere .$'
    enumero db 13,10, 'O caractere e numero.$'
    nnumero db 13,10, 'O caractere nao e numero.$'

.code
start:
    mov ax, @data
    mov ds, ax

    ; exibe mensagem inicial
    mov ah, 09h
    mov dx, offset msg1
    int 21h

    ; le um caractere
    mov ah, 01h
    int 21h     
    mov bl, al           ; caractere lido fica em AL

    ; testa se é numero
    cmp bl, 30h
    jb nao_e_numero
    cmp bl, 39h
    ja nao_e_numero

    ; se for numero
    mov ah, 09h
    mov dx, offset enumero
    int 21h
    jmp fim

nao_e_numero:
    mov ah, 09h
    mov dx, offset nnumero
    int 21h

fim:
    mov ah, 4Ch
    int 21h

end start
