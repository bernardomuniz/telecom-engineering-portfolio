library ieee;
use ieee.std_logic_1164.all;


entity demux4x1 is
	port
	(
		-- Input ports
		X	: in  std_logic;
		A	: in  std_logic_vector (1 downto 0);
		Y	: out std_logic_vector(3 downto 0)

	);
end entity;


architecture ifsc_v1 of demux4x1 is
begin
	Y <= 
	"000"& X when A = "00" else
	"00"& X &"0" when A = "01" else
	"0"&X&"00" when A = "10" else
	X & "000"; --a = "11"
	
end architecture;

architecture ifsc_v2 of demux4x1 is
begin
	Y <= 
	"ZZZ"& X when A = "00" else
	"ZZ"& X &"Z" when A = "01" else
	"Z"&X&"ZZ" when A = "10" else
	X & "ZZZ"; --a = "11"
	
end architecture;

architecture ifsc_v3 of demux1x4 is
	signal Y_aux	: std_logic_vector(3 downto 0);
begin
Y_aux <= 
	"ZZZ" & X      when A = "00" else
	"ZZ" & X & "Z" when A = "01" else
	"Z" & X & "ZZ" when A = "10" else	
	X & "ZZZ"; 
Y <= Y_aux when enable = '1' else "ZZZZ";
end architecture;
