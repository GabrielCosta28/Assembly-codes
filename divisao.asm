title aula07ex01
.model small
.stack 100h

.data 
    msg1 db 13,10, "Digite o numero a ser dividido: $"
    msg2 db 13,10, "Digite o divisor: $"
    msgq db 13,10, "O quociente e: $"
    msgr db 13,10, "O resto e: $"

.code
main proc 
    
    mov ax,@data
    mov ds,ax

   
    mov ah,09h   ; Lê o dividendo 
    lea dx,msg1
    int 21h

    mov ah,01h
    int 21h         ; lê caractere
    mov bl,al       ; guarda dividendo
    and bl,0Fh      ; converte ASCII p/ número

   
    mov ah,09h   ; Lê o divisor 
    lea dx,msg2
    int 21h

    mov ah,01h      ;guarda em al 
    int 21h         ; lê caractere
    and al,0Fh      ; converte ASCII p/ número

    xor cx,cx       ; CX = 0 (resultado)

Subtracaosucessiva:
    cmp bl,al       ; se BL < AL, sai do loop
    jb fim_divisao

    sub bl,al       ; BL = BL - AL guarda 
    inc cx          ; incrementa quociente
    jmp Subtracaosucessiva   

fim_divisao:

    
    mov ah,09h
    lea dx,msgq     ; imprime quociente ---
    int 21h

    mov ax,cx       ; copia quociente
    or al,30h      ; converte p/ ASCII
    mov dl,al

    mov ah,02h      ;printa caractere
    int 21h

   
    mov ah,09h
    lea dx,msgr      ; --- imprime resto ---
    int 21h

    or bl,30h      ; converte resto p/ ASCII
    mov dl,bl
    
    mov ah,02h
    int 21h

    ; --- encerra programa ---
    mov ah,4Ch
    int 21h

main endp
end main
