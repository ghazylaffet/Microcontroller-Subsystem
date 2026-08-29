library ieee;
use ieee.std_logic_1164.all;

entity RI is
    port (clk, ERI : in std_logic; Din : in std_logic_vector(11 downto 0); codeOp, op1, op2 : out std_logic_vector(3 downto 0));
end RI;
architecture arch of RI is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if ERI='1' then
                codeOp <= Din(11 downto 8);
                op1 <= Din(7 downto 4);
                op2 <= Din(3 downto 0);
            end if;
        end if;
    end process;
end arch;
