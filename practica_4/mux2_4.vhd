library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_4 is
	Port( sel : in STD_LOGIC;
			Salida_Falsa, Salida_Verdadera : in STD_LOGIC_VECTOR(3 downto 0); -- Entradas de salidas
			O : out STD_LOGIC_VECTOR(3 downto 0)
			);
end mux2_4;

architecture Behavioral of mux2_4 is
begin
	process (sel, Salida_Falsa, Salida_Verdadera) -- Agregar variables
	begin
		if sel = '1' then
			O <= Salida_Verdadera;
		else
			O <= Salida_Falsa;
		end if;
	end process;
end Behavioral;