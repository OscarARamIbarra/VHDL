-------------------------------------------------------------------------------
--
-- Title       : multiplexor_2a1_case
-- Design      : Multiplexor_2a1_case
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : multiplexor_2a1_case.vhd
-- Generated   : Mon May  4 16:47:23 2020
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
--{entity {multiplexor_2a1_case} architecture {Simple}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity multiplexor_2a1_case is
	 port(
		 I : in STD_LOGIC_VECTOR(1 DOWNTO 0);
		 S : in STD_LOGIC;
		 Y : out STD_LOGIC
	     );
end multiplexor_2a1_case;

--}} End of automatically maintained section

architecture Simple of multiplexor_2a1_case is
begin
    PROCESS(S,I)	   
	BEGIN
		CASE S IS
			WHEN '0' => Y <= I(0);
			WHEN OTHERS => Y <= I(1);
		END CASE;
	END PROCESS;

end Simple;
