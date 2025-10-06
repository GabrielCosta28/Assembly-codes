title lab08_4
.model small
.stack 100h
.data
    menu db 13,10, "ESCOLHA UMA OPCAO:,13,10,   1 - Ler Binario,13,10, 2 - Imprimir Binario,13,10,  3 - Ler Hexadecimal,13,10,     4 - Imprimir Hexadecimal,13,10,        Escolha: $"

      
        
       
    
    msg_bin_in db 13,10,"Digite uma sequencia binaria (0 e 1) e ENTER:$"
    msg_bin_out db 13,10,"Binario armazenado: $"
    msg_hex_in db 13,10,"Digite um numero hexadecimal (ate 4 digitos) e ENTER:$"
    msg_hex_out db 13,10,"Hexadecimal armazenado: $"

.code
main PROC
    mov ax, @data
    mov ds, ax

menu_principal:
    mov ah,09h
    lea dx,menu
    int 21h

    mov ah,01h       ; lê opção
    int 21h
    sub al,'0'       ; converte ASCII -> número

    cmp al,1
    je chamar_lebin
    cmp al,2
    je chamar_prinbin
    cmp al,3
    je chamar_lehex
    cmp al,4
    je chamar_prinhex
    jmp menu_principal

chamar_lebin:
    call ler_binario
    jmp menu_principal

chamar_prinbin:
    call imprimir_binario
    jmp menu_principal

chamar_lehex:
    call ler_hexadecimal
    jmp menu_principal

chamar_prinhex:
    call imprimir_hexadecimal
    jmp menu_principal

    mov ah,4Ch
    int 21h
main ENDP

;===================== PROCEDIMENTO 1 =====================
ler_binario PROC
    mov ah,09h
    lea dx,msg_bin_in
    int 21h
    xor bx,bx

lerb_loop:
    mov ah,01h
    int 21h
    cmp al,13
    je fim_ler_bin

    and al,0Fh
    shl bx,1
    or bl,al
    jmp lerb_loop

fim_ler_bin:
    ret
ler_binario ENDP

;===================== PROCEDIMENTO 2 =====================
imprimir_binario PROC
    mov ah,09h
    lea dx,msg_bin_out
    int 21h

    mov cx,16
prb_loop:
    rol bx,1
    jc imprime1
    mov dl,'0'
    jmp imprime
imprime1:
    mov dl,'1'
imprime:
    mov ah,02h
    int 21h
    loop prb_loop
    ret
imprimir_binario ENDP

;===================== PROCEDIMENTO 3 =====================
ler_hexadecimal PROC
    mov ah,09h
    lea dx,msg_hex_in
    int 21h
    xor bx,bx

lerh_loop:
    mov ah,01h
    int 21h
    cmp al,13
    je fim_ler_hex

    cmp al,'0'
    jl lerh_loop
    cmp al,'9'
    jle num
    cmp al,'A'
    jl lerh_loop
    cmp al,'F'
    jg lerh_loop

letra:
    sub al,55
    jmp conv
num:
    sub al,48
conv:
    shl bx,4
    or bl,al
    jmp lerh_loop

fim_ler_hex:
    ret
ler_hexadecimal ENDP

;===================== PROCEDIMENTO 4 =====================
imprimir_hexadecimal PROC
    mov ah,09h
    lea dx,msg_hex_out
    int 21h

    mov cx,4
prh_loop:
    rol bx,4
    mov al,bl
    and al,0Fh
    cmp al,9
    jg letra_hex
    add al,'0'
    jmp imprime_hex
letra_hex:
    add al,55
imprime_hex:
    mov dl,al
    mov ah,02h
    int 21h
    loop prh_loop
    ret
imprimir_hexadecimal ENDP

end main
