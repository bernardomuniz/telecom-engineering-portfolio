library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_bcd is
 port(
	clock : in std_logic;
	reset : in std_logic;
	enable : in std_logic;
	unidade : out std_logic_vector (3 downto 0);
	dezena : out std_logic_vector (3 downto 0);
	centena : out std_logic_vector (3 downto 0)
 );
 end entity;
 
 architecture contador_t of contador_bcd is 
	signal reg_unidade, reg_dezena, reg_centena: unsigned (3 downto 0);
	signal unidade_next, dezena_next, centena_next: unsigned (3 downto 0);
 begin
		process(clock, reset) is 
		begin
			if(reset = '1') then
				reg_unidade <= (others => '0');
				reg_dezena <= (others => '0');
				reg_centena <= (others => '0');
				
					elsif rising_edge(clock) then
					reg_centena <= centena_next;
					reg_dezena <= dezena_next;
					reg_unidade <= unidade_next;
				end if;
			end process;
		
		process(reg_unidade, reg_dezena, reg_centena, enable) is
begin
    
	--para evitar o latch quando enable for diferente de 1, nesse caso os valores permanecem os mesmos e nao ha incrementacao
    unidade_next <= reg_unidade;
    dezena_next <= reg_dezena;
    centena_next <= reg_centena;

    if enable = '1' then
        if reg_unidade = "1001" then
            unidade_next <= (others => '0');

            if reg_dezena = "1001" then
                dezena_next <= (others => '0');

                if reg_centena = "1001" then
                    centena_next <= (others => '0');
                else
                    centena_next <= reg_centena + 1;
                end if;
            else
                dezena_next <= reg_dezena + 1;
            end if;
        else
            unidade_next <= reg_unidade + 1;
        end if;
    end if;
end process;
		
		unidade <= std_logic_vector(reg_unidade);
		dezena <= std_logic_vector(reg_dezena);
		centena <= std_logic_vector(reg_centena);
		
	end architecture;
					
 
 