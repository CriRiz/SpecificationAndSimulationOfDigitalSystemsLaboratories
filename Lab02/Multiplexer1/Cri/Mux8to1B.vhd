----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 02:35:52 PM
-- Design Name: 
-- Module Name: Mux8to1B - Behavioral
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

entity Mux8to1B is
    PORT (i7, i6, i5, i4, i3, i2, i1, i0 : IN std_logic;
    s2, s1, s0: IN std_logic;
    d: OUT std_logic);
end Mux8to1B;

architecture Behavioral of Mux8to1B is
begin
    process(s2, s1, s0, i0, i1, i2, i3, i4, i5, i6, i7)
    -- Con logica if else
    begin
        if (s2 = '0' and s1 = '0'and s0 = '0') then --000
            d <= i0;
        elsif (s2 = '0'and s1 = '0'and s0 = '1') then --001
            d <= i1;
        elsif (s2 = '0'and s1 = '1'and s0 = '0') then --010
            d <= i2;
        elsif (s2 = '0'and s1 = '1'and s0 = '1') then --011
            d <= i3;
        elsif (s2 = '1'and s1 = '0'and s0 = '0') then --100
            d <= i4;
        elsif (s2 = '1'and s1 = '0'and s0 = '1') then --101
            d <= i5;
        elsif (s2 = '1'and s1 = '1'and s0 = '0') then --110
            d <= i6;
        else
            d <= i7; --111
        end if;
    end process;
end Behavioral;
