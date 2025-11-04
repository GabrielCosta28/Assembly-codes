questao_dois  proc near
;ax é o numero a ser dividido 
;cl é a potencia de 2 a ser dividido
    push bx
    push dx

divisao:            ; ou nao faz o loop 
    SHR AX , 1              ;shr ax, cl 
    dec cl               
    jnz divisao 
    
    pop dx
    pop bx
    
     
questao_dois endp 
