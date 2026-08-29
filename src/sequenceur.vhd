library ieee;
use ieee.std_logic_1164.all;

entity sequenceur is
    port (clk, OpDone, MemR : in std_logic; CRI, CUAL : out std_logic);
end sequenceur;
architecture arch of sequenceur is
    type etat is (init, fetch, execute);
    signal E_present, E_futur : etat;
begin
    process(E_present, MemR, OpDone)
    begin
        case E_present is
            when init =>
                if MemR='1' then
                    E_futur <= fetch; CRI <= '1'; CUAL <= '0';
                end if;
            when fetch =>
                E_futur <= execute; CRI <= '0'; CUAL <= '1';
            when execute =>
                if OpDone='0' then
                    CRI <= '0'; CUAL <= '1'; E_futur <= execute;
                else
                    CRI <= '1'; CUAL <= '0'; E_futur <= fetch;
                end if;
        end case;
    end process;
    process(clk)
    begin
        if rising_edge(clk) then E_present <= E_futur; end if;
    end process;
end arch;
