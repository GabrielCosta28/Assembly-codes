title multsucessiva
.model small
.stack 100h
.data
    msg1 db 13,10, "Digite o primeiro numero: $"
    msg2 db 13,10, "Digite o segundo numero: $"
    msg3 db 13,10, "O resultado e: $"

.code
main proc
    mov ax,@data
    mov ds,ax

    ; --- Lê o primeiro número ---
    mov ah,09h
    lea dx,msg1
    int 21h

    mov ah,01h        ; lê caractere
    int 21h
    mov bl,al         ; guarda em BL
    and bl,0Fh        ; converte ASCII -> número

    ; --- Lê o segundo número ---
    mov ah,09h
    lea dx,msg2
    int 21h

    mov ah,01h        ; lê caractere
    int 21h
    mov cl,al         ; usa CL como contador
    and cl,0Fh        ; converte ASCII -> número

    ; --- Soma sucessiva ---
    xor bh,bh         ; resultado = 0
soma_loop:
    add bh,bl         ; resultado += primeiro número
    dec cl
    jnz soma_loop

    ; --- Imprime resultado ---
    mov ah,09h
    lea dx,msg3
    int 21h

    mov dl,bh
    add dl,30h        ; converte pra ASCII
    mov ah,02h
    int 21h

    ; --- Finaliza ---
    mov ah,4Ch
    int 21h

main endp
end main
