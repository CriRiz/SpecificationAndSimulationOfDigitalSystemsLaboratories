----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2025 20:40:10
-- Design Name: 
-- Module Name: Testbench - Behavioral
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

entity Testbench is
end Testbench;

architecture Behavioral of Testbench is
    SIGNAL d_s : std_logic_vector (3 downto 0) := (others => '0');
    SIGNAL q_s : std_logic_vector (1 downto 0);
begin
    CompToTest: entity work.Encoder4to2(Behavioral_case)
        port map( d => d_s, q => q_s);
    
    PROCESS
        begin
            wait for 10 ns;
            for i in 0 to 3 loop
                d_s <= std_logic_vector(to_unsigned(i,4));
                wait for 10 ns;
            end loop;
    END PROCESS;

end Behavioral;
