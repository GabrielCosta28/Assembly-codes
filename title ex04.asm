title ex04
.model small
.stack 100h

.data
    pulalinha db 13, 10, '$'    ; Nova linha para função 09h

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 26         ; número total de letras minúsculas
    mov al, 'a'        ; começa pela letra 'a'
    mov bl, 0          ; contador de letras por linha

print_loop:
    ; imprime a letra atual (AL)
    mov ah, 02h
    mov dl, al
    int 21h

    inc al             ; próxima letra
    inc bl             ; incrementa contador de letras por linha

    cmp bl, 4
    jne novalinha      ; se ainda não imprimiu 4, continua

    ; imprime nova linha (CR+LF) usando função 09h
    mov ah, 09h
    lea dx, pulalinha
    int 21h

    mov bl, 0          ; zera contador de letras por linha

novalinha:
    loop print_loop    ; repete até cx = 0

    ; imprime linha final (só por estética)
    mov ah, 09h
    lea dx, pulalinha
    int 21h

    ; finaliza programa
    mov ah, 4Ch
    int 21h
end main
