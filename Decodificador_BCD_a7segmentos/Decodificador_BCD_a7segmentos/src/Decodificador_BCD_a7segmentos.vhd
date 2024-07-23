-------------------------------------------------------------------------------
--
-- Title       : Decodificador_BCD_a7segmentos
-- Design      : Decodificador_BCD_a7segmentos
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : Decodificador_BCD_a7segmentos.vhd
-- Generated   : Mon May  4 18:02:06 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Decodificador_BCD_a7segmentos} architecture {Decodificador}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Decodificador_BCD_a7segmentos is
	 port(
		 B : in STD_LOGIC_VECTOR(3 downto 0);
		 S : out STD_LOGIC_VECTOR(7 downto 1)
	     );
end Decodificador_BCD_a7segmentos;

--}} End of automatically maintained section

architecture Decodificador of Decodificador_BCD_a7segmentos is
begin

	PROCESS(B)
	BEGIN
		CASE B IS
			WHEN "0000" => S <= "1111110";
			WHEN "0001" => S <= "0110000";
			WHEN "0010" => S <= "1101101";
			WHEN "0011" => S <= "1111001";
			WHEN "0100" => S <= "0110011";
			WHEN "0101" => S <= "1011011";
			WHEN "0110" => S <= "1011111";
			WHEN "0111" => S <= "1110000";
			WHEN "1000" => S <= "1111111";
			WHEN "1001" => S <= "1110011";
			WHEN OTHERS => S <= "-------";
		END CASE;
	END PROCESS;

end Decodificador;
