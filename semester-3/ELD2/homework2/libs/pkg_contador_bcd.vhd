library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package pkg_contador_bcd is
    subtype digito_bcd is natural range 0 to 9;
    type vetor_bcd is array(natural range <>) of digito_bcd;

    function incrementa_bcd(bcd : vetor_bcd) return vetor_bcd;
end package;

package body pkg_contador_bcd is
    function incrementa_bcd(bcd : vetor_bcd) return vetor_bcd is
        variable resultado : vetor_bcd(bcd'range);
        variable vai_um : natural := 1;
    begin
        for i in bcd'reverse_range loop
            if vai_um = 1 then
                if bcd(i) = 9 then
                    resultado(i) := 0;
                    vai_um := 1;
                else
                    resultado(i) := bcd(i) + 1;
                    vai_um := 0;
                end if;
            else
                resultado(i) := bcd(i);
            end if;
        end loop;
        return resultado;
    end function;
end package body;
