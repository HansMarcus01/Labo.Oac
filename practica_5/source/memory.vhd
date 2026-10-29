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
		-- Prueba(2) & VF(1) & Liga(3) & Salidas Carga(4) & Salidas Inc.(4)
		"00" & '0' & "001" & "1100" & "0000", -- Estado 000[cite: 28]
		"00" & '0' & "010" & "0111" & "0111", -- Estado 001[cite: 28]
		"01" & '0' & "110" & "1001" & "0110", -- Estado 010[cite: 28]
		"00" & '0' & "100" & "0011" & "0011", -- Estado 011[cite: 28]
		"00" & '0' & "101" & "1100" & "1100", -- Estado 100[cite: 28]
		"00" & '0' & "001" & "1010" & "1010", -- Estado 101[cite: 28]
		"10" & '1' & "101" & "0011" & "1011", -- Estado 110[cite: 28]
		"00" & '0' & "000" & "0001" & "0001"  -- Estado 111[cite: 28]
	);
begin
	process(dir)
	begin
		data <= internal_mem(conv_integer(unsigned(dir)));
	end process;
end Behavioral;