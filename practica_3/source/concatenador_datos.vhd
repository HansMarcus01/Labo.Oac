library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity concatenador_datos is
	Port( entradaA : in STD_LOGIC_VECTOR(2 downto 0); --Entradas
			entradaB : in STD_LOGIC_VECTOR(2 downto 0); --Edo Presente
			salida : out STD_LOGIC_VECTOR(5 downto 0)
			);
end concatenador_datos;

architecture Behavioral of concatenador_datos is
	signal internal_value : std_logic_vector(2 downto 0) := B"000";
begin
	process (entradaA, entradaB)
	begin
		 --Asignar la concatenacion del Edo Presente y Entradas a la Salida.
		 salida <= entradaB & entradaA;
	end process;
end Behavioral;