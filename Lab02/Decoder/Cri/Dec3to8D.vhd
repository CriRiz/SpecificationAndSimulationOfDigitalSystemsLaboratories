----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2025 13:54:25
-- Design Name: 
-- Module Name: Dec3to8D - Dataflow
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

entity Dec3to8D is
    PORT(i: IN std_logic_vector (2 DOWNTO 0);
    enable: IN std_logic;
    d: OUT std_logic_vector (7 DOWNTO 0));
end Dec3to8D;

architecture Dataflow of Dec3to8D is

begin
    d <= "00000001" when (i = "000" and enable = '1') else
    "00000010" when (i = "001" and enable = '1') else
    "00000100" when (i = "010" and enable = '1') else
    "00001000" when (i = "011" and enable = '1') else
    "00010000" when (i = "100" and enable = '1') else
    "00100000" when (i = "101" and enable = '1') else
    "01000000" when (i = "110" and enable = '1') else
    "10000000" when (i = "111" and enable = '1') else
    "00000000";
    
    


end Dataflow;
