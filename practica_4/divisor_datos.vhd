library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor_datos is
	Port( entrada : in STD_LOGIC_VECTOR( 17 downto 0); -- 18 bits que vienen de la memoria
			
			Prueba           : out STD_LOGIC_VECTOR(1 downto 0); -- Para el MUX4 (2 bits)
			Liga_Falsa       : out STD_LOGIC_VECTOR(3 downto 0); -- Para el MUX2_3 (4 bits)
			Liga_Verdadera   : out STD_LOGIC_VECTOR(3 downto 0); -- Para el MUX2_3 (4 bits)
			Salida_Falsa     : out STD_LOGIC_VECTOR(3 downto 0); -- Para el MUX2_4 (4 bits)
			Salida_Verdadera : out STD_LOGIC_VECTOR(3 downto 0)  -- Para el MUX2_4 (4 bits)
			);
end divisor_datos;

architecture Behavioral of divisor_datos is
begin
	process (entrada)
	begin
		
		Prueba           <= entrada(17 downto 16);
		Liga_Falsa       <= entrada(15 downto 12);
		Liga_Verdadera   <= entrada(11 downto 8);
		Salida_Falsa     <= entrada(7 downto 4);
		Salida_Verdadera <= entrada(3 downto 0);
		
	end process;
end Behavioral;