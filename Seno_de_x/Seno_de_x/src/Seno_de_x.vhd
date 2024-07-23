-------------------------------------------------------------------------------
--
-- Title       : Seno_de_x
-- Design      : Seno_de_x
-- Author      : Oscar A Ramirez I
-- Company     : OARI
--
-------------------------------------------------------------------------------
--
-- File        : Seno_de_x.vhd
-- Generated   : Wed Jun  3 09:30:34 2020
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
--{entity {Seno_de_x} architecture {Seno_de_x}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity Seno_de_x is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 x : in STD_LOGIC_VECTOR(11 downto 0);
		 bus_datos : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end Seno_de_x;

--}} End of automatically maintained section

architecture Behavioral of Seno_de_x is
--Señales para registrar el valor de x2 y x3
   signal reg_x2_int: std_logic_vector (23 downto 0) := "000000000000000000000000";
   signal reg_x3_int: std_logic_vector (35 downto 0) := "000000000000000000000000000000000000";
--Señales para registrar el valor de x3/8 y x5/128
   signal reg_x3: std_logic_vector (16 downto 0) := "00000000000000000";
   signal reg_x5: std_logic_vector (16 downto 0) := "00000000000000000";
--Señal para registrar el valor de x - x3/6 + x5/120
   signal reg_suma: std_logic_vector (15 downto 0) := "0000000000000000";
begin
end Behavioral;


process(clk,reset)
begin
   if reset = '1' then
      reg_xa <= "000000000000";
   elsif clk'event and clk = '1' then
      reg_xa <= x; 
   end if;
end process;  

process(clk,reset)
begin
   if reset = '1' then
      reg_xb <= "000000000000";
   elsif clk'event and clk = '1' then
      reg_xb <= reg_xa; --Retraso 1 clock (rad)
   end if;
end process;

process(clk,reset)
begin
   if reset = '1' then
      reg_xc <= "000000000000";
   elsif clk'event and clk = '1' then
      reg_xc <= reg_xb; --Retraso 2 clock (rad)
   end if;
end process;

process(clk,reset)
   variable x2: std_logic_vector (23 downto 0):= "000000000000000000000000";
   variable x3: std_logic_vector (35 downto 0):= "000000000000000000000000000000000000";
begin
   if reset = '1' then
      reg_x2_int <= "000000000000000000000000";
      reg_x3_int <= "000000000000000000000000000000000000";
   elsif clk'event and clk = '1' then
      x2 := reg_xa * reg_xa;
      x3 := reg_xa * reg_xa * reg_xa;
      reg_x2_int <= x2;
      reg_x3_int <= x3;
   end if;
end process;	


process(clk,reset)
   variable x3: std_logic_vector (35 downto 0):= "000000000000000000000000000000000000";
   variable x5: std_logic_vector (59 downto 0):= "000000000000000000000000000000000000000000000000000000000000";
   variable x3_aprox: std_logic_vector (16 downto 0):= "00000000000000000";
   variable x5_aprox: std_logic_vector (16 downto 0):= "00000000000000000";
   variable x3_div: std_logic_vector (16 downto 0):= "00000000000000000";
   variable x5_div: std_logic_vector (16 downto 0):= "00000000000000000";
begin
   if reset = '1' then
      reg_x3 <= "00000000000000000";
      reg_x5 <= "00000000000000000";
   elsif clk'event and clk = '1' then
      x3 := reg_x3_int; --x3
      x5 := reg_x3_int * reg_x2_int; --cálculo de x5
--Al hacer las multiplicaciones el vector se queda justificado a la
--derecha. Como ahora voy a dividir, que es lo mismo que meter ceros por la
--izquierda, quiero tener mi vector justificado a la izquierda primero para
--poder hacer bien la división. La función aproximar se encargará de
--justificar el vector a la izquierda.
--Esto se hace realmente por el formato de almacenamiento de datos que
--estamos usando. Para saber realmente donde está la coma de los decimales
      x3_aprox := aproximar ("000000000000000000000000" & x3);
      x5_aprox := aproximar (x5);
--Divido entre 8 y 128 respectivamente
      x3_div := "000" & x3_aprox(16 downto 3);
      x5_div := "0000000" & x5_aprox(16 downto 7);
--Registro los valores de las divisiones
      reg_x3 <= x3_div;
      reg_x5 <= x5_div;
   end if;
end process;


process(clk,reset)
   variable suma1: std_logic_vector (15 downto 0):= "0000000000000000";
   variable flag: std_logic := '0';
begin
   if reset = '1' then
      reg_suma <= "0000000000000000";
   elsif clk'event and clk = '1' then
--Introducimos en la funcion todas las variables que serán necesarias
      suma1 := suma(reg_bus_dir_Ic,reg_xc,reg_x3,reg_x5);
--Hacer CA2 para los angulos (181-360)
--Sirve para sacar los angulos directamente con su signo correspondiente,
--independientemente de si es positivo o negativo
      if reg_bus_dir_c > 180 and reg_bus_dir_c < 361 then
         suma1 := suma1 - '1';
         for i in 0 to 15 loop
            if suma1(i) = '1' and flag = '0' then
               flag := '1';
            elsif flag = '1' then
               suma1(i) := not suma1(i);
            end if;
         end loop;
      end if;
--Registramos el valor obtenido
      reg_suma <= suma1;
   end if;
end process;
--Sacamos el seno por el puerto de salida
bus_datos <= reg_suma;
end Behavioral;


function aproximar (valor: std_logic_vector(59 downto 0)) return
std_logic_vector is
   variable cont : integer;
   variable flag : std_logic;
   variable x : std_logic_vector(59 downto 0);
   variable aux : std_logic_vector(59 downto 0);
begin
   x := "000000000000000000000000000000000000000000000000000000000000";
   aux := "000000000000000000000000000000000000000000000000000000000000";
   cont := 59;
   flag := '0';
   x := valor;
   for i in 59 downto 0 loop --Recorremos el vector
      if x(i)='1' and flag='0' then --Si encontramos el primer „1?
         flag := '1'; --Aviso de que ha sido encontado
         aux(cont):= x(i); --Copiamos en variable auxiliar
         x(i) := '0';
         cont := cont - 1;
      elsif flag='1' then --Para el resto del vector
         if x(i) /= '1' and x(i) /= '0' then
            x(i) := '0'; --Por si acaso hay alguna posición del
         end if; --vector indefinida la ponemos a cero
         aux(cont):= x(i); --Seguimos copiando en variable aux.
         x(i) := '0';
         cont := cont - 1;
      end if;
   end loop;
   return aux(59 downto 43); --Devolvemos el resultado (17 bits)
end;


function suma (angulo: integer; x: std_logic_vector(11 downto 0);x3:
std_logic_vector(16 downto 0); x5: std_logic_vector(16 downto 0)) return
std_logic_vector is
   variable suma : std_logic_vector (15 downto 0):= "0000000000000000";
begin
   case angulo is
      when (0) => … ;
      when (1) => … ;
      …
      when (30)=> suma := (x & "0000") - ((("000000") & x3(16 downto 7)) + "0000011000") + ((("00000000") & x5(16 downto 9)) +"00000");
      …
      when (90) => … ;
      when others => suma := "0000000000000000";
   end case;
   return suma;
end;
