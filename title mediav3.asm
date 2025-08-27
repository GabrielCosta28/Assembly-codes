title media.2inteiros
.model small
.stack 100h
.DATA
  DGT1 db 13,10,'Digite a primeira nota: $'
  DGT2 db 13,10,'Digite a segunda nota: $'
  RES  db 13,10,'Sua media e: $'

.CODE
MAIN PROC
    mov ax,@data
    mov ds,ax

    mov ah,09h
    mov dx,offset DGT1 ;exibe a msg dgt1
    int 21h

    mov ah,01h
    int 21h
    sub al,30h  ;funçao que converte ASCII para inteiro
    mov bl,al   ;guarda o primeiro numero em bl

    mov ah,09h
    lea dx,DGT2 ;exibe a msg dgt2
    int 21h

    mov ah,01h
    int 21h
    sub al,30h  ;funçao que converte ASCII para inteiro
    add bl,al   ;soma os dois numeros

    ;divisao por 2
   mov ax,0 ;zera ax
   mov al,bl ;coloca o resultado da soma em al
   mov bl,2 ;divisor de bl é 2
   div bl ; ax/bl quociente em al e resto em ah 


    add al,30h  ;funçao que converte inteiro para ASCII
    mov cl,al 

    

    mov ah,09h
    mov dx,offset RES
    int 21h

    mov ah,02h ;exibe o resultado  em dl
    mov dl,cl
    int 21h



    mov ah,4Ch
    main endp
    end MAIN    

end main

