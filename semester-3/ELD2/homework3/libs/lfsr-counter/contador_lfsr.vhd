library ieee;
use ieee.std_logic_1164.all;
 
 
entity contador_lfsr is
generic(
		N	: natural := 18
    );
   port(
      clk, reset, enable: in std_logic;
      lfsr_out: out std_logic_vector(N-1 downto 0)
   );
end entity;
 
architecture ifsc_v1 of contador_lfsr is
   signal r_reg, r_next: std_logic_vector(N-1 downto 0);
   constant SEED: std_logic_vector(N-1 downto 0):= "100000010000000000";
begin
 
   l1: process(clk,reset)
	begin
      if (reset='1') then
         r_reg <= SEED;
      elsif rising_edge(clk) then
         r_reg <= r_next;
      end if;
   end process;

   l2: process(enable, r_reg)
		   variable fb: std_logic;
	   begin
			r_next <= r_reg;
			if enable = '1' then
				 fb := r_reg(N-1) xor r_reg(10);
				 r_next <= fb & r_reg(N-1 downto 1);
			end if;
	end process;
    lfsr_out <= r_reg;

end architecture;

 