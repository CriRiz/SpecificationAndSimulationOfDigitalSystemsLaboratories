----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.10.2025 13:29:44
-- Design Name: 
-- Module Name: fullAdder - Behavioural
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

entity fullAdder is
    generic(
        N : integer := 1);
    PORT(a,b: IN std_logic_vector(N-1 downto 0);
    cin: IN std_logic := '0';
    s: OUT std_logic_vector(N-1 downto 0);
    cout: OUT std_logic);
end fullAdder;

architecture Behavioral of fullAdder is
begin
    process(a,b,cin)
        variable sum: unsigned (N downto 0);
    begin
        sum := unsigned('0' & a) + unsigned('0' & b) + ('0' & cin);
        
        s <= std_logic_vector(sum(N-1 downto 0));
        cout <= sum(N);
    end process;
end Behavioral;
