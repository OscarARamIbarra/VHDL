-------------------------------------------------------------------------------
--
-- Title       : ComparisonLstchVSFlipFlop
-- Design      : LatchVSFlipFlop
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : LatchVSFlipFlop.vhd
-- Generated   : Tue May 19 14:29:47 2020
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
--{entity {ComparisonLstchVSFlipFlop} architecture {Behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ComparisonLstchVSFlipFlop is
	 port(
		 CLK : in STD_LOGIC;
		 D : in STD_LOGIC;
		 QR : out STD_LOGIC;
		 QL : out STD_LOGIC
	     );
end ComparisonLstchVSFlipFlop;

--}} End of automatically maintained section

architecture Behavioral of ComparisonLstchVSFlipFlop is
begin

 process(Clk,D)  
 begin 
    if(Clk='1') then
   QL <= D; 
    end if;       
 end process;
	

--Código Flip Flop tipo D	
 process(Clk)  
 begin 
    if(rising_edge(Clk)) then
   QR <= D; 
    end if;       
 end process;

end Behavioral;
