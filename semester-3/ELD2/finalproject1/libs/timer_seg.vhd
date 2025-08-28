library ieee;
use ieee.std_logic_1164.all;

entity timer_seg is
   generic (DEZENA : natural :=1; UNIDADE : natural := 2; FCLOCK : natural := 50000000);
	port (
		CLOCK50MHz 	 : in std_logic; 
		RESET_PB 	 : in std_logic;
		CONTAR_SW    : in std_logic;
		ZERAR_PB     : in std_logic;
		LED_1SEC     : out std_logic;
		SSD_DEZENA   : out std_logic_vector(6 downto 0);
		SSD_UNIDADE  : out std_logic_vector(6 downto 0)
	);
end entity;

architecture ifsc_de2_115 of timer_seg is
	component bcd2ssd is
		--tipo = 0 => display anodo comun
		--tipo = 1 => display catodo comum
		 generic (tipo : natural := 1);
		port (
			bcd_in		: in std_logic_vector(3 downto 0);
			ssd_out		: out std_logic_vector(6 downto 0);
			oculta_zero : in std_logic
		);
	end component;
	
	component div_clk is
--    generic (fclk : natural :=50000000); --para implementaçao clk 50Mhz
	generic (fclk : natural :=50000000); --para asimulaçao
	port (
		clk_in 	: in std_logic;
		reset    : in std_logic;
		ena_out	: out std_logic;
		clk_out  : out std_logic
	);
end component;

component contaBCD is
	generic (D: natural :=5; U : natural := 9);
	port (
		clk, rst : in std_logic;
		ena		: in std_logic;
		contar	: in std_logic;
		zerar		: in std_logic;
		bcd_d		: out std_logic_vector(3 downto 0);
		bcd_u		: out std_logic_vector(3 downto 0)
	);
end component;
	signal ENABLE_1SEC : std_logic;
	signal BCD_UNIDADE : std_logic_vector(3 downto 0); --out
	signal BCD_DEZENA  : std_logic_vector(3 downto 0); --out
begin

	U1: div_clk generic map (fclk => FCLOCK) --Divisor de clock
		port map (clk_in => CLOCK50MHz,
					 reset => RESET_PB,
					 clk_out => LED_1SEC,
					 ena_out => ENABLE_1SEC);

	U2 : contaBCD generic map (D => DEZENA, U=> UNIDADE) --Contador BCD
		port map (clk => CLOCK50MHz,
					contar => CONTAR_SW,
					zerar => ZERAR_PB,
					rst => RESET_PB,
					ena => ENABLE_1SEC,
					bcd_u => BCD_UNIDADE,
					bcd_d => BCD_DEZENA);
	
	U3 : bcd2ssd --convertendo unidade de BCD p/ SSD
		  port map (bcd_in => BCD_UNIDADE,
						ssd_out => SSD_UNIDADE,
						oculta_zero => '0'
						);
						
	U4 : bcd2ssd --convertendo dezena de BCD p/ SSD
		  port map (bcd_in => BCD_DEZENA,
						ssd_out => SSD_DEZENA,
						oculta_zero => '0'
						);
end architecture;