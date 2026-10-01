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
	--CREAR Arreglo ROM de 64 palabras de 7 bits
	--type ___ is ____ ;
	--signal internal_mem : [nombre_de_su_Arreglo];
	
begin
	--	ESTADO X Ejemplo:
	--internal_mem(0) <= "L2L1L0" & "S1S0U1U0"
	-- ....
	--internal_mem(63) <= "L2L1L0" & "S1S0U1U0"
		
	process(dir)
	begin
		data <= internal_mem(conv_integer(unsigned(dir))); --conversion de palabra a entero
	end process;
end Behavioral;