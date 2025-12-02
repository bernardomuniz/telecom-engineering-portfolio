
;Questão 2: Interrupção
    ;Converta o código acima para que os botões INC/DEC e RST funcionem como interrupções externas.
    ;A porta B deve ser incrementada no momento em que o botão INC/DEC for pressionado e a porta C decrementada quando o botão for liberado.
    ;Mantenha duas variáveis na memória count_b e count_c para armazenar o estado das portas.

.equ RST = PD2
.equ INC_DEC = PD3
    
.DSEG
.ORG SRAM_START
    count_b: .BYTE 1
    count_c: .BYTE 1
.CSEG    
    
.org 0x0000
    rjmp setup

setup:
    ;Configurando botões de entrada
    cbi DDRD, RST
    cbi DDRD, INC_DEC
    ;Habilitando pull up (não-press=1, press=0)
    sbi PORTD, RST
    sbi PORTD, INC_DEC
    
    ;Configurando saídas
    ldi r16, 0b00001111 ;configurando 4 saídas menos significativas de uma vez só (bit=1: saída, bit=0: entrada)
    OUT DDRB, R16
    OUT DDRC, R16
    
    ;Carregando os valores do PORTB e PORTC
    ldi r17, 0
    STS count_b, r17
    out PORTB, count_b
    
    ldi r18, 15
    STS count_b, r18
    out PORTC, count_b
    
    ;Conf. int0 e int1
    LDI R16, 10 ;Configurar a interrupção - a hora que ocorrer determinado evento, vai interromper
    ;10 - borda de descida int1
    ;10 - borda de descida int0
    ;1010 = 10
    STS EICRA, R16
    
    ;Habilita int0 e int1
    SBI EIMSK, INT0
    SBI EIMSK, INT1
    
    ;Habilita interrupção global
    SEI
    
    
 main:
    sbic PIND, RST ;Pula se PIND.2 == 0 (Pressionado)
    rjmp check_button_inc_dec ;Se não pressionado, vai checar o outro botão
   
    ;se chegou aqui, o RST foi pressionado
    rcall reset_ports
    
    check_button_inc_dec:
    sbic PIND, INC_DEC ;Pula se PIND.3 == 0 (Pressionado)
    rjmp main
    ; SE CHEGOU AQUI, INC_DEC FOI PRESSIONADO
    rcall inc_dec_button ; Chama a rotina de incremento/decremento
    
inc_dec_button:
    in r16, PORTB ;ler o valor atual da porta B
    ldi r17, 15 ;carrega o valor maximo no r17
    cp r16, r17 ;compara o valor atual com o valor máximo
    breq inc_reset ;se r16 = 15, pula para o não incremento
    
    inc r16 ;incrementa o valor da porta B
    rjmp inc_update

inc_reset:
    ldi r16, 0 

inc_update:
    sts count_b, r16
    out PORTB, r16 ;atualiza a porta com novo valor
    
    in r17, PORTC
    ldi r18, 0
    cp r17, r18
    breq dec_reset
    
    dec r17
    rjmp dec_update
    
dec_reset:
   ldi r17, 15

dec_update:
   sts count_c, r17
   out PORTC, r17
   rjmp fim
   
 fim:
    ret ;retornando a sub-rotina de incremento/decremento
    
reset_ports:
    ldi r16, 0 
    out PORTB, r16
    
    ldi r17,15
    out PORTC, r17
    ret


