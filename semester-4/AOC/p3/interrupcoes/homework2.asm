
;Questão 2: Interrupção
    ;Converta o código acima para que os botões INC/DEC e RST funcionem como interrupções externas.
    ;A porta B deve ser incrementada no momento em que o botão INC/DEC for pressionado e a porta C
	;decrementada quando o botão for liberado.
    ;Mantenha duas variáveis na memória count_b e count_c para armazenar o estado das portas.
	


.equ RST = PD2
.equ INC_DEC = PD3
    
.DSEG
.ORG SRAM_START
    count_b: .BYTE 1
    count_c: .BYTE 1
.CSEG    
    
.ORG 0x000
    RJMP setup

.ORG 0x002
    RJMP isr_int0

.ORG 0x004
    RJMP isr_int1
	
.ORG 0x0034


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
    out PORTB, r17
    
    ldi r18, 15
    STS count_c, r18
    out PORTC, r18
    
    ;Conf. int0 e int1
    LDI R16, 0b00001001 ;Configurar a interrupção - a hora que ocorrer determinado evento, vai interromper
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
    rjmp main ;Se não pressionado, vai checar o outro botão
   
	
isr_int0:
	push r16
	push r17
	in r19, SREG        ; Usa r19 para SREG
	push r19



    ldi r16, 0 
	sts count_b, r16
    out PORTB, r16
    
    ldi r17,15
	sts count_c, r17
    out PORTC, r17
	
	pop r19
	out SREG, r19       ; Restaura SREG (usando r19)
	pop r17
	pop r16
    reti                ; CORRIGIDO: Deve ser RETI

isr_int1:	
	push R16 ; Salva contexto
	push R17
	push R18
	in R19, SREG        ; CORRIGIDO: Usa R19 para SREG
	push R19


	sbic PIND,INC_DEC 
	rjmp dec_portc
	
inc_portb:
	lds r16, count_b ;ler o valor atual da porta B
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
	rjmp fim

dec_portc:
	 lds r17, count_c
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
	pop R19            
	out SREG,R19
	pop R18
	pop R17
	pop R16
	reti            
