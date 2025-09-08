title soma5.asm
.model small
.stack 100h
.data
    msg1 db 13,10,'Digite um numero: $'
    msg2 db 13,10,'A soma dos numeros é: $'
    soma db 0          ; variável para guardar soma
.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 5          ; iniciala contador cx com 5 numeros
    mov bl, 0          ; acumulador

lernum:     
        ; pede número
        mov ah, 09h
        mov dx, offset msg1
        int 21h

        ; lê número
        mov ah, 01h
        int 21h
        sub al, '0'    ; ASCII vira número

        add bl, al     ; soma
    loop lernum    ;loop 5 vezes ate zerar o registrador cx

    ; guarda soma
    mov soma, bl

    ; imprime resultado
    mov ah, 09h
    mov dx, offset msg2
    int 21h

    mov al, soma
    add al, '0'        ; número -> ASCII
    mov dl, al
    mov ah, 02h
    int 21h

    ; encerra
    mov ah, 4Ch
    int 21h
main endp
end main
