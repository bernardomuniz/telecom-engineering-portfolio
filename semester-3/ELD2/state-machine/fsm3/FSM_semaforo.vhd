library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM_semaforo is 
generic(
    tAm:  natural := 5;--(5 segundos)
    tVd1: natural:= 60; --(60 segundos)
    tVd2: natural := 30 --(30 segundos)
);
port(
    clk, reset, ativar: in std_logic;
    timer: in unsigned(5 downto 0);
    Lvm1, Lam1, Lvd1, zerar : out std_logic;
    Lvm2, Lam2, Lvd2 : out std_logic
);
end entity;

architecture ifsc_v1 of FSM_semaforo is
    type state is (AM1, AM2, VD1VM2, VM1AM2, AM1VM2, VM1VD2,
	ZAM1, ZAM2, ZVD1VM2, ZVM1AM2, ZAM1VM2, ZVM1VD2); --estados
    signal pr_state, nx_state : state;
begin

    process(clk, reset)
    begin
        if (reset = '1') then
            pr_state <= AM1;
        elsif rising_edge(clk) then
            pr_state <= nx_state;
        end if;
    end process;
    
    process(ativar, pr_state, timer) 
    begin
        --Default
        Lvm1 <= '0';
        Lam1 <= '0';
        Lvd1 <= '0';
        Lvm2 <= '0';
        Lam2 <= '0';
        Lvd2 <= '0';
        zerar <= '0';
        
        case pr_state is
			when ZAM1 =>
				zerar <= '1';
				nx_state <= AM1;

			when ZAM2 =>
				zerar <= '1';
				nx_state <= AM2;

			when ZVD1VM2 =>
				zerar <= '1';
				nx_state <= VD1VM2;

			when ZAM1VM2 =>
				zerar <= '1';
				nx_state <= AM1VM2;

			when ZVM1VD2 =>
				zerar <= '1';
				nx_state <= VM1VD2;

			when ZVM1AM2 =>
				zerar <= '1';
				nx_state <= VM1AM2;
	
			when AM1 =>
                Lam1 <= '1';
                if (ativar = '1') then
                    nx_state <= VD1VM2;
                elsif timer < tAm then
                    nx_state <= AM1;
                else
                    nx_state <= ZAM2; --enquanto for menor permanece no estado, se nao troca de estado
                end if;
				
            when AM2 => 
                Lam2 <= '1';
                if timer < tAm then
                    nx_state <= AM2;
                else
                    nx_state <= ZAM1;
                end if;
				
            when VD1VM2 =>
                Lvd1 <= '1';
                Lvm2 <= '1';
                if (ativar = '0') then
                    nx_state <= AM1;
                elsif timer < tVd1 then
                    nx_state <= VD1VM2;
                else
                    nx_state <= ZAM1VM2;
                end if;
				
            when AM1VM2 =>
                Lam1 <= '1';
                Lvm2 <= '1';
                if timer < tAm then 
                    nx_state <= AM1VM2;
                else
                    nx_state <= ZVM1VD2;
                end if;
				
            when VM1VD2 =>
                Lvm1 <= '1';
                Lvd2 <= '1';
                if(ativar = '0') then
                    nx_state <= AM1;
                elsif timer < tVd2 then 
                    nx_state <= VM1VD2;
                else
                    nx_state <= ZVM1AM2;
                end if;
				
            when VM1AM2 =>
                Lvm1 <= '1';
                Lam2 <= '1';
                if timer < tAm then
                    nx_state <= VM1AM2;
                else
                    nx_state <= ZVD1VM2;
                end if;
				
        end case;
    end process;
            
end architecture;