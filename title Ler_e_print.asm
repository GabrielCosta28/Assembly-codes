title Ler_e_print
.model small
.stack 100h
.data
    msg1 db 13,10, "Digite um caractere: $"
     msg2 db 13,10, "Voce digitou: $"
.code

main proc

    MOV AX,@data
    MOV DS, AX

    MOV AH,09h
    LEA DX , msg1
    int 21h

    MOV AH,01
    INT 21h ;AO SCANEAR , A F(x) AH GUARDA O VALOR DIGITADO EM AL
    MOV BL,AL   ;GUARDO EM BL

    mov ah, 09h
    lea dx, msg2
    int 21h

    ; Exibe o caractere que está em BL
    mov ah, 02h
    mov dl, bl
    int 21h

    ; Finaliza o programa
    mov ah, 4Ch
    int 21h

    
main ENDP
end main