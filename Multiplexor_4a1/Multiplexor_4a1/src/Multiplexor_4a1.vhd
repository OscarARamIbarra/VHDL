-------------------------------------------------------------------------------
--
-- Title       : Multiplexor_4a1
-- Design      : Multiplexor_4a1
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : Multiplexor_4a1.vhd
-- Generated   : Mon May  4 17:17:30 2020
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
--{entity {Multiplexor_4a1} architecture {Simple}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Multiplexor_4a1 is
	 port(
		 I : in STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S : in STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Y : out STD_LOGIC
	     );
end Multiplexor_4a1;

--}} End of automatically maintained section

architecture Simple of Multiplexor_4a1 is
begin

	PROCESS(S,I)  
	BEGIN
		CASE S IS
			WHEN "00" => Y <= I(0);
			WHEN "01" => Y <= I(1);
			WHEN "10" => Y <= I(2);
			WHEN OTHERS => Y <= I(3);
		END CASE;
	END PROCESS;
end Simple;
