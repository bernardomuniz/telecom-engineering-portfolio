library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contaBCD is
   generic (D: natural :=5; U : natural := 9; tipo : natural := 0); --0 => overflow, 1 => parada
	port (
		clk, rst : in std_logic;
		ena		: in std_logic;
		contar	: in std_logic;
		zerar		: in std_logic;
		bcd_d		: out std_logic_vector(3 downto 0);
		bcd_u		: out std_logic_vector(3 downto 0)
	);
end entity;

architecture bcd_count of contaBCD is
	signal u_reg, u_next, d_reg, d_next : unsigned(3 downto 0);
begin

	--sequencial
	process(clk, rst)
	begin
		if rst = '1' then
			u_reg <= (others => '0');
			d_reg <= (others => '0');
		elsif rising_edge(clk) then
			if zerar = '1' then
					u_reg <= (others => '0');
					d_reg <= (others => '0');
			elsif ena = '1' then
				if contar = '1' then
					u_reg <= u_next;
					d_reg <= d_next;
				end if;
			end if;
		end if;
	end process;

	--next state
	
	overflow : if tipo = 0 generate --caso overflow
		u_next <= (others => '0') when u_reg = 9 else --troacando dezena
					 (others => '0') when u_reg = U and d_reg = D else -- overflow
					 u_reg + 1;
					 
		d_next <= (others => '0') when u_reg = U and d_reg = D else ---overflow
					 d_reg + 1 when u_reg = 9 else
					 d_reg;
	end generate;

	parada : if tipo = 1 generate
		u_next <= u_reg when u_reg = U and d_reg = D else --parada
					(others => '0') when u_reg = 9 else --troacando dezena
					 u_reg + 1;
					 
		d_next <= d_reg when u_reg = U and d_reg = D else --parada
					 d_reg + 1 when u_reg = 9 else
					 d_reg;
	end generate;
	
	--output
	
	bcd_u <= std_logic_vector(u_reg);
	bcd_d <= std_logic_vector(d_reg);
	
end architecture;