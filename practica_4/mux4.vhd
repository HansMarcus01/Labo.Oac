library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
	Port( sel : in STD_LOGIC_VECTOR(1 downto 0);
			I0, I1, I2, I3 : in STD_LOGIC; -- Condiciones de la carta ASM
			O : out STD_LOGIC
			);
end mux4;

architecture Behavioral of mux4 is
begin
	process (sel, I0, I1, I2, I3) -- Agregar variables
	begin
		if sel = "00" then
			O <= I0;
		elsif sel = "01" then
			O <= I1;
		elsif sel = "10" then
			O <= I2;
		else
			O <= I3;
		end if;
	end process;
end Behavioral;