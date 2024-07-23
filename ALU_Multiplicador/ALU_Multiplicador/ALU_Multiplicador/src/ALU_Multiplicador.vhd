-------------------------------------------------------------------------------
--
-- Title       : ALU_Multiplicador
-- Design      : ALU_Multiplicador
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : ALU_Multiplicador.vhd
-- Generated   : Mon May 11 13:19:42 2020
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
--{entity {ALU_Multiplicador} architecture {ARQ}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use	IEEE.STD_LOGIC_unsigned.all;

entity ALU_Multiplicador is	  
	generic(
	n: POSITIVE :=4
	);
	 port(
		 A : in STD_LOGIC_vector(n-1 downto 0);
		 B : in STD_LOGIC_vector(n-1 downto 0);
		 Ci : in STD_LOGIC;
		 F : in STD_LOGIC_vector(2 downto 0);
		 R : out STD_LOGIC_vector(2*n-1 downto 0);
		 S : out STD_LOGIC;
		 Z : out STD_LOGIC;
		 V : out STD_LOGIC;
		 C : out STD_LOGIC
	     );
end ALU_Multiplicador;

--}} End of automatically maintained section

architecture ARQ of ALU_Multiplicador is 
begin	 
	process(A, B, F) 
	begin
	 case F is
		
		  when "000" =>
		  R <= std_logic_vector(signed(A) * SIGNED(B));
		  S <= '0';
		  Z <= '0';
		  V <= '0';
		  C <= '0';
          when "001" =>	
		  R <= std_logic_vector(signed(A) * SIGNED(B));
		  S <= '0';
		  Z <= '0';
		  V <= '0';
		  C <= '0'; 
          when "010" =>  
		  R <= std_logic_vector(signed(A) * SIGNED(B));
		  S <= '0';
		  Z <= '0';
		  V <= '0';
		  C <= '0'; 
          when "011" =>	
		  R <= std_logic_vector(signed(A) * SIGNED(B));
 		  S <= '0';
		  Z <= '0';
		  V <= '0';
		  C <= '0';
          when "100" => 
		  R <= std_logic_vector(signed(A) * SIGNED(B));
          S <= '0';
		  Z <= '0';
		  V <= '0';
		  C <= '0';  
		  when "101" =>  
		  R <= std_logic_vector(signed(A) * SIGNED(B));
		  S <= '0';
		  Z <= '0';
		  V <= '0';
		  C <= '0';
          when "110" =>	 
		  R <= std_logic_vector(signed(A) * SIGNED(B));
		  S <= '0';
		  Z <= '0';
		  V <= '0';
		  C <= '0';
          when others => 
		  R <= std_logic_vector(signed(A) * SIGNED(B));
		  S <= '0';
		  Z <= '0';
		  V <= '0';
		  C <= '0';
	 end case; 
	end process;
	  

end ARQ;
