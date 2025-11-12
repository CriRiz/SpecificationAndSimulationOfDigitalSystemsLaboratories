----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2025 16:00:05
-- Design Name: 
-- Module Name: multiplier - Behavioral
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

entity multiplier is
Port ( a,b : IN std_logic_vector(7 DOWNTO 0);
       output : OUT std_logic_vector(15 DOWNTO 0)
 );
end multiplier;

architecture Behavioral of multiplier is
BEGIN 
    PROCESS(a,b)
    variable and1, and2, and3, and4, and5, and6, and7, and8: std_logic_vector (15 DOWNTO 0) := (OTHERS => '0');
    variable b0,b1,b2,b3, b4, b5, b6, b7 : std_logic_vector(7 DOWNTO 0);
    begin
     b0 := (OTHERS => b(0));
     b1 := (OTHERS => b(1));
     b2 := (OTHERS => b(2));
     b3 := (OTHERS => b(3));
     b4 := (OTHERS => b(4));
     b5 := (OTHERS => b(5));
     b6 := (OTHERS => b(6));
     b7 := (OTHERS => b(7));

     and1(7 DOWNTO 0):= a and b0;
     and2(8 DOWNTO 1):= a and b1;
     and3(9 DOWNTO 2):= a and b2;
     and4(10 DOWNTO 3):= a and b3;
     and5(11 DOWNTO 4):= a and b4;
     and6(12 DOWNTO 5):= a and b5;
     and7(13 DOWNTO 6):= a and b6;
     and8(14 DOWNTO 7):= a and b7;
     output <= std_logic_vector(UNSIGNED(and1) + UNSIGNED(and2) + UNSIGNED(and3) + UNSIGNED(and4) + UNSIGNED(and5) + UNSIGNED(and6) + UNSIGNED(and7) + UNSIGNED(and8));   
    END PROCESS;
end Behavioral;
