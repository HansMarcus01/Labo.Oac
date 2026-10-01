library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisor_datos is
	Port( entrada : in STD_LOGIC_VECTOR(6 downto 0); --Entradas
			liga : out STD_LOGIC_VECTOR(2 downto 0); --Edo Presente
			salidas : out STD_LOGIC_VECTOR(3 downto 0)
			);
end divisor_datos;

architecture Behavioral of divisor_datos is
begin
	process (entrada)
	begin
		liga <= --Asignar los 3 bits mas significativos de la entrada;
		salidas <= --Asignar los 4 bits menos significativos de la entrada;
	end process;
end Behavioral;