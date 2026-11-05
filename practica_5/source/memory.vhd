library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
	Port( dir : in STD_LOGIC_VECTOR(2 downto 0); 
			data : out STD_LOGIC_VECTOR(13 downto 0) 
			);
end memory;

architecture Behavioral of memory is
	type mem is array(0 to 7) of std_logic_vector(13 downto 0);
	signal internal_mem : mem := (
		-- Orden físico: Prueba(2) & VF(1) & Liga(3) & Salidas Inc.(4) & Salidas Carga(4)
		"00" & '0' & "000" & "0000" & "1100", -- Estado 000: Liga corregida a 000
		"00" & '0' & "010" & "0111" & "0111", -- Estado 001
		"01" & '0' & "110" & "1001" & "0110", -- Estado 010
		"00" & '0' & "100" & "0011" & "0011", -- Estado 011
		"00" & '0' & "101" & "1100" & "1100", -- Estado 100
		"11" & '1' & "001" & "0110" & "0110", -- Estado 101: Salto incondicional forzado a 001 evaluando W(11)
		"10" & '1' & "101" & "1011" & "0011", -- Estado 110
		"00" & '0' & "000" & "0001" & "0001"  -- Estado 111
	);
begin
	process(dir)
	begin
		data <= internal_mem(conv_integer(unsigned(dir)));
	end process;
end Behavioral;