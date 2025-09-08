title ex01_sem_loop
.model small
.stack 100h

.data
    msg1 db 13, 10, 'ESTE ALGORITIMO IMPRIME 50 * NA MESMA LINHA E DEPOIS PULA', 13, 10, '$'
    asterisco db '*'

.code
main proc
    MOV ax, @data
    MOV ds, ax

    ; Exibe mensagem msg1
    mov ah, 09h
    mov dx, offset msg1
    int 21h

    
    mov cx, 50 ;inicializa o contador cx em 50
mesmalinha:
    mov ah, 02h
    mov dl, '*'
    int 21h

    dec cx          ; decrementa cx
    jnz mesmalinha  ; salta para mesmalinha enquanto cx != 0

    ; Imprime 50 '*' em linhas separadas usando DEC CX e JNZ
    mov cx, 50
pularlinha:
    mov ah, 02h
    mov dl, '*'
    int 21h

    ; imprime CR (13)
    mov dl, 13
    mov ah, 02h
    int 21h

    ; imprime LF (10)
    mov dl, 10
    mov ah, 02h
    int 21h

    dec cx
    jnz pularlinha

    
    mov ah, 4Ch
    int 21h
main endp
end main
