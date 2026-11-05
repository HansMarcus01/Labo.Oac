library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity div_frec is
	Port (reloj : in std_logic;
			div_clk : out std_logic);
end div_frec;

architecture Behavioral of div_frec is
    signal pulso : std_logic := '0'; -- Señal para alternar el estado
begin
	process (reloj)
	variable cuenta : std_logic_vector (27 downto 0) := X"0000000";
	begin
		if rising_edge (reloj) then
			if cuenta = X"2FAF080" then
				cuenta := X"0000000";
				pulso <= not pulso; -- Cambia de 0 a 1 y viceversa cada 1 segundo
			else
				cuenta := cuenta+1;
			end if;
		end if;
	end process;
	
	div_clk <= pulso; -- Asignas la señal en lugar del bit de cuenta
end Behavioral;