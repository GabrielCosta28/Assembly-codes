maiuscula_minuscula proc near
 ;passsagem por al e retorna por al
push bx 
push cx       
push dx
    
                     ;tem que ter  um lea bx no vetor 
    sub al ,41h     ;jogo caractere para -> ascii     
    xlat 
    RET

maiuscula_minuscula endp