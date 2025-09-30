title par/impar
.model small
.stack 100h
.data
    msg1 db 13,10, "Digite o primeiro numero: $"
    msg2 db 13,10, "Digite o segundo numero: $"
    msgpar db 13,10, "O numero eh PAR.$"
    msgimpar db 13,10, "O numero eh IMPAR.$"
.code
main proc
    mov ax,@data
    mov ds,ax

    ; --- Primeiro número ---
    mov ah,09h
    lea dx, msg1
    int 21h

    mov ah,01h
    int 21h
    and al,0Fh      ; converte ASCII → número
    mov bl,al        ; guarda primeiro número em BL

    ; --- Testa se é par ou ímpar ---
    test bl,01h      ; testa bit menos significativo
    jnz impar1       ; se != 0 → ímpar
par1:
    mov ah,09h
    lea dx, msgpar
    int 21h
    jmp ler_segundo

impar1:
    mov ah,09h
    lea dx, msgimpar
    int 21h

ler_segundo:
    ; --- Segundo número ---
    mov ah,09h
    lea dx, msg2
    int 21h

    mov ah,01h
    int 21h
    and al,0Fh
    mov bl,al

    ; --- Testa segundo ---
    test bl,01h
    jnz impar2
par2:
    mov ah,09h
    lea dx, msgpar
    int 21h
    jmp fim

impar2:
    mov ah,09h
    lea dx, msgimpar
    int 21h

fim:
    mov ah,4Ch
    int 21h

main endp
end main
