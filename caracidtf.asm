TITLE 03_2
.MODEL SMALL
.STACK 100h

.DATA
MSG_ESC DB 10,13, 'Digite a tecla ( esc ) para finalizar o programa.$'
MSG1 DB 10,13,'Digite um caractere: $'
MSG_NUM DB 10,13,'O caractere digitado e um numero.$'
MSG_LETRA DB 10,13,'O caractere digitado e uma letra.$'
MSG_OUTRO DB 10,13,'O caractere digitado e um caractere desconhecido.$'
MSG_FIM DB 10,13,'Fim do programa.$'

.CODE
start:
    MOV AX, @DATA
    MOV DS, AX

LOOP_PRINCIPAL:
    ; Mostrar a mensagem de entrada
    MOV AH, 9
    MOV DX, OFFSET MSG1
    INT 21h

    MOV DX, OFFSET MSG_ESC
    INT 21h

    ; Ler caractere
    MOV AH, 1
    INT 21h
    MOV BL, AL        ; Salva o caractere em BL
    CMP AL, 27        ; Verifica se é ESC
    JE FIM_PROGRAMA

    ; Verifica se é número ('0' a '9')
    CMP BL, '0'
    JB VER_LETRA
    CMP BL, '9'
    JBE EH_NUMERO

VER_LETRA:
    ; Verifica se é letra maiúscula ('A' a 'Z')
    CMP BL, 'A'
    JB VER_LETRA_MINUSCULA
    CMP BL, 'Z'
    JBE EH_LETRA

VER_LETRA_MINUSCULA:
    ; Verifica se é letra minúscula ('a' a 'z')
    CMP BL, 'a'
    JB NAO_EH_LETRA
    CMP BL, 'z'
    JBE EH_LETRA
    JMP NAO_EH_LETRA

EH_NUMERO:
    MOV AH, 9
    MOV DX, OFFSET MSG_NUM
    INT 21h
    JMP LOOP_PRINCIPAL

EH_LETRA:
    MOV AH, 9
    MOV DX, OFFSET MSG_LETRA
    INT 21h
    JMP LOOP_PRINCIPAL

NAO_EH_LETRA:
    MOV AH, 9
    MOV DX, OFFSET MSG_OUTRO
    INT 21h
    JMP LOOP_PRINCIPAL

FIM_PROGRAMA:
    MOV AH, 9
    MOV DX, OFFSET MSG_FIM
    INT 21h

    ; Finaliza programa
    MOV AH, 4Ch
    INT 21h
END start

