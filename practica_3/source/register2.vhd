library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register2 is
	Port( CLK : in STD_LOGIC;
			RESET : in STD_LOGIC;
			DATA_IN : in STD_LOGIC_VECTOR(2 downto 0); --Liga
			DATA_OUT : out STD_LOGIC_VECTOR(2 downto 0)--Edo Presente
			);
end register2;

architecture Behavioral of register2 is
	signal internal_value : std_logic_vector(2 downto 0) := B"000";
begin
	process (CLK, RESET, DATA_IN)
	begin
		if RESET = '0' then
			--Asignar a internal_value el estado 0;
		elsif rising_edge (CLK) then
			--Asignar a internal_value el valor de DATA_IN
		end if;
	end process;
	
	process(internal_value)
	begin
		--Asignar valor interno a DATA_OUT
	end process;
end Behavioral;