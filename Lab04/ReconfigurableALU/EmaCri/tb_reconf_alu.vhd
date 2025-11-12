----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2025 15:40:26
-- Design Name: 
-- Module Name: tb_reconf_alu - Behavioral
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

entity tb_reconf_alu is
end tb_reconf_alu;

architecture Behavioral of tb_reconf_alu is
    signal a_s, b_s:  std_logic_vector(15 DOWNTO 0);
    signal ctrl_s:  std_logic_vector(2 DOWNTO 0);
    signal nibble_s:  std_logic_vector(3 DOWNTO 0);
    signal output_s:  std_logic_vector(15 DOWNTO 0);
    

begin
    ComptoTest: entity work.reconf_alu(Behavioral)
        port map( a => a_s , b=> b_s , ctrl => ctrl_s , nibble => nibble_s , output => output_s );
    PROCESS
    BEGIN
        nibble_s <= "0001";
        ctrl_S <= "110";
        a_s <= "1111111111111111";
        b_s <= "1111111111110101";
        wait for 10 ns;
        nibble_s <= "0011";
        ctrl_S <= "110";
        a_s <= "1111111110000111";
        b_s <= "1111111111110101";
        wait for 10 ns;
        nibble_s <= "1111";
        ctrl_S <= "110";
        a_s <= "1010101010101010";
        b_s <= "1111111111110101";
        wait for 10 ns;
        nibble_s <= "1000";
        ctrl_S <= "110";
        a_s <= "0000111111111111";
        b_s <= "1111111111111111";
        wait for 10 ns;
        wait;
    END PROCESS;
end Behavioral;
