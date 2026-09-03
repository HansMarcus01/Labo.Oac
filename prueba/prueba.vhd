library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prueba is
    port (
        -- Reloj de 50 MHz
        MAX10_CLK1_50 : in std_logic;
        
        -- Entradas (2 Botones y 9 Switches)
        KEY : in std_logic_vector(1 downto 0);
        SW  : in std_logic_vector(8 downto 0); -- Modificado: Solo SW0 a SW8
        
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
    
    -- Subtipo para forzar la dirección (downto) y evitar el Error 10485
    subtype t_hex is std_logic_vector(7 downto 0);
    
    -- Función mejorada: recibe el valor BCD y el estado del botón para el punto decimal (dp)
    function decode_7seg(bcd : std_logic_vector(3 downto 0); dp : std_logic) return t_hex is
        variable segs : std_logic_vector(6 downto 0);
    begin
        case bcd is
            when "0000" => segs := "1000000"; -- 0 (activos en bajo)
            when "0001" => segs := "1111001"; -- 1
            when "0010" => segs := "0100100"; -- 2
            when "0011" => segs := "0110000"; -- 3
            when "0100" => segs := "0011001"; -- 4
            when "0101" => segs := "0010010"; -- 5
            when "0110" => segs := "0000010"; -- 6
            when "0111" => segs := "1111000"; -- 7
            when "1000" => segs := "0000000"; -- 8
            when "1001" => segs := "0010000"; -- 9
            when "1010" => segs := "0001000"; -- A
            when "1011" => segs := "0000011"; -- b
            when "1100" => segs := "1000110"; -- C
            when "1101" => segs := "0100001"; -- d
            when "1110" => segs := "0000110"; -- E
            when "1111" => segs := "0001110"; -- F
            when others => segs := "1111111"; -- Apagado
        end case;
        -- Concatena el punto decimal con los 7 segmentos
        return dp & segs; 
    end function;

begin

    -- ==========================================
    -- 1. Prueba de Reloj (Divisor)
    -- ==========================================
    process(MAX10_CLK1_50)
    begin
        if rising_edge(MAX10_CLK1_50) then
            clk_counter <= clk_counter + 1;
        end if;
    end process;
    
    -- LED 9 muestra el reloj parpadeando
    LEDR(9) <= clk_counter(24);

    -- ==========================================
    -- 2. Prueba de Switches
    -- ==========================================
    -- Mapeo directo: Switches 0 a 8 encienden LEDs 0 a 8
    LEDR(8 downto 0) <= SW(8 downto 0);

    -- ==========================================
    -- 3. Prueba de Displays y Botones
    -- ==========================================
    -- Los botones KEY0 y KEY1 controlan el punto decimal de HEX0 y HEX1
    HEX0 <= decode_7seg(SW(3 downto 0), KEY(0));
    HEX1 <= decode_7seg(SW(7 downto 4), KEY(1));

    -- HEX2 a HEX5 muestran un guión medio (segmento 'g')
    HEX2 <= "10111111"; 
    HEX3 <= "10111111";
    HEX4 <= "10111111";
    HEX5 <= "10111111";

end rtl;