library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlador_semaforo IS
generic (
	tAMG : natural := 5; tVD1G : natural := 60; tVD2G : natural := 30; 
	Nbits_timer :natural := 6; 
	FCLK : natural := 50; Nbits_clk : natural := 6);
port (
	CLK50MHz : in std_logic;
	RESET_PB : in std_logic;	
	ATIVAR_SW : in std_logic;
	CONTAR_SW : in std_logic;
	LED_1sec	: out std_logic;
	vm1_LED, vd1_LED, am1_LED, vm2_LED, vd2_LED, am2_LED : out std_logic
	);
end entity;

architecture ifsc of controlador_semaforo is
	signal ena_1sec: std_logic;
	signal timer_std : std_logic_vector(Nbits_timer-1 downto 0);
	signal ZERAR_PB: std_logic;
    -- Sinais internos: timer_std, zerar_cnt, ena_1sec, etc.
    component FSM_semaforo is 
		 generic
		 (
			temp_amarelo : natural := 5; --tempo em que o semaforo fica amarelo
			temp_verde1  : natural := 60; --tempo que o semaforo 1 fica verde
			temp_verde2  : natural := 30; --tempo em que o semaforo 2 fica verde
			nbits_timer  : natural := 6

		 );
		port
		(
			clk, rst : in std_logic;
			ativar : in std_logic; --entrada para mudanca de estados
			timer_std : in std_logic_vector(nbits_timer-1 downto 0); --entrada para mudanca de estados
			lam1, lam2, lvd1, lvd2, lvm1, lvm2 : out std_logic; --saidas inidicando qual cor deve ser exibida no semaforo de acordo com o estado atual
			zerar_cnt : out std_logic
		);
	end component;
	
	component div_clk is
		generic (
						fclock : natural :=5;
						Nbits : natural := 6
					); --para asimulaçao
		 
		port (
			clk_in 	: in std_logic;
			reset    : in std_logic;
			ena_out	: out std_logic;
			clk_out  : out std_logic
		);
	end component;
	
	component timer_sec is
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
	end component;
	 -- Declaração dos componentes usados
begin
	
    U1 : div_clk generic map(fclock => FCLK, Nbits => Nbits_timer)
			port map(clk_in => CLK50MHz,
						reset => RESET_PB,
						ena_out => ena_1sec,
						clk_out => LED_1sec
						);
	 -- Instância do divisor de clock
	 U2 : timer_sec generic map(MAX => tVD1G, NBITS => Nbits_timer)
			port map(clk => CLK50MHz,
						contar => CONTAR_SW,
						ena => ena_1sec,
						rst => RESET_PB,
						zerar => ZERAR_PB,
						timer => timer_std
						);
	 
    -- Instância do timer binario de 1 sec
    U3 : FSM_semaforo generic map (temp_amarelo => tAMG, temp_verde1 => tVD1G, temp_verde2 => tVD2G, nbits_timer => Nbits_timer) --Contador BCD
			port map (clk => CLK50MHz,
						zerar_cnt => ZERAR_PB,
						ativar => ATIVAR_SW,
						rst => RESET_PB,
						timer_std => timer_std,
						lam1 => am1_LED,
						lam2 => am2_LED,
						lvd1 => vd1_LED,
						lvd2 => vd2_LED,
						lvm1 => vm1_LED,
						lvm2 => vm2_LED);
	 -- Instância da FSM do semaforo 
end architecture;