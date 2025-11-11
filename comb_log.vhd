----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2025 13:31:20
-- Design Name: 
-- Module Name: comb_log - Behavioral
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

entity comb_log is
    PORT( input1, input2, input3: IN std_logic_vector(7 DOWNTO 0);
        output : OUT std_logic_vector(7 DOWNTO 0);
        data_valid : OUT std_logic
    );
end comb_log;

architecture Behavioral of comb_log is
    
begin
    PROCESS(input1, input2, input3)
    BEGIN
        IF(input1 = input2 AND input2 = input3) then
            output <= input1;
            data_valid <= '1';
        ELSIF (input1 = input2 OR input1 = input3) then
            output <= input1;
            data_valid <= '1';
        ELSIF (input2 = input3) then
            output <= input2;
            data_valid <= '1';
        ELSE   
            output <= (OTHERS => 'Z');
            data_valid <= '0';
        END IF;
    END PROCESS;

end Behavioral;
