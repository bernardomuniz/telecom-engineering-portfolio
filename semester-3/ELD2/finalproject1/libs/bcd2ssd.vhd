library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd2ssd is
    -- tipo 0 => display anodo comum
    -- tipo 1 => display catodo comum
    generic (tipo : natural := 1); 
    port (
        oculta_zero : in std_logic;  -- Nome mais descritivo
        bcd_in      : in std_logic_vector(3 downto 0);
        ssd_out     : out std_logic_vector(6 downto 0)
    );
end entity;

architecture rtl of bcd2ssd is
    signal seg, seg_final : std_logic_vector(6 downto 0);
	 signal bcd_aux : std_logic_vector(3 downto 0);
begin
    process(bcd_in, oculta_zero, bcd_aux, seg)
    begin
	 
	 bcd_aux <= bcd_in;
	 
        case bcd_aux is
            when "0000" => seg <= "1000000"; --ok -- Padrão mais comum (segmento 'a' é o LSB)
            when "0001" => seg <= "1111001"; --ok
            when "0010" => seg <= "0100100"; --ok
            when "0011" => seg <= "0110000"; --ok
            when "0100" => seg <= "0011001"; --ok
            when "0101" => seg <= "0010010"; --ok
            when "0110" => seg <= "0000010"; --ok
            when "0111" => seg <= "1111000"; 
            when "1000" => seg <= "0000000"; 
            when "1001" => seg <= "0010000"; 
            when others => seg <= "1111111"; 
        end case;
  
        if oculta_zero = '1' and bcd_aux = "0000" then
            seg_final <= (others => '1');
        else
            seg_final <= seg;
        end if;
    end process;
   
    anode_common: if tipo = 0 generate
        ssd_out <= seg_final;
    end generate;
    
    cathode_common: if tipo = 1 generate
        ssd_out <= not seg_final;
    end generate;
end architecture;