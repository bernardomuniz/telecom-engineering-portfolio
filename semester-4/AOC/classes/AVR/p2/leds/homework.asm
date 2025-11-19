;Os 4 LEDs menos significativos devem apagar quando o botão ajuste estiver pressionado.
;Os 4 LEDs mais significativos devem apagar quando o botão seleção estiver pressionado.
;Os 8 LEDs devem ligar quando nenhum botão estiver pressionado.


.EQU SEL = PB1
.EQU AJU = PB0


setup:
    ;PINOS DE ENTRADA
    CBI DDRB, SEL
    CBI DDRB, AJU
    SBI PORTB, SEL
    SBI PORTB, AJU
    
    ;PINOS DA PORTA B COMO SAÍDA
   LDI R16, 0xFF    ;SER R16
   OUT DDRD, R16
 
loop:
    sbic PINB, SEL ;Verifica se o bit do PINB está 0, se estiver em zero ELE SALTA A PRÓXIMA instrução (0 pressionado - 1 não pressionado)
    rjmp on_high
 
off_high: 
    sbi PORTD, 7
    sbi PORTD, 6
    sbi PORTD, 5
    sbi PORTD, 4
    rjmp cont
    
on_high:
    cbi PORTD, 7
    cbi PORTD, 6
    cbi PORTD, 5
    cbi PORTD, 4
    
cont:
    sbic PINB, AJU
    rjmp on_low

on_low:
    cbi PORTD, 3
    cbi PORTD, 2
    cbi PORTD, 1
    cbi PORTD, 0
    
off_low:
    sbi PORTD, 3
    sbi PORTD, 2
    sbi PORTD, 1
    sbi PORTD, 0
    rjmp fim
    
fim:
    rjmp loop




.INCLUDE <m328Pdef.inc>
2
3 setup:
4 sbi DDRD, PD2 ;configura o pino PD2 como sa´ıda
5
6 cbi DDRD, PD7 ;configura o pino PD7 como entrada
7 sbi PORTD, PD7 ;habilita o pull-up para o bot~ao
8
9 ;----------------------
10 ;LA¸CO PRINCIPAL
11 ;----------------------
12 naoPress: ;loop bot~ao n~ao pressionado (pull-up)
13 sbi PORTD,PD2 ;desliga LED
14 sbic PIND,PD7 ;verifica se o bot~ao foi pressionado,
15 rjmp naoPress ;sen~ao volta e fica preso no la¸co naoPress
16
17 press: ;loop bot~ao pressionado
18 cbi PORTD,PD2 ;liga LED
19 sbis PIND,PD7 ;verifica se o bot~ao foi solto, sen~ao
20 rjmp press ;sen~ao, aguarda.
21
22 rjmp naoPress ;vai para o loop do "bot~ao pressionado"



.INCLUDE <m328Pdef.inc>

start:
sbi DDRB, PB5 ;configura o pino PB5 como sa´ıda
main:
sbi PORTB, PB5 ;coloca o pino PB5 em 5V

;atraso de aprox. 200ms
ldi R19, 16
rcall delay

cbi PORTB, PB5 ;coloca o pino PB5 em 0V

;atraso de aprox. 200ms
ldi R19, 16
rcall delay

rjmp main


 .INCLUDE <m328Pdef.inc>
setup:
sbi DDRB, PB5 ;configura o pino PB5 como sa´ıda

loop:
sbi PORTB, PB5 ;coloca o pino PB5 em 5V

rjmp loop
Desligar o LED, substituir a linha 7 por:
cbi PORTB, PB5 ;coloca o pino PB5 em 0V
