.model small
.stack 100h
.data
msg1 db 10,13,"Digite seu caracter:$"
.code

main proc
    mov ax,@data
    mov ds,ax

    mov ah,09h
    lea dx,msg1
    int 21h;printa a msg1

    mov ah,01h
    int 21h;pede um caracter 

    xor ah,ah

    and al,0fh ;caractere vira numero 

    mov dx,ax ;jogo pra ax axumulador 

    cmp al,1  
    je vaicall

    dec dx

vaicall:
    call fat;chama o procedimento


    or ax,30h
    mov dx,ax;coloca o numero em dx e transforma pra caracter

    mov ah,02h
    int 21h;printa ele



main ENDP


fat proc
;ax como acumulador 
    
    mul dl ;ax recebe dl * al 
    dec dl ;dl = dl -1 

    jz fim ;se dl  for diferente de 0  contiuna dentro de fat   
            ;se for  = vai  ret 

    call fat

fim:

    ret ;esse ret volta pro normal main 
fat endp

end main