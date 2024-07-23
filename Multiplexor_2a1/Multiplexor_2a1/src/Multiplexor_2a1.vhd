-------------------------------------------------------------------------------
--
-- Title       : Multiplexor_2a1
-- Design      : Multiplexor_2a1
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : Multiplexor_2a1.vhd
-- Generated   : Mon May  4 14:08:27 2020
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
--{entity {Multiplexor_2a1} architecture {SIMPLE}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Multiplexor_2a1 is
	 port(
		 I : in STD_LOGIC_VECTOR(1 DOWNTO 0);
		 S : in STD_LOGIC;
		 Y : out STD_LOGIC
	     );
end Multiplexor_2a1;

--}} End of automatically maintained section

architecture SIMPLE of Multiplexor_2a1 is
begin

	 Y <= I(0) WHEN (S = '0') ELSE I(1);

end SIMPLE;
