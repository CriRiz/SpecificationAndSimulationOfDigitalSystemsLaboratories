----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2025 21:47:20
-- Design Name: 
-- Module Name: Count4to2BC - Behavioral
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

entity Count4to2BC is
    PORT(d: IN std_logic_vector(3 downto 0);
    q: OUT std_logic_vector(1 downto 0));
end Count4to2BC;

architecture Behavioral of Count4to2BC is
begin
    PROCESS(d)
    begin
        case d is
        when "0001" => q <= "00";
        when "0010" => q <= "01";
        when "0100" => q <= "10";
        when "1000" => q <= "11";
        when others => q <= "XX";
        END case;
        
    END PROCESS;

end Behavioral;
