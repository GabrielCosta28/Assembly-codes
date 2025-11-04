questao_cinco proc near:
    ;push ax  ax passa o numero 
    push bx
    ;push cx ;cl passa a qtd de vezes 

    SHL ax,cl

    pop bx

questão_cinco endp