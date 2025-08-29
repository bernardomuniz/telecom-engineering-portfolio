entity demux1x4 is
	port
	(
		-- Input ports
		x	: in bit;
		Sel: in bit_vector(1 downto 0);
		y	: out bit_vector (3 downto 0) 
	);
end demux1x4;

architecture bernardo_t of demux1x4 is
begin
	y(0) <= x and (not Sel(0)) and (not Sel(1));
	y(1) <= X and (not Sel(1)) and (Sel(0));
	y(2) <= x and (Sel(1)) and (not Sel(0));
	y(3) <= x and Sel(1) and Sel(0);
	
end bernardo_t;
