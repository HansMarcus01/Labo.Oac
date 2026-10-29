library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux1X2X1_3 is
	Port( sel : in STD_LOGIC; 
			E0 : in STD_LOGIC_VECTOR(3 downto 0); -- Incremento
			E1 : in STD_LOGIC_VECTOR(3 downto 0); -- Carga (Liga)
			salida : out STD_LOGIC_VECTOR(3 downto 0) 
			);
end mux1X2X1_3;

architecture Behavioral of mux1X2X1_3 is
begin
	process (sel, E0, E1)
	begin
		if sel = '0' then
			salida <= E0;
		else
			salida <= E1;
		end if;
	end process;
end Behavioral;