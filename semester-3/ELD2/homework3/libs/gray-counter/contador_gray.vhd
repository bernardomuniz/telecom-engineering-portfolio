
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_gray is
generic(
		N : natural := 18
	);
   port(
      clk, reset, enable: in std_logic;
      gray_out: out std_logic_vector(N - 1 downto 0)
   );
end entity;

architecture ifsc_v1 of contador_gray is
   signal g_reg: unsigned(N-1 downto 0);
   signal g_next: unsigned(N-1 downto 0);
begin
   -- register
   process(clk,reset)
   begin
      if (reset='1') then
         g_reg <= (others=>'0');
      elsif rising_edge(clk) then
         g_reg <= g_next;
      end if;
   end process;
	
	process(enable, g_reg)
		variable b, b1: unsigned(N-1 downto 0);
	begin
		g_next <= g_reg;
		if enable = '1' then
			b := g_reg xor ('0' & g_reg(N-1 downto 1));
			b1 := b+1;
			g_next <= b1 xor ('0' & b1(N-1 downto 1));
		end if;
	end process;
	
   gray_out <= std_logic_vector(g_reg);
end architecture;