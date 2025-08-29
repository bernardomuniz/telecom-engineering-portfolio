-- A bibliteca std e o pacote standard são autodeclarados, então as linhas abaixo podem ser comentadas com "--"
--library std;
--use std.standard.all;

entity BCD2SSD is
    port (
    -- Entradas ABCD do circuito
    eA, eB, eC, eD: in bit; 
    -- Saidas para os leds do mostrador de 7 segmentos. Note que o nome a, b, .. g foi mudado para ssd_a, ssd_b, ... ssd_g pois o VHDL é insensível a caixa                            
    ssd_a, ssd_b, ssd_c, ssd_d, ssd_e, ssd_f, ssd_g : out bit
    );
end entity; 

architecture equipe7_DontCare of BCD2SSD is
begin
    -- a = A + C + BD + B'D'
    ssd_a <= eA or eC or (eB and eD) or ((not eB) and (not eD)); 
    
    -- b = B' + CD + C'D'
    ssd_b <= (not eB) or (eC and eD) or ((not eC) and (not eD)); 
    
    -- c = B + C' + D
    ssd_c <= eB or (not eC) or eD; 
    
    -- d = A + BC'D + B'C + B'D + CD' +  B’C’D’
    ssd_d <= eA or (eB and (not eC) and eD) or 
                ((not eB) and eC) or 
                ((not eB) and (not eD)) or 
                (eC and (not eD)) or ((not eB) and (not eC) and (not eD)); 
    
    -- e = B'D' + CD'
    ssd_e <= ((not eB) and (not eD)) or (eC and (not eD)); 
    
    -- f = A + BC' + BD' + C'D'
    ssd_f <= eA or (eB and (not eC)) or (eB and (not eD)) or ((not eC) and (not eD)); 
    
    -- g = A + BC' + B'C + CD'  
    ssd_g <= eA or (eB and (not eC)) or ((not eB) and eC) or (eC and (not eD));              
end architecture;

architecture equipe7_conunto7 of BCD2SSD is
begin
    -- a = A'C + ABD' + AB'C' + B'C'D' + A'BC
   ssd_a <= ((not eA) and eC) or 
                (eA and eB and (not eD)) or 
                (eA and (not eB) and (not eC)) or 
                ((not eB) and (not eC) and (not eD)) or 
                ((not eA) and eB and eC); 
                
    -- b = A'B' + C'D' + B'C' + A'CD + ABD'
   ssd_b <= ((not eA) and (not eB)) or 
                ((not eC) and (not eD)) or 
                ((not eB) and (not eC)) or 
                ((not eA) and eC and eD) or 
                (eA and eB and (not eD)); 
    
    -- c = A'D + BD' + B'D + C'D'
   ssd_c <= ((not ea) and eD) or 
                (eB and (not eD)) or 
                ((not eB) and eD) or 
                ((not eC) and (not eD)); 
                
    -- d = AC' + A'CD'+ B'CD + BC'D
   ssd_d <= (eA and (not eC)) or 
                ((not eA) and eC and (not eD)) or 
                ((not eB) and eC and eD) or 
                (eB and (not eC) and eD) or
                ((not eB) and (not eC) and (not eD)); 

                
    -- e = AC'D' + ABC' + AB'CD + A'B'D' + BCD'
   ssd_e <= (eA and (not eC) and (not eD)) or 
                (eA and eB and (not eC)) or 
                (eA and (not eB) and eC and eD) or 
                ((not eA) and (not eB) and (not eD)) or 
                (eB and eC and (not eD)); 
    
    -- f = AB'C' + AB'D + A'C'D' + BCD' + BC'D
   ssd_f <= (eA and (not eB) and (not eC)) or 
                (eA and (not eB) and eD) or 
                ((not eA) and (not eC) and (not eD)) or 
                (eB and eC and (not eD)) or 
                (eB and (not eC) and eD); 
    
    -- g = AB' + BD' + B'C + A'BC'
   ssd_g <= (eA and (not eB)) or 
                (eB and (not eD)) or 
                ((not eB) and eC) or 
                ((not eA) and eB and (not eC)); 
end architecture;

configuration cfg of BCD2SSD is
    for equipe7_DontCare end for;
end configuration;