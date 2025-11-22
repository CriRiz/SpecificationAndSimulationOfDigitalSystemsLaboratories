----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2025 11:38:47 AM
-- Design Name: 
-- Module Name: Ctrl - Behavioral
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

entity Ctrl is
    generic(N: integer := 8);
    port(b: IN std_logic_vector(1 downto 0);
    rst_c, e: IN std_logic; 
    s: OUT std_logic_vector(N-1 downto 0));
end Ctrl;

architecture Behavioral of Ctrl is

begin
    XorBits: process(b, rst_c)
        begin
        if(rst_c = '1') then
            s(N-1) <= '1';
            s(N-2 downto 0) <= (others => '0');
        elsif (e = '1') then
            s(N-1) <= b(0) xor b(1);
        end if;
    end process;


end Behavioral;
