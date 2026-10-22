library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_3 is
	Port( sel : in STD_LOGIC;
			Liga_Falsa, Liga_Verdadera : in STD_LOGIC_VECTOR(3 downto 0); -- Ligas de 4 bits
			O : out STD_LOGIC_VECTOR(3 downto 0) -- Salida ajustada a 4 bits
			);
end mux2_3;

architecture Behavioral of mux2_3 is
begin
	process (sel, Liga_Falsa, Liga_Verdadera) -- Agregar variables a la lista de sensibilidad
	begin
		if sel = '1' then
			O <= Liga_Verdadera;
		else
			O <= Liga_Falsa;
		end if;
	end process;
end Behavioral;