library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_sec is
	generic(MAX : natural := 60; NBITS : natural := 6);
	port
	(
			clk : in std_logic;
			ena : in std_logic;
			contar : in std_logic;
			rst : in std_logic;
			zerar : in std_logic;
			timer : out std_logic_vector(NBITS-1 downto 0)
	);
end entity;

architecture ifsc of timer_sec is
	 signal timer_reg, timer_next : unsigned(NBITS-1 downto 0);
begin

	--register
	process(clk, rst)
	begin
		if rst = '1' then
			timer_reg <= (others => '0');
		elsif rising_edge(clk) then
			if zerar = '1' then
				timer_reg <= (others => '0');
			elsif ena = '1' then
				if contar = '1' then
					timer_reg <= timer_next;
				end if;
			end if;
		end if;
	end process;
			
	--next-state
	timer_next <= timer_reg when timer_reg = to_unsigned(MAX, timer_reg'length) else --vai ate o MAX e nao avanca
					  timer_reg + 1;
	--output
	timer <= std_logic_vector(timer_reg);

end architecture;


architecture ifsc_v2 of timer_sec is
	 signal timer_reg, timer_next : unsigned(NBITS-1 downto 0);
begin

	--register
	process(clk, rst)
	begin
		if rst = '1' then
			timer_reg <= (others => '0');
		elsif rising_edge(clk) then
			timer_reg <= timer_next;
		end if;
	end process;
	
	process(timer_reg, ena, zerar, contar)
	begin
		timer_next <= timer_reg;
		if zerar = '1' then
				timer_next <= (others => '0');
		elsif ena = '1' then
				if contar = '1' then
					if timer_reg < to_unsigned(MAX, timer_reg'length) then
						timer_next <= timer_reg + 1;
					end if;
				end if;
		end if;
	end process;
						
	--output
	timer <= std_logic_vector(timer_reg);

end architecture;