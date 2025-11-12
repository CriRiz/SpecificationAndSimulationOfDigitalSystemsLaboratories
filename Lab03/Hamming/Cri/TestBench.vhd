----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2025 11:49:55 AM
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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Testbench is
--  Port ( );
end Testbench;

architecture Behavioral of Testbench is
    signal i1_s, i2_s : std_logic_vector(7 downto 0) := (others => '0');
    signal d_s : std_logic_vector(3 downto 0) := (others => '0');
    
begin
    CompToTest: entity work.Hamming(Structural)
        port map(
            i1 => i1_s, i2 => i2_s, d => d_s
        );
    process 
        variable tmp_1, tmp_2 : unsigned (7 downto 0) := (others => '0'); 
        begin
        
        for j in 0 to 7 loop
                tmp_2 := tmp_2 + (to_unsigned(2**j, 8));
                i2_s <= std_logic_vector(tmp_2);
                wait for 10 ns;
        end loop;
        
        for i in 0 to 7 loop
            tmp_1 := tmp_1 + (to_unsigned(2**i, 8));
            i1_s <= std_logic_vector(tmp_1);
            
            tmp_2 := (others => '0');
            
            for j in 0 to 7 loop
                tmp_2 := tmp_2 + (to_unsigned(2**j, 8));
                i2_s <= std_logic_vector(tmp_2);
                wait for 10 ns;
            end loop;
        end loop;
        
        wait;
                
    end process;

end Behavioral;
