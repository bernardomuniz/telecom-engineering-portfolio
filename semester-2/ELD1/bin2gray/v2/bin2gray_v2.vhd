entity bin2gray_v2 is
	generic(
	N : natural := 20
	);
	port
	(
		b  : in bit_vector(N - 1 downto 0);
		g  : out bit_vector(N - 1 downto 0)
	);
end entity;
--Exemplo implementando o circuito diretamente com as portas lógicas
architecture ifsc_v2 of bin2gray_v2 is
begin

		l1: for i in 0 to N-2 generate
		g(i) <= b(i) xor b(i+1);
	end generate;


--	g(0) <= b(0) xor b(1);
--	g(1) <= b(1) xor b(2);
--	g(2) <= b(2) xor b(3);
--	g(3) <= b(3);
		g(N-1) <= b(N-1);
end architecture;