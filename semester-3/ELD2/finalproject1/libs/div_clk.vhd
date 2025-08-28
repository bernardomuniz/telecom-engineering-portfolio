library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity div_clk is
--    generic (fclk : natural :=50000000); --para implementaçao clk 50Mhz
	 generic (
					fclk : natural :=50000000;
					Nbits : natural := 26
				); --para asimulaçao
	 
	port (
		clk_in 	: in std_logic;
		reset    : in std_logic;
		ena_out	: out std_logic;
		clk_out  : out std_logic
	);
end entity;

architecture clk_division of div_clk is
	signal r_reg, r_next : unsigned (Nbits-1 downto 0);
begin
    process(clk_in,reset)
    begin
        if (reset = '1') then
            r_reg <= (others => '0');
        elsif rising_edge(clk_in) then 
            r_reg <= r_next;
        end if;
    end process;
    r_next <= (others => '0') when r_reg = (fclk-1) else r_reg + 1;
    clk_out <= '1' when r_reg < fclk/2 else '0';
    ena_out <= '1' when r_reg=fclk-1 else '0';
end architecture;