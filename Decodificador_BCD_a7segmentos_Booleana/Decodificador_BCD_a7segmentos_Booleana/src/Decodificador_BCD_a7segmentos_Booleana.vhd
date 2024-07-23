-------------------------------------------------------------------------------
--
-- Title       : Decodificador_BCD_a7segmentos_Booleana
-- Design      : Decodificador_BCD_a7segmentos_Booleana
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : Decodificador_BCD_a7segmentos_Booleana.vhd
-- Generated   : Mon May  4 19:14:56 2020
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
--{entity {Decodificador_BCD_a7segmentos_Booleana} architecture {Decodificador}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Decodificador_BCD_a7segmentos_Booleana is
	 port(
		 B : in STD_LOGIC_VECTOR(3 downto 0);
		 S : out STD_LOGIC_VECTOR(7 downto 1)
	     );
end Decodificador_BCD_a7segmentos_Booleana;

--}} End of automatically maintained section

architecture Decodificador of Decodificador_BCD_a7segmentos_Booleana is
begin

	S(7)<=((NOT b(2)) OR b(1) OR b(0)) AND (b(3) OR  b(2) OR  b(1) OR (NOT b(0)));	
	S(6)<=((NOT B(2)) OR B(1) OR (NOT B(0))) AND ((NOT B(1)) OR B(0));
	S(5)<=(B(1) OR (NOT B(1))) AND (NOT B(1) OR B(2) OR B(0));
	S(4)<=(((B(2)) AND (NOT B(1)) AND (B(0))) OR (NOT B(2)) OR B(3) OR ((B(1)) AND (NOT B(0))) OR ((B(2)) AND (B(1)))) AND (((B(2)) AND (NOT B(1)) AND (B(0))) OR (NOT B(0)) OR B(1));
	S(3)<=(NOT B(0)) AND ((NOT B(2)) OR B(1));
	S(2)<=(B(3) OR (NOT B(1)) OR (NOT B(0))) AND (B(3) OR B(2) OR ((NOT B(1)) AND (NOT B(0))));
	S(1)<=(B(3) OR B(2) OR B(1)) AND (B(3) OR (NOT B(1)) OR (NOT B(0)) OR (NOT B(2)));
	

end Decodificador;
