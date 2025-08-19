title soma2num
.model small
.data
    msg1 db 'Digite o primeiro numero: $'
    msg2 db 13,10,'Digite o segundo numero: $'
    msg3 db 13,10,'A soma e: $'
.code
    main proc

        mov ax, @data
        mov ds, ax

        mov ah,09h
        lea dx, msg1
        int 21h

        mov ah,01h
        int 21h
        sub al, '0'          ; Converte de ASCII para inteiro
        mov bl, al          ; Guarda o primeiro número em BL

        mov ah,09h
        lea dx, msg2
        int 21h

        
        mov ah,01h
        int 21h
        sub al, '0'          ; Converte de ASCII para inteiro
        mov bh, al          ; Guarda o primeiro número em BL


        add bl,bh
        mov ah, 09h


        lea dx, msg3
        int 21h 

       add bl, '0'       ; converte número para ASCII primeiro
     mov dl, bl        ; coloca o resultado em DL
     mov ah, 02h       ; função de imprimir caractere
     int 21h


        

        mov ah,4Ch
        int 21h 

        







        
    main endp
end main
     