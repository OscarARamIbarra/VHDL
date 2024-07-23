-------------------------------------------------------------------------------
--
-- Title       : Maquina_De_Estados_Finitos
-- Design      : Maquina_De_Estados_Finitos
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : Maquina_De_Estados_Finitos.vhd
-- Generated   : Tue May 26 11:26:59 2020
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
--{entity {Maquina_De_Estados_Finitos} architecture {Maquina_De_Estados}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Maquina_De_Estados_Finitos is
	 port(
		 X : in std_logic_vector(1 downto 0);
		 CLK : in STD_LOGIC;
		 Z : out STD_LOGIC
	     );
end Maquina_De_Estados_Finitos;

--}} End of automatically maintained section

architecture Maquina_De_Estados of Maquina_De_Estados_Finitos is  
type estados is (A, B, C, E);
signal estado_pres, estado_fut: estados;
begin

	-- enter your statements here --
	
	PROCESS (CLK)
	BEGIN
		if CLK = '1' THEN
			estado_pres <= estado_fut;
		end if;
	end process;
	
	process (estado_pres, X)	 
	begin

		case estado_pres is
			when A => Z <= '0';
			if (X = "00") THEN
				estado_fut <= A;
			elsif (X = "01") then 
				estado_fut <= B;
			elsif (X = "10") then 
				estado_fut <= C;
			end if;
			
			when B => 
			if (X = "00") THEN
				estado_fut <= B;
				Z <= '0';
			elsif (X = "01") then 
				estado_fut <= C; 
				Z <= '0';
			elsif (X = "10") then 
				estado_fut <= A;
				Z <= '1';
			end if; 
			
			when C => 
			if (X = "00") THEN
				estado_fut <= C;
			elsif (X = "01") then 
				estado_fut <= A;
				Z <='1';
			elsif (X = "10") then 
				estado_fut <= E;
				Z <= '1';
			end if;  
			
			when E => Z <= '1';
			estado_fut <= A;	  
		END CASE;	 
	end process;

end Maquina_De_Estados;
