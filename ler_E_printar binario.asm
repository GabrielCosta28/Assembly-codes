title lerbinario
.model small
.stack 100h
.data
    MSG1 db 13,10, "Digite uma sequencia de 0s e 1s (ENTER para terminar): $"
    MSG2 db 13,10, "Conteudo de BX em binario (16 bits): $"
.code
main proc
    mov ax, @data
    mov ds, ax

    ;--- Exibe mensagem inicial ---
    mov ah, 09h
    lea dx, MSG1
    int 21h

    xor bx, bx        ; zera BX (armazenará os bits)

ler_loop:
    mov ah, 01h       ; lê um caractere
    int 21h
    cmp al, 13        ; se for ENTER (código ASCII 13), sai
    je mostra_binario

    and al, 0Fh       ; converte ASCII '0'/'1' em número 0 ou 1
    shl bx, 1         ; desloca BX para a esquerda
    or  bl, al        ; insere o novo bit no LSB
    jmp ler_loop      ; volta a ler outro bit


mostra_binario:
    mov ah, 09h
    lea dx, MSG2    ;exube a mensagem 2
    int 21h

    mov cx, 16        ; vamos exibir 16 bits
print_loop:
    rol bx, 1         ; rota à esquerda (bit mais significativo vai para CF)
    jc imprime_1      ; se CF = 1 → imprime '1'

    ; senão imprime '0'
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp proximo

imprime_1:
    mov dl, '1'
    mov ah, 02h
    int 21h

proximo:
    loop print_loop   ; repete 16 vezes

fim:
    mov ah, 4Ch
    int 21h
main endp
end main
