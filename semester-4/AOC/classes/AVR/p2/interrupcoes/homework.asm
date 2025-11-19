;Simular um circuito com dois botões, ON (PD2) e OFF (PD3), e dois LEDs, L0 (PB0) e o L1 (PB1).

;Utilizando interrupção externa, implementar um sistema com o seguinte comportamento:

;Piscar o L0 a cada 2s;
;Quando o botão ON for pressionado, o L1 deve ligar;
;Quando o botão OFF for pressionado, o L1 deve desligar.
;Observações
;Deve-se usar a sub-rotina de delay programável apresentado em aula.
;O fluxograma deve representar exatamente o código.
;Os LEDs ligam com "0" e desligam com "1"
;O botão pressionado gera nível lógico "0" e não pressionado "1"

.equ ON = PD2
.equ OFF = PD3
.equ L0 = PB0
.equ L1 = PB1
    
.ORG 0x000
    RJMP setup

.ORG 0x002
    RJMP isr_int0

.ORG 0x004
    RJMP isr_int1

    
.ORG 0x0034
setup:
    ;configurando pinos leds como saida
    SBI DDRB, L0
    SBI DDRB, L1
    
    ;configurar pinos botoes como entrada e ativar pullup
    CBI DDRD, ON
    CBI DDRD, OFF
    SBI PORTD, ON
    SBI PORTD, OFF
    
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
sbi PORTB,L0 ; desliga L0 ;INTERROMPER AQ
ldi r19, 1
rcall delay ; delay 1s
cbi PORTB,L0 ; liga L0   ;INTERROMPER AQ
ldi r19, 1
rcall delay ; delay 1s
rjmp main         ;INTERROMPER AQ
    
    
;Botão ON
isr_int0:
    cbi PORTB, L1
    reti
    
;Botão OFF    
isr_int1:
    sbi PORTB, L1
    reti
;press - borda de descida
;não press - borda de descida
    
;------------------------------------------------------------
;SUB-ROTINA DE ATRASO Programável
;Depende do valor de R19 carregado antes da chamada.
;Exemplos: 
; - R19 = 16 --> 200ms 
; - R19 = 80 --> 1s 
;------------------------------------------------------------
delay:           
  push r17         ; Salva os valores de r17,
  push r18         ; ... r18,
  in r17,SREG    ; ...
  push r17       ; ... e SREG na pilha.

  ; Executa sub-rotina :
  clr r17
  clr r18
  
loop:            
  dec  R17       ;decrementa R17, começa com 0x00
  brne loop      ;enquanto R17 > 0 fica decrementando R17
  dec  R18       ;decrementa R18, começa com 0x00
  brne loop      ;enquanto R18 > 0 volta decrementar R18
  dec  R19       ;decrementa R19
  brne loop      ;enquanto R19 > 0 vai para volta

  pop r17         
  out SREG, r17  ; Restaura os valores de SREG,
  pop r18        ; ... r18
  pop r17        ; ... r17 da pilha

  ret