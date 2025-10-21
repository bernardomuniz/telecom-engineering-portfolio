;Declare três vetores com 8 posições de 8 bits (A1, A2 e A3) e um vetor de 3 posições de 8 bits (A4).
    ;Dica: utilize .DSEG e ".BYTE 8"
;Inicialize os vetores A2 e A3 com os valores de 1 até 8.
    ;Dica: utilize endereçamento indireto com pós incremento.
    ;Dica: Utilize um loop com 8 iterações.
;Some a primeira posição do A2 com a última do A3 e armazene na primeira do A1. Faça isso sucessivamente até que todas as posições sejam operadas.
    ;Dica: utilize endereçamento indireto com pós incremento para acessar o A1 e o A2 e endereçamento indireto com pré decremento para acessar o A3.
    ;Dica: Utilize um loop com 8 iterações.
;Some A2(1) e A3(4), A2(2) e A3(3), A2(6) e A3(7) e salve consecutivamente no A4.
    ;Dica: utilize endereçamento indireto com deslocamento para acessar o A2 e o A3 e endereçamento indireto com pós incremento para acessar o A4.
    ;Dica: Não utilize loop.


.DSEG
.ORG SRAM_START
A1: .BYTE 8
A2: .BYTE 8
A3: .BYTE 8
A4: .BYTE 3

.CSEG 
start:
   
    ;Ponteiro X apontando para o inicio de A2
    ldi YL, LOW(A2)
    ldi YH, HIGH(A2)
    ;Ponteiro Y apontando para o inicio de A3
    ldi ZL, LOW(A3)
    ldi ZH, HIGH(A3)
    
    ldi r16, 1      
  
init_a2_a3:
    ST Y+, r16
    ST Z+, R16    
    inc r16         
    cpi r16, 9   ;como se fosse o sub do bip
    brne init_a2_a3   



    ldi YL, LOW(A2)
    ldi YH, HIGH(A2)
    ldi ZL, LOW(A3+8) ;ultima posição +1 do A3
    ldi ZH, HIGH(A3+8)
    ldi XH, HIGH(A1)
    ldi XL, LOW(A1)
    ldi r16,1
    
sum_seq:
   LD R17, Y+
   LD R18, -Z
   ADD R17,R18
   ST X+,R17
   
   inc r16
   cpi r16,9
   brne sum_seq
   
   
   
    ldi YL, LOW(A2)
    ldi YH, HIGH(A2)
    ldi ZL, LOW(A3) 
    ldi ZH, HIGH(A3)
    ldi XH, HIGH(A4)
    ldi XL, LOW(A4)

sum_aleatorio:
    LDD r17,Y+1
    LDD r18, Z+4
    ADD r17, r18
    ST X+, r17
    
    LDD r17,Y+2
    LDD r18, Z+3
    ADD r17, r18
    ST X+, r17
    
    LDD r17,Y+6
    LDD r18, Z+7
    ADD r17, r18
    ST X+, r17
   
    rjmp start