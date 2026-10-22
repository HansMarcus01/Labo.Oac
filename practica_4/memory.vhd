library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
	Port( dir : in STD_LOGIC_VECTOR( 3 downto 0); -- 4 bits de direcciones (n=4)
			data : out STD_LOGIC_VECTOR( 17 downto 0) -- 18 bits de memoria por registro (m=18)
			);
end memory;

architecture Behavioral of memory is
	type mem is array(0 to 15) of std_logic_vector( 17 downto 0); 
	
	signal internal_mem : mem := (
		
		-- ESTADO 0000: Evalúa 'w' (00).
		-- Falso: S1S0(1100), Liga 0000.  Verdadero: Nada(0000), Liga 1001.
		0 => B"00_0000_1001_1100_0000",
		
		-- ESTADO 0001: Salida base U1'(0010). Evalúa 'y' (10).
		-- Falso: U1'U0'(0011) | U1'(0010) = 0011, Liga 0111. 
		-- Verdadero: S1S0(1100) | U1'(0010) = 1110, Liga 0011.
		1 => B"10_0111_0011_0011_1110",
		
		-- ESTADO 0010: Incondicional. Salida U0'(0001). Liga directa a 1000.
		2 => B"00_1000_1000_0001_0001",
		
		-- ESTADO 0011: Evalúa 'z' (11).
		-- Falso: S0(0100), Liga 0110. Verdadero: U0'(0001), Liga 0101.
		3 => B"11_0110_0101_0100_0001",
		
		-- ESTADO 0100: Incondicional. Salida U1'U0'(0011). Liga directa a 0011.
		4 => B"00_0011_0011_0011_0011",
		
		-- ESTADO 0101: Incondicional. Salida S1, S0, U1' (1110). Liga directa a 1000.
		5 => B"00_1000_1000_1110_1110",
		
		-- ESTADO 0110: Incondicional. Salida S1(1000). Liga directa a 0000.
		6 => B"00_0000_0000_1000_1000",
		
		-- ESTADO 0111: Incondicional. Salida S1S0(1100). Liga directa a 0100.
		7 => B"00_0100_0100_1100_1100",
		
		-- ESTADO 1000: Incondicional. Salida S0(0100). Liga directa a 0000.
		8 => B"00_0000_0000_0100_0100",
		
		-- ESTADO 1001: Salida base U1'U0'(0011). Evalúa 'x' (01).
		-- Falso: S0(0100) | U1'U0'(0011) = 0111, Liga 0001.
		-- Verdadero: S1(1000) | U1'U0'(0011) = 1011, Liga 0010.
		9 => B"01_0001_0010_0111_1011",
		
		-- ESTADOS SIN USO (10 al 15)
		others => B"00_0000_0000_0000_0000"
	);
	
begin
	process(dir)
	begin
		data <= internal_mem(conv_integer(unsigned(dir)));
	end process;
end Behavioral;