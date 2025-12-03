.DSEG
.ORG SRAM_START
    contagem : .BYTE 1
    intervalo : .BYTE 1

.CSEG
 
 .ORG 0x0000 ; Vetor reset
 RJMP setup

 .ORG 0x002
 RJMP isr_int0
 
 .ORG 0x0020 ; Vetor (endere¸co na Flash) do estouro do T/C0
  RJMP isr_tc0b

.ORG 0x0034
 
setup:
;CONFIGURA LEDs
sbi DDRB, PB5
cbi PORTB, PB5 

;BOTÃO COMO ENTRADA
cbi DDRD, PD2
sbi PORTD, PD2
    

ldi R16, 0b0000_0010
sts EICRA, R16
sbi EIMSK, int0

    
ldi R16, 0b00000101 ;TC0 com prescaler de 1024, a 16 MHz gera
out TCCR0B, R16 ; uma interrup¸c~ao a cada 16,384 ms
LDI R16, 1
sts TIMSK0, R16
    
    
sei ; habilita as interrup¸c~oes globais
    
main:
rjmp main

isr_tc0b:
  push r16
  push r17
  in r16, SREG ;contexto salvo no r16
  push r16
    
    
 LDS r16, contagem ;lê da SRAM a variável contagem
 inc r16
 LDS r17, intervalo
 cp r16, r17 ;compara dois registrados
 brne fim ;se são iguais salta para o fim
 sbi PINB, PB5
 
 ldi r16,0
 
 
fim:
    STS contagem, R16
 
    pop r16
    out SREG, r16
    pop r17
    pop r16
    
    reti
    
isr_int0:
    push r16
    in r16, SREG ;contexto salvo no r16
    push r16
    
   
    lds r16, intervalo ;lê o intervalo
    CPI r16, 14
    breq rst_intervalo
    SUBI r16, 12
    rjmp fim_int0
    
rst_intervalo:
    ldi r16, 62

    
fim_int0:
    STS intervalo, r16
    CLR r16
    STS contagem, r16
    
    pop r16
    out SREG, r16
    pop r16
    
    reti