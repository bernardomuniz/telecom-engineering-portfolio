library ieee;
use ieee.std_logic_1164.all;


entity display7seg is
	port --abcdefg
	(
		bin: in std_logic_vector(3 downto 0);
		sdd: out std_logic_vector(6 downto 0)
	);
end display7seg;

architecture bernardo_t of display7seg is
begin
	sdd <= "1111110" when bin = "0000" else
			"0110000" when bin = "0001" else
			"1101101" when bin = "0010" else
			"1111001" when bin = "0011" else
			"0110011" when bin = "0100" else
			"1011011" when bin = "0101" else
			"1011111" when bin = "0110" else
			"1110000" when bin = "0111" else
			"1111111" when bin = "1000" else
			"1111011" when bin = "1001" else
			"1110111" when bin = "1010" else
			"0011111" when bin = "1011" else
			"0001101" when bin = "1100" else
			"0111101" when bin = "1101" else
			"1001111" when bin = "1110" else
			"1000111" when bin = "1111" ;
			

end bernardo_t;
