library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM_semaforo is 
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
end entity;

architecture semaforos of fsm_semaforo is
	type state is (AM1,AM2,VD1VM2,AM1VM2,VM1VD2,VM1AM2,erro); --todos os estados possiveis
	signal pr_state, next_state : state; --pr_state => estado atual, next_state => proximo estado
begin
	
	--sequencial
	process(clk, rst)
	begin
		if rst = '1' then
			pr_state <= AM1;
		elsif rising_edge(clk) then
			pr_state <= next_state;
		end if;
	end process;

	--combinacional 
	process(pr_state, ativar, timer_std)
	begin
		lam1 <= '0'; --valores dafault
		lam2 <= '0';
		lvd1 <= '0'; 
		lvd2 <= '0';
		lvm1 <= '0';
		lvm2 <= '0';
		zerar_cnt <= '0';
		next_state <= pr_state;
		case pr_state is
			when AM1 =>
				lam1 <= '1';
				if timer_std = std_logic_vector(to_unsigned(temp_amarelo, timer_std'length)) then
					zerar_cnt <= '1';
					next_state <= AM2;
				elsif ativar = '1' then
					zerar_cnt <= '1';
					next_state <= VD1VM2;
				end if;
			when AM2 =>
				lam2 <= '1';
				if timer_std = std_logic_vector(to_unsigned(temp_amarelo, timer_std'length)) then
					zerar_cnt <= '1';
					next_state <= AM1;
				end if;
			when VD1VM2 =>
				lvd1 <= '1';
				lvm2 <= '1';
				if timer_std = std_logic_vector(to_unsigned(temp_verde1, timer_std'length)) then
					zerar_cnt <= '1';
					next_state <= AM1VM2;
				elsif ativar = '0' then
					zerar_cnt <= '1';
					next_state <= AM1;
				end if;
			when AM1VM2 =>
				lam1 <= '1';
				lvm2 <= '1';
				if timer_std = std_logic_vector(to_unsigned(temp_amarelo, timer_std'length)) then
					zerar_cnt <= '1';
					next_state <= VM1VD2;
				end if;
			when VM1VD2 =>
				lvm1 <= '1';
				lvd2 <= '1';
				if timer_std = std_logic_vector(to_unsigned(temp_verde2, timer_std'length)) then
					zerar_cnt <= '1';
					next_state <= VM1AM2;
				elsif ativar = '0' then
					zerar_cnt <= '1';
					next_state <= AM1;
				end if;
			when VM1AM2 =>
				lvm1 <= '1';
				lam2 <= '1';
				if timer_std = std_logic_vector(to_unsigned(temp_amarelo, timer_std'length)) then
					zerar_cnt <= '1';
					next_state <= VD1VM2;
				end if;
			when others =>
				next_state <= erro;
			end case;
	end process;
end architecture;