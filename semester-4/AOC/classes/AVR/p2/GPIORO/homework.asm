.DSEG
.ORG SRAM_START
    COUNT: .BYTE 1
.CSEG
 
start:
    sbis GPIOR0, 3 ;SE O BIT TRES DO GPIOR0 ESTIVER PRESSIONADO ELE VAI SALTAR A PROXIMA INSTRUÇÃO
    rjmp start ;FICA SALTANDO PARA O INICIO ENQUANTO O BOTÃO NÃO FOR PRESSINADO
    ldi r19,5
    sts COUNT, R19
    
loop_dec:
    lds r19, COUNT
    dec r19
    sts COUNT, r19
    cpi r19,0
    brne loop_dec
    
    rcall muda_estado_led1
    rjmp start
    
muda_estado_led1:
    sbic GPIOR0,7
    rjmp zera
    sbi GPIOR0,7
    rjmp fim_muda
zera:
    cbi GPIOR0,7
fim_muda: