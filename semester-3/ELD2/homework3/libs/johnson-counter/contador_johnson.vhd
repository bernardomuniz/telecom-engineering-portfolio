library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_johnson is
generic(
		N : natural := 18
		);
port(
	clk,rst,enable: std_logic;
	ring_out: out std_logic_vector(N-1 downto 0)
);
end entity;

architecture ifsc_v1 of contador_johnson is
    signal ring_reg, ring_next : std_logic_vector(N-1 downto 0) := (others => '0');
begin
	-- State register
	l1: process(clk, rst)
	begin
		if(rst = '1') then
			ring_reg <= (0 => '1', others => '0');
		elsif rising_edge(clk) then
			ring_reg <= ring_next;
		end if;
	end process;
	
	l2: process(enable, ring_reg)
		begin
			ring_next <= ring_reg;
			if enable = '1' then
				 ring_next <= (not ring_reg(0)) & ring_reg(N-1 downto 1);
			end if;
		end process;
		
	ring_out <= ring_reg;

end architecture;