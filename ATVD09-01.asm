TITLE invertervetor
.MODEL SMALL
.STACK 100h

.DATA
    msg1 db 13,10,"Digite 7 numeros (0-9): $"
    msg2 db 13,10,"Vetor invertido: $"
    vetor db 7 dup(?)

.CODE
main PROC
    mov ax, @data
    mov ds, ax

    ; --- Ler vetor ---
    call ler_vetor

    ; --- Inverter vetor ---
    call inverter_vetor

    ; --- Imprimir vetor ---
    call printar_vetor

    ; Encerrar programa
    mov ah, 4Ch
    int 21h
main ENDP


;==================================================
; Procedimento: ler_vetor
; Lê 7 valores do teclado e armazena em 'vetor'
; Usa SI como índice
;==================================================
ler_vetor PROC
    mov ah, 09h
    lea dx, msg1    ;printo msg1
    int 21h

    xor si, si  ;zero si
    mov cl, 7 ;adiciono 7 ao contador 

ler_loop:
    mov ah, 01h ;guardo input em al
    int 21h
    sub al, 30h          ; converte ASCII -> número [por algum motivo and al,0fh nao ta dando certo ]
    mov vetor[si], al      ; posicao do vetor recebe input
    inc si                  ;prox posi
    loop ler_loop
    ret
ler_vetor ENDP


;==================================================
; Procedimento: inverter_vetor
; Inverte o vetor em posição (sem vetor auxiliar)
; Usa SI (início) e DI (fim)
;==================================================
inverter_vetor PROC
    xor si, si
    mov di, 6            ; último índice = 7 - 1
    mov cl, 3            ; só precisa trocar metade

troca_loop:
    mov al, vetor[si]    ; guarda início
    mov bl, vetor[di]    ; guarda fim

    mov vetor[si], bl    ; troca posições
    mov vetor[di], al

    inc si  ;prox pos
    dec di  ;prox posi
    loop troca_loop
    ret
inverter_vetor ENDP


;==================================================
; Procedimento: printar_vetor
; Imprime os 7 valores do vetor
;==================================================
printar_vetor PROC
    mov ah, 09h
    lea dx, msg2 ;imprimir msg 2
    int 21h

    xor si, si
    mov cl, 7

print_loop:
    mov dl, vetor[si] ;jogo em dl o valor da posição em si 
    add dl, 30h          ; converte número -> ASCII
    mov ah, 02h ;funcao para imprimir carac
    int 21h ;printo dl
    inc si ;prox posi
    loop print_loop
    ret
printar_vetor ENDP

END main
