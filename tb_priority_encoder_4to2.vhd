----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2025 20:52:35
-- Design Name: 
-- Module Name: tb_priority_encoder_4to2 - Behavioral
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

entity tb_priority_encoder_4to2 is
--  Port ( );
end tb_priority_encoder_4to2;

architecture Behavioral of tb_priority_encoder_4to2 is
    COMPONENT priority_encoder_4to2 IS
        PORT(req_0, req_1, req_2, req_3: IN std_logic;
            active: OUT std_logic;
            code : OUT std_logic_vector(1 DOWNTO 0)
        );
     END COMPONENT;
   FOR ALL:
       priority_encoder_4to2 USE ENTITY WORK.priority_encoder_4to2(behav_case);
       
   SIGNAL req0, req1, req2, req3, active_tb: std_logic;
   SIGNAL code_output_tb: std_logic_vector(1 DOWNTO 0);
begin
    CompToTest: priority_encoder_4to2 PORT MAP(req_0 => req0, req_1 => req1, req_2 => req2, req_3 => req3, active => active_tb, code => code_output_tb);
    PROCESS BEGIN
        req3 <= '1';
        req2 <= '1';
        req1 <= '1';
        req0 <= '1';
        wait for 5 ns;
        req3 <= '0';
        wait for 5 ns;
        req2 <= '0';
        wait for 5 ns;
        req1 <= '0';
        wait for 5 ns;
        req0 <= '0';
        wait for 5 ns;
        req0 <= '1';
        req2 <= '1';
        wait for 5 ns;
        req3 <= '1';
    WAIT;
    END PROCESS;

end Behavioral;
