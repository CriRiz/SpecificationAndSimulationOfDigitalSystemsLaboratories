----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 05:01:27 PM
-- Design Name: 
-- Module Name: Or8to1 - Behavioral
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

entity Or8to1 is
    PORT(i7, i6, i5, i4, i3, i2, i1, i0: IN std_logic;
    f: OUT std_logic);
end Or8to1;

architecture Behavioral of Or8to1 is

begin
    PROCESS(i7, i6, i5, i4, i3, i2, i1, i0)
    begin
        f <= i7 or i6 or i5 or i4 or i3 or i2 or i1 or i0;
    end process;


end Behavioral;
