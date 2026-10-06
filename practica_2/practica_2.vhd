library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity practica_2 is
    port (
        clock : in  std_logic;
        reset : in  std_logic;
        SW    : in  std_logic_vector(1 downto 0);
        LEDR  : out std_logic_vector(1 downto 0)
    );
end entity practica_2;

architecture rtl of practica_2 is
    signal Q0       : std_logic_vector(1 downto 0) := "00";
    signal Q1       : std_logic_vector(1 downto 0);
    signal x        : std_logic;
    signal y        : std_logic;
    signal clk_slow : std_logic := '0';
    signal rebote   : std_logic := '1';
    signal pulso    : std_logic;
begin
    x <= SW(0);
    y <= SW(1);

    -- Divisor de frecuencia
    process (clock)
        variable delay : integer range 0 to 50000000 := 0;
        constant MAX_DELAY : integer := 2500000;
    begin
        if rising_edge(clock) then
            if (delay < MAX_DELAY) then
                delay := delay + 1;
            else
                clk_slow <= not clk_slow;
                delay := 0;
            end if;
        end if;
    end process;

    -- Entradas D de los flip-flops de Q0 (Estado Siguiente)
    Q1(1) <= (Q0(1) and not Q0(0)) or
             ((not Q0(1)) and Q0(0) and not x) or
             ((not Q0(1)) and Q0(0) and not y) or
             ((not Q0(0)) and x and y);

    Q1(0) <= (Q0(1) and not Q0(0)) or
             ((not Q0(1)) and Q0(0) and x and y);

    -- Lógica anti-rebote (Detector de flanco de bajada)
    -- Genera un '1' de duración de un solo ciclo de clk_slow 
    -- cuando el botón reset es presionado ('0').
    pulso <= '1' when (reset = '0' and rebote = '1') else '0';

    -- Memoria de la máquina de estados

    process(clk_slow)
    begin
        if rising_edge(clk_slow) then
            rebote <= reset;
            if pulso = '1' then
                Q0 <= "00";
            else
                Q0 <= Q1;
            end if;
        end if;
    end process;

    -- Salidas
    LEDR(1 downto 0) <= Q0;

end architecture rtl;