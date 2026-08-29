library ieee;
use ieee.std_logic_1164.all;

entity structurelle is
    port (H, UALDone, MemDone : in std_logic; DataMem : in std_logic_vector(11 downto 0); Operande1, Operande2, CodeOperation : out std_logic_vector(3 downto 0); exeUAL : out std_logic);
end structurelle;
architecture Astructurelle of structurelle is
    signal Sint : std_logic;
    component RI is
        port (clk, ERI : in std_logic; Din : in std_logic_vector(11 downto 0); codeOp, op1, op2 : out std_logic_vector(3 downto 0));
    end component;
    component sequenceur is
        port (clk, OpDone, MemR : in std_logic; CRI, CUAL : out std_logic);
    end component;
begin
    SS1 : RI port map (Din=>DataMem, clk=>H, Op1=>Operande1, Op2=>Operande2, codeOp=>CodeOperation, ERI=>Sint);
    SS2 : sequenceur port map (clk=>H, CRI=>Sint, OpDone=>UALDone, MemR=>MemDone, CUAL=>exeUAL);
end Astructurelle;
