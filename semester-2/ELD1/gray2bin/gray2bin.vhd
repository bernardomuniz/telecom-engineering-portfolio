entity gray2bin is
generic(
		N: natural := 20
);
port
(
	g: in bit_vector (N-1 downto 0);
	b: buffer bit_vector(N-1 downto 0)
	);
end entity;


architecture bernardo_t of gray2bin is
begin

	l1: for i in 0 to N-2 generate
		b(i) <= g(i) xor b(i + 1);
	end generate;
	
	b(N-1) <= g(N-1) xor '0';
	
	
end architecture;
