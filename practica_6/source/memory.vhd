library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
	Port( dir : in STD_LOGIC_VECTOR(3 downto 0); --Edo Presente
			data : out STD_LOGIC_VECTOR(16 downto 0) --Prueba+VF+MI+L+SC+SI
			);
end memory;

architecture Behavioral of memory is
	type mem is array(0 to 15) of std_logic_vector(16 downto 0);
	signal internal_mem : mem;
	
begin
						 --Prueba+ VF  +  MI  +  Liga  +  S.C  +  S.I

		
	process(dir)
	begin
		data <= internal_mem(conv_integer(unsigned(dir)));
	end process;
end Behavioral;