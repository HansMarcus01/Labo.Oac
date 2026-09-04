library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prueba is
    port (
        -- Reloj de 50 MHz
        MAX10_CLK1_50 : in std_logic;
        
        -- Entradas (2 Botones y 10 Switches)
        KEY : in std_logic_vector(1 downto 0);
        SW  : in std_logic_vector(9 downto 0);
        
        -- Salidas (LEDs y Displays)
        LEDR : out std_logic_vector(9 downto 0);
        HEX0 : out std_logic_vector(7 downto 0);
        HEX1 : out std_logic_vector(7 downto 0);
        HEX2 : out std_logic_vector(7 downto 0);
        HEX3 : out std_logic_vector(7 downto 0);
        HEX4 : out std_logic_vector(7 downto 0);
        HEX5 : out std_logic_vector(7 downto 0)
    );
end prueba;

architecture rtl of prueba is
    -- Señal para el divisor de reloj
    signal clk_counter : unsigned(25 downto 0) := (others => '0');

begin

    -- 1. Prueba de Reloj (Divisor)
    process(MAX10_CLK1_50)
    begin
        if rising_edge(MAX10_CLK1_50) then
            clk_counter <= clk_counter + 1;
        end if;
    end process;


    -- 2. Lógica de LEDs, Switches y Botones
    process(SW, KEY)
    begin
        -- Asumimos que los botones son activos en bajo (0 cuando se presionan),
        -- lo cual es el estándar en casi todas las FPGA MAX10 / Altera.
        if KEY(0) = '0' or KEY(1) = '0' then
            LEDR <= SW;       -- Se invierte el estado (NOT (NOT SW))
        else
            LEDR <= not SW;   -- Estado por defecto
        end if;
    end process;


    -- 3. Lógica de Displays (Punto decimal parpadeante + Número 8)
    HEX0 <= clk_counter(24) & "0000000";
    HEX1 <= clk_counter(24) & "0000000";
    HEX2 <= clk_counter(24) & "0000000";
    HEX3 <= clk_counter(24) & "0000000";
    HEX4 <= clk_counter(24) & "0000000";
    HEX5 <= clk_counter(24) & "0000000";

end rtl;