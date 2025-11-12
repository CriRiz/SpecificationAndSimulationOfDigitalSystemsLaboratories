----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 02:50:51 PM
-- Design Name: 
-- Module Name: Mux8to1BC - Behavioral
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

entity Mux8to1BC is
    PORT (i7, i6, i5, i4, i3, i2, i1, i0 : IN std_logic;
    sel: IN std_logic_vector(2 downto 0);
    d: OUT std_logic);
end Mux8to1BC;

architecture Behavioral of Mux8to1BC is
begin
    process(sel, i0, i1, i2, i3, i4, i5, i6, i7)
    -- Con logica case
    begin
        case sel is
            when "000" => d <= i0;
            when "001" => d <= i1;
            when "010" => d <= i2;
            when "011" => d <= i3;
            when "100" => d <= i4;
            when "101" => d <= i5;
            when "110" => d <= i6;
            when "111" => d <= i7;
            when others => d <= '0';
         end case;        
    end process;
end Behavioral;

