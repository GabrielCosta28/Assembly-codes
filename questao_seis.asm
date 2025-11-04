questao_seis proc near
    PUSH CX            ; salva registradores usados
    PUSH AX

    XOR BH, BH         ; BH servirá como acumulador temporário
    MOV CL, 8          ; contador de 8 bits

INVERTE_LOOP:
    RCR BL, 1          ; desloca o bit menos significativo de BL -> CF
    RCL BH, 1          ; insere CF no bit mais significativo de BH
    DEC CL
    JNZ INVERTE_LOOP   ; repete até inverter os 8 bits

    MOV BL, BH         ; resultado final em BL

    POP AX
    POP CX
    RET
 
questao_seis endp