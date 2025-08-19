title converter                   ; Título do fonte (informativo para o assembler)
.model small                      ; Modelo de memória: 1 segmento de código + 1 de dados
.stack 100h                       ; Reserva 256 bytes para a pilha (stack)

.data
    mensagem1 db 'Digite uma letra minuscula: $'                ; String exibida pelo serviço 09h (termina em '$')
    mensagem2 db 13,10, 'Letra maiuscula correspondente: $'     ; 13=CR, 10=LF (pula linha), também termina em '$'

.code
main PROC                         ; Início do procedimento principal (ponto de entrada)

    mov ax, @data                 ; AX <- endereço do segmento .data
    mov ds, ax                    ; DS <- AX  (inicializa o segmento de dados)

    ; -------- imprime a mensagem 1 --------
    mov ah, 09h                   ; AH=09h -> função do int 21h para imprimir string terminada por '$'
    lea dx, mensagem1             ; DX <- offset (endereço) de 'mensagem1'
    int 21h                       ; Chama DOS: imprime a string em DX até o '$'

    ; -------- lê um caractere --------
    mov ah, 01h                   ; AH=01h -> função do int 21h para ler 1 caractere do teclado (ecoado na tela)
    int 21h                       ; Chama DOS: AL recebe o código ASCII digitado
    mov bl, al                    ; BL <- AL (guarda o caractere lido em BL para usar depois)

    ; -------- converte minúscula -> maiúscula --------
    ; Em ASCII, 'a'..'z' (97..122) viram 'A'..'Z' (65..90) subtraindo 32
    sub bl, 32                    ; BL <- BL - 32 (transforma 'a' em 'A', 'b' em 'B', etc.)

    ; -------- imprime a mensagem 2 --------
    mov ah, 09h                   ; AH=09h -> imprimir string
    lea dx, mensagem2             ; DX <- offset de 'mensagem2'
    int 21h                       ; Chama DOS: imprime a mensagem 2

    ; -------- imprime o caractere convertido --------
    mov dl, bl                    ; DL <- BL (o caractere a ser impresso deve ir em DL)
    mov ah, 02h                   ; AH=02h -> função do int 21h para imprimir 1 caractere em DL
    int 21h                       ; Chama DOS: imprime o caractere de DL

    ; -------- encerra o programa --------
    mov ah, 4Ch                   ; AH=4Ch -> função do int 21h para terminar o programa
    int 21h                       ; Retorna ao DOS

main ENDP                         ; Fim do procedimento 'main'
END main                          ; Diz ao assembler que o ponto de entrada é o rótulo 'main'

