----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2025 14:15:55
-- Design Name: 
-- Module Name: Dec8to1B - Behavioral
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

entity Dec8to1B is
    PORT(i: IN std_logic_vector (2 DOWNTO 0);
    enable: IN std_logic;
    d: OUT std_logic_vector (7 DOWNTO 0));
end Dec8to1B;

architecture Behavioral of Dec8to1B is

begin
    PROCESS (enable)
    begin
        IF(i = "000") THEN
            d <= "00000001";
        ELSIF (i = "001") THEN
            d <= "00000010";
        ELSIF (i = "010") THEN
            d <= "00000100";
        ELSIF (i = "011") THEN
            d <= "00001000";
        ELSIF (i = "100") THEN
            d <= "00010000";
        ELSIF (i = "101") THEN
            d <= "00100000";
        ELSIF (i = "110") THEN
            d <= "01000000";
        ELSIF (i = "111") THEN
            d <= "10000000";
        ELSE
            d <= "00000000";
        END IF;
    END PROCESS;

end Behavioral;
