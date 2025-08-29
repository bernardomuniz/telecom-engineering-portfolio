
entity bin2gray_vl is
	port (
	b0, b1, b2, b3: in bit;                          
	g0, g1, g2, g3: out bit
	);
end entity;

architecture ifsc_v1 of bin2gray_vl is
begin
	g0 <= b0 xor b1;
	g1 <= b1 xor b2;
	g2 <= b2 xor b3;
	g3 <= b3;
end architecture;