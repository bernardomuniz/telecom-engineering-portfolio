
;Declare três vetores com 10 posições de 8 bits (V0, V1 e VR).

;Obs.: utilize as diretivas .DSEG e .BYTE
;Inicialize o V0 com os valores de 10 até 19 e o V1 com valores de 20 até 29.

;Some os vetores V0 e V1, colocando o resultado no VR.

;Zere os vetores V0 e V1.

.DSEG
.ORG SRAM_START
    
    V0: .BYTE 10
    V1: .BYTE 10
    VR: .BYTE 10
 
.CSEG
 start:

    ldi YL, LOW(V0)
    ldi YH, HIGH(V0)
    ldi ZL, LOW(V1)
    ldi ZH, HIGH(V1)
    
    ldi r16,10
    ldi r17, 20

init_v0:
    ST Y+, r16 
    ST X+, r16
    inc r16
    cpi r16, 20
    brne init_v0
    
init_v1:
    ST Z+, r17
    inc r17
    cpi r17, 30
    brne init_v1
    
    ldi YL, LOW(V0)
    ldi YH, HIGH(V0)
    
    ldi ZL, LOW(V1)
    ldi ZH, HIGH(V1)
    
    ldi XL, LOW(VR)
    ldi XH, HIGH(VR)
    ldi r16,1
    
 sum_v0_v1:
   ld r17, Y+
   ld r18, Z+
   add r17,r18
   st X+, r17
   
   inc r16
   cpi r16, 11
   brne sum_v0_v1
   
    ldi YL, LOW(V0)
    ldi YH, HIGH(V0)
    
    ldi ZL, LOW(V1)
    ldi ZH, HIGH(V1)
    ldi r16,1
    ldi r17,0
   
 zero_v0_v1:
    st Y+, r17
    st Z+, r17
    inc r16
    cpi r16, 11
    brne zero_v0_v1
    
    rjmp start
    