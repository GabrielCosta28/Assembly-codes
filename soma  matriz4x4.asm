TITLE matriz4x4
.MODEL SMALL
.STACK 100h

.DATA
    msg1 db 13,10,"Matriz A: $"
    msg2 db 13,10,"Matriz B: $"
    msg3 db 13,10,"Soma das matrizes (A + B): $"

    ; Matriz 4x4 A
    matrizA db 1,2,3,4
             db 4,3,2,1
             db 5,6,7,8
             db 8,7,6,5

    ; Matriz 4x4 B
    matrizB db 1,1,1,1
             db 2,2,2,2
             db 3,3,3,3
             db 4,4,4,4

    ; Matriz resultado (A + B)
    matrizSoma db 16 dup(?)

.CODE
main PROC
    mov ax, @data
    mov ds, ax

    ; Imprimir matriz A
    mov ah, 09h
    lea dx, msg1
    int 21h
    lea bx, matrizA
    call printar_matriz

    ; Imprimir matriz B
    mov ah, 09h
    lea dx, msg2
    int 21h
    lea bx, matrizB
    call printar_matriz

    ; Fazer soma das duas matrizes
    lea si, matrizA
    lea di, matrizB
    lea bx, matrizSoma
    call soma_matrizes

    ; Imprimir matriz soma
    mov ah, 09h
    lea dx, msg3
    int 21h
    lea bx, matrizSoma
    call printar_matriz

    ; Encerrar
    mov ah, 4Ch
    int 21h
main ENDP


;====================================================
; Procedimento: printar_matriz
; Exibe uma matriz 4x4 formatada (linhas e colunas)
; BX aponta para a base da matriz
;====================================================
printar_matriz PROC
    mov cx, 4        ; 4 linhas
    xor si, si       ; índice de posição zerado 

linha_loop:
    mov ah, 13       ; salto de linha
    mov dl, 10
    mov ah, 02h     ;printa carac
    int 21h

    mov ah, 02h
    mov dl, 13       ; retorno de carro
    int 21h

    mov ch, 4        ; 4 colunas

coluna_loop:
    mov al, [bx+si]
    add al, 30h       ; converte número p/ ASCII
    mov dl, al
    mov ah, 02h
    int 21h

    mov dl, ' '       ; espaço entre colunas
    mov ah, 02h
    int 21h

    inc si   ;prox coluna
    dec ch   ;dec o contador 
    jnz coluna_loop

    loop linha_loop
    ret
printar_matriz ENDP


;====================================================
; Procedimento: soma_matrizes
; Soma duas matrizes 4x4 (A + B -> resultado)
; SI = matrizA, DI = matrizB, BX = matrizSoma
;====================================================
soma_matrizes PROC
    mov cx, 16        ; 16 elementos
    xor ax, ax

soma_loop:
    mov al, [si]
    add al, [di]
    mov [bx], al

    inc si
    inc di
    inc bx
    loop soma_loop
    ret
soma_matrizes ENDP

END main
