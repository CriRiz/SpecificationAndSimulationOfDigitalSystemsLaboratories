----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2025 21:15:45
-- Design Name: 
-- Module Name: Dec8to3B2 - Behavioral
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

entity Dec8to3B2 is
    PORT(i: IN std_logic_vector (2 DOWNTO 0);
    enable: IN std_logic;
    d: OUT std_logic_vector (7 DOWNTO 0));
end Dec8to3B2;

architecture Behavioral of Dec8to3B2 is

begin
    PROCESS (enable)
        BEGIN
        CASE i is
            when "000" => d <= "00000001";
            when "001" => d <= "00000010";
            when "010" => d <= "00000100";
            when "011" => d <= "00001000";
            when "100" => d <= "00010000";
            when "101" => d <= "00100000";
            when "110" => d <= "01000000";
            when "111" => d <= "10000000";
            when others => d <= "00000000";
        END CASE;
    END PROCESS;

end Behavioral;
