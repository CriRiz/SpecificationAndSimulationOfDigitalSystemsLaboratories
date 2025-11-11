----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2025 16:00:05
-- Design Name: 
-- Module Name: multiplier - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_mult is
end tb_mult;


architecture behav of tb_mult is
    signal a_s ,b_s : std_logic_vector(7 DOWNTO 0);
    signal output_s : std_logic_vector(15 DOWNTO 0);
BEGIN
    CompToTest: entity work.multiplier(Behavioral)
        port map(a => a_s, b => b_s, output => output_s);
    PROCESS BEGIN
        a_s <= "11111111";
        b_s <= "11111111";
        ASSERT output_s = "1111111000000001" report "error" severity error;
        wait for 10 ns;
        
        a_s <= "00110010";
        b_s <= "11000011";
        ASSERT output_s = "0010011000010110" report "error" severity error;
        
    WAIT;
    END PROCESS;
END behav;

