;Questão 1: GPIO
    ;Inicialize os GPIOs adequadamente.
    ;Cada vez que o botão INC/DEC for pressionado, incremente (de 0 até 15) uma vez o valor mostrado na porta B e decremente (de 15 até 0) uma vez
    ;o valor na porta C.
    ;Se o botão RST for pressionado, a contagem na porta B deve ser zerada e a porta C deve receber o valor 15.


.equ RST = PD2
.equ INC_DEC = PD3
    
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
    out PORTB, r17
    
    ldi r17, 15
    out PORTC, r17
    
    rjmp main
    
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