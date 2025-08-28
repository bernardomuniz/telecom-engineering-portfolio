library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_binario is
generic(
		N : natural := 18
		);
port(
	clk,rst,enable: std_logic;
	c_out: out std_logic_vector(N-1 downto 0)
);
end entity;

architecture ifsc_v1 of contador_binario is
	signal c_reg, c_next: unsigned (N-1 downto 0) := (others => '0');
begin

	-- State register
	l1: process(clk, rst)
	begin
		if(rst = '1') then
			c_reg <= (others => '0');
		elsif rising_edge(clk) then
			c_reg <= c_next;
		end if;
	end process;
	
	-- Next State
	l2: process(c_reg, enable)
		begin
			c_next <= c_reg;
			
			if enable = '1' then
				c_next <= c_reg + 1;
			end if;
		end process;
		
		c_out <= std_logic_vector(c_reg);
end architecture;