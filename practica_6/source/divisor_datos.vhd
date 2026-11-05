library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisor_datos is
	Port( entrada : in STD_LOGIC_VECTOR(12 downto 0); -- Reducido a 13 bits
			prueba : out STD_LOGIC_VECTOR(1 downto 0);
			VF : out STD_LOGIC;
			MI : out STD_LOGIC_VECTOR(1 downto 0);
			liga : out STD_LOGIC_VECTOR(3 downto 0);
			salidas : out STD_LOGIC_VECTOR(3 downto 0) -- Único bus de salidas
			);
end divisor_datos;

architecture Behavioral of divisor_datos is
begin
	process (entrada)
	begin
		prueba  <= entrada(12 downto 11);
		VF      <= entrada(10);
		MI      <= entrada(9 downto 8);
		liga    <= entrada(7 downto 4);
		salidas <= entrada(3 downto 0);
	end process;
end Behavioral;