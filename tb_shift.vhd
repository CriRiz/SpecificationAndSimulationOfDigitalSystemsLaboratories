----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2025 13:02:56
-- Design Name: 
-- Module Name: tb_shift - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_shift is
end tb_shift;

architecture Behav of tb_shift is

    signal input: std_logic_vector(7 downto 0) := (others => '0');
    signal lar: std_logic_vector(1 downto 0) := (others => '0');
    signal amt : std_logic_vector(1 downto 0) := (others => '0');
    signal output: std_logic_vector(7 DOWNTO 0) := (others => '0');
    
begin
    CompToTest: entity work.shift(Behavioral)
        generic map(N => 8)
        port map(
            i => input, lar => lar, asm => amt, output => output
        );
    process 
    begin 
        input <= "10110000";
        lar <= "00";
        amt <= "10";
        wait for 20 ns;
        lar <= "01";
        amt <=  "11";       
        wait for 20 ns;
        
        lar <= "10";
        amt <= "01";
        
        wait;
                
    end process;

end Behav;
