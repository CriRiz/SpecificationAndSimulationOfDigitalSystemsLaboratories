----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2025 13:54:25
-- Design Name: 
-- Module Name: Dec3to8D2 - Dataflow
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

entity Dec3to8D2 is
    PORT(i: IN std_logic_vector (2 DOWNTO 0);
    enable: IN std_logic;
    d: OUT std_logic_vector (7 DOWNTO 0));
end Dec3to8D2;

architecture Dataflow of Dec3to8D2 is

begin
    with (i and enable) select 
    d <= "00000001" when ("000" and '1'),
    "00000010" when ("001" and '1'),
    "00000100" when ("010" and '1'),
    "00001000" when ("011" and '1'),
    "00010000" when ("100" and '1'),
    "00100000" when ("101" and '1'),
    "01000000" when ("110" and '1'),
    "10000000" when ("111" and '1'),
    "00000000" when default;


end Dataflow;
