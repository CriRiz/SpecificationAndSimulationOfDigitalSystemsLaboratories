----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2025 03:38:25 PM
-- Design Name: 
-- Module Name: Test_Ring - Behavioral
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

entity Test_Ring is
--  Port ( );
end Test_Ring;

architecture Behavioral of Test_Ring is
    signal clk_s, rst, e: std_logic;
    signal q_s : std_logic_vector (3 downto 0);
    constant clockP : TIME := 20 ns;

begin
    CompToTest: entity work.RingC(Behavioral)
        generic map(N => 4)
        port map(clk => clk_s, reset_sinc => rst, enable => e, q => q_s);
    
    CLK: process
        begin
            clk_s <= '0';
            wait for (clockP/2);
            clk_s <= '1';
            wait for (clockP/2);
    end process;
    
    Tst: process 
        begin
            rst <= '1';
            wait for (2*clockP);
            rst <= '0';
            e <= '1';
            wait for (5*clockP);
            e <= '0';
            wait;
    end process;


end Behavioral;
