library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Testbench is
--  Port ( );
end Testbench;

architecture Behavioral of Testbench is
    signal i_s : std_logic_vector(3 downto 0) := (others => '0');
    signal lar_s : std_logic_vector(1 downto 0) := (others => '0');
    signal amt_s : std_logic_vector(1 downto 0) := (others => '0');
    signal o_s : std_logic_vector(3 downto 0) := (others => '0');
begin
    CompToTest: entity work.BarrelShifter(Behavioral)
        port map(
            i => i_s, lar => lar_s, asm => amt_s, output => o_s
        );
    process
        begin
        
        i_s <= "1011";
        
        lar_s <= "00";
        amt_s <= "10";
        wait for 10 ns;
        
        lar_s <= "01";
        amt_s <= "11";
        wait for 10 ns;
        
        lar_s <= "10";
        amt_s <= "01";
        
        wait;
                
    end process;

end Behavioral;