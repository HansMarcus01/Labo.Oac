library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
	Port( dir : in STD_LOGIC_VECTOR(5 downto 0); --Entradas + edo presente
			data : out STD_LOGIC_VECTOR(6 downto 0) --Liga + Salidas
			);
end memory;

architecture Behavioral of memory is
	type rom_type is array (0 to 63) of std_logic_vector(6 downto 0);
	signal internal_mem : rom_type := (
		0 => "001" & "0011", -- P: 000, XYZ: 000
		1 => "001" & "0011", -- P: 000, XYZ: 001
		2 => "001" & "0011", -- P: 000, XYZ: 010
		3 => "001" & "0011", -- P: 000, XYZ: 011
		4 => "000" & "0011", -- P: 000, XYZ: 100
		5 => "000" & "0010", -- P: 000, XYZ: 101
		6 => "011" & "0010", -- P: 000, XYZ: 110
		7 => "011" & "0010", -- P: 000, XYZ: 111

		8 => "010" & "0111", -- P: 001, XYZ: 000
		9 => "010" & "0111", -- P: 001, XYZ: 001
		10 => "010" & "0111", -- P: 001, XYZ: 010
		11 => "010" & "0111", -- P: 001, XYZ: 011
		12 => "010" & "0111", -- P: 001, XYZ: 100
		13 => "010" & "0111", -- P: 001, XYZ: 101
		14 => "010" & "0111", -- P: 001, XYZ: 110
		15 => "010" & "0111", -- P: 001, XYZ: 111

		16 => "010" & "1111", -- P: 010, XYZ: 000
		17 => "100" & "1001", -- P: 010, XYZ: 001
		18 => "010" & "1111", -- P: 010, XYZ: 010
		19 => "100" & "1001", -- P: 010, XYZ: 011
		20 => "010" & "1111", -- P: 010, XYZ: 100
		21 => "100" & "1001", -- P: 010, XYZ: 101
		22 => "010" & "1111", -- P: 010, XYZ: 110
		23 => "100" & "1001", -- P: 010, XYZ: 111

		24 => "001" & "0001", -- P: 011, XYZ: 000
		25 => "001" & "0001", -- P: 011, XYZ: 001
		26 => "001" & "0001", -- P: 011, XYZ: 010
		27 => "001" & "0001", -- P: 011, XYZ: 011
		28 => "001" & "0001", -- P: 011, XYZ: 100
		29 => "001" & "0001", -- P: 011, XYZ: 101
		30 => "001" & "0001", -- P: 011, XYZ: 110
		31 => "001" & "0001", -- P: 011, XYZ: 111

		32 => "000" & "1100", -- P: 100, XYZ: 000
		33 => "000" & "1100", -- P: 100, XYZ: 001
		34 => "000" & "1100", -- P: 100, XYZ: 010
		35 => "000" & "1100", -- P: 100, XYZ: 011
		36 => "000" & "1100", -- P: 100, XYZ: 100
		37 => "000" & "1100", -- P: 100, XYZ: 101
		38 => "000" & "1100", -- P: 100, XYZ: 110
		39 => "000" & "1100", -- P: 100, XYZ: 111

		others => "000" & "0000"
	);
begin
	process(dir)
	begin
		data <= internal_mem(conv_integer(unsigned(dir)));
	end process;
end Behavioral;