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
		
		-- ESTADO 0000: Evalúa 'w' (00). Base: Nada (0011)
		-- Falso: S1, S0 ON (1111), Liga 0000.  Verdadero: Nada ON (0011), Liga 1001.
		0 => B"00_0000_1001_1111_0011",
		
		-- ESTADO 0001: Salida base U1' ON (0001). Evalúa 'y' (10).
		-- Falso: U1', U0' ON (0000), Liga 0111. 
		-- Verdadero: Base + S1, S0 ON (1101), Liga 0011.
		1 => B"10_0111_0011_0000_1101",
		
		-- ESTADO 0010: Incondicional. Salida U0' ON (0010). Liga directa a 1000.
		2 => B"00_1000_1000_0010_0010",
		
		-- ESTADO 0011: Evalúa 'z' (11). Base: Nada (0011)
		-- Falso: S0 ON (0111), Liga 0110. Verdadero: U0' ON (0010), Liga 0101.
		3 => B"11_0110_0101_0111_0010",
		
		-- ESTADO 0100: Incondicional. Salida U1', U0' ON (0000). Liga directa a 0011.
		4 => B"00_0011_0011_0000_0000",
		
		-- ESTADO 0101: Incondicional. Salida S1, S0, U1' ON (1101). Liga directa a 1000.
		5 => B"00_1000_1000_1101_1101",
		
		-- ESTADO 0110: Incondicional. Salida S1 ON (1011). Liga directa a 0000.
		6 => B"00_0000_0000_1011_1011",
		
		-- ESTADO 0111: Incondicional. Salida S1, S0 ON (1111). Liga directa a 0100.
		7 => B"00_0100_0100_1111_1111",
		
		-- ESTADO 1000: Incondicional. Salida S0 ON (0111). Liga directa a 0000.
		8 => B"00_0000_0000_0111_0111",
		
		-- ESTADO 1001: Salida base U1', U0' ON (0000). Evalúa 'x' (01).
		-- Falso: Base + S0 ON (0100), Liga 0001.
		-- Verdadero: Base + S1 ON (1000), Liga 0010.
		9 => B"01_0001_0010_0100_1000",
		
		-- ESTADOS SIN USO (10 al 15): Llenos con el estado de "Apagado" para todos los LEDs
		others => B"00_0000_0000_0011_0011"
	);
	
begin
	process(dir)
	begin
		data <= internal_mem(conv_integer(unsigned(dir)));
	end process;
end Behavioral;