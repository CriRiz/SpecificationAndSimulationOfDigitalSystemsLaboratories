----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2025 13:25:19
-- Design Name: 
-- Module Name: TestBench1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestBench1 is
--  Port ( );
end TestBench1;

architecture Behavioral of TestBench1 is
    signal i_s : std_logic_vector(3 downto 0) := (others => '0');
    signal lar_s : std_logic_vector(1 downto 0) := (others => '0');
    signal amt_s : std_logic_vector(1 downto 0) := (others => '0');
    signal o_s : std_logic_vector(3 downto 0) := (others  => '0');

begin
    CompToTest: entity work.BarrelShifter(Behavioral)
        port map(
            i => i_s, lar => lar_s, amt => amt_s, o => o_s
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
