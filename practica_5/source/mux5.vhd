library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux5 is
    Port( sel : in STD_LOGIC_VECTOR(1 downto 0);
          X : in STD_LOGIC;
          Y : in STD_LOGIC;
          Z : in STD_LOGIC;
          W : in STD_LOGIC; -- VCC (1 Lógico)
          O : out STD_LOGIC
          );
end mux5;

architecture Behavioral of mux5 is
begin
    process (sel, X, Y, Z, W)
    begin
        case sel is
            when "00" => O <= X;
            when "01" => O <= Y;
            when "10" => O <= Z;
            when "11" => O <= W;
            when others => O <= '0';
        end case;
    end process;
end Behavioral;