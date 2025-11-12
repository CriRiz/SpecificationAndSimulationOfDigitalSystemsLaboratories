----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2025 01:24:14 PM
-- Design Name: 
-- Module Name: TestBench - Behavioral
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

entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is
    SIGNAL i_s : std_logic_vector (2 downto 0) := (others => '0');
    SIGNAL enable_s: std_logic := '0';
    SIGNAL d_s : std_logic_vector (7 downto 0);

begin
    CompToTest: entity work.Dec3to8(Dataflow_with)
        port map(i => i_s, enable => enable_s, d => d_s);
    
    PROCESS
        begin
        
            enable_s <= '0';
        
            for i in 0 to 7 loop
                i_s <= std_logic_vector(TO_UNSIGNED(i, 3));
                wait for 10 ns;
            end loop;
            
            enable_s <= '1';
        
            for i in 0 to 7 loop
                i_s <= std_logic_vector(TO_UNSIGNED(i, 3));
                wait for 10 ns;
            end loop;
            
            wait;
    END PROCESS;


end Behavioral;
