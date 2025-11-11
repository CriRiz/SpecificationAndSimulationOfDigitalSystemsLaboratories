----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2025 16:05:24
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Testbench is
--  Port ( );
end Testbench;

architecture Behavioral of Testbench is
    signal g_ins : std_logic_vector (3 downto 0);
    signal g_outs : std_logic_vector (3 downto 0);

begin

    CompToTest: entity work.gray_code(Dataflow)
        generic map (N => 4)
        port map(
            g_in => g_ins, g_out => g_outs
        );

process
    begin
        g_ins <= "0111";
        
        --assert a = b report "Errore: a è diverso da b" severity error;

        assert g_outs = "1100" report "Errore" severity error;
        
        wait;
        
    end process;


end Behavioral;
