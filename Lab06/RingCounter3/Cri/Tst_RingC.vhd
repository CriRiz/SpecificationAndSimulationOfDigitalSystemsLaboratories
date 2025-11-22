----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2025 05:06:01 PM
-- Design Name: 
-- Module Name: Tst_RingC - Behavioral
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

entity Tst_RingC is
end Tst_RingC;

architecture Behavioral of Tst_RingC is

    signal clk_s, rst_s, e: std_logic;
    signal q_s : std_logic_vector (7 downto 0);
    constant clockP : TIME := 20 ns;

begin
    CompToTest: entity work.RingC(Structural)
        generic map(N => 8)
        port map(clk => clk_s, rst_r => rst_s, enable_r => e, num => q_s);
    
    CLK: process
        begin
            clk_s <= '0';
            wait for (clockP/2);
            clk_s <= '1';
            wait for (clockP/2);
    end process;
    
    Tst: process 
        begin
            rst_s <= '1';
            wait for (2*clockP);
            rst_s<= '0';
            e <= '1';
            wait for (15*clockP);
            e <= '0';
            wait for (2*clockP);
            rst_s <= '1';
            wait for (2*clockP);
            rst_s <= '0';
            e <= '1';
            wait;
    end process;
end Behavioral;
