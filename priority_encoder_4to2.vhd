----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2025 20:05:38
-- Design Name: 
-- Module Name: priority_encoder_4to2 - Behavioral
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

entity priority_encoder_4to2 is
    PORT(req_0, req_1, req_2, req_3: IN std_logic;
        active : OUT std_logic;
        code : OUT std_logic_vector(1 DOWNTO 0)
     );
end priority_encoder_4to2;

architecture dataflow_when_else of priority_encoder_4to2 is
begin
  active <= '1' when (req_3 or req_2 or req_1 or req_0) = '1' else '0';
  code <= "11" when req_3 = '1' else
          "10" when req_2 = '1' else
          "01" when req_1 = '1' else
          "00";
end dataflow_when_else;

architecture dataflow_with_select of priority_encoder_4to2 is
    SIGNAL input_sel : std_logic_vector(3 DOWNTO 0);

    BEGIN    
        input_sel <= (req_3 & req_2 & req_1 & req_0);
        WITH input_sel SELECT 
            active <= '0' WHEN "0000",
                      '1' WHEN OTHERS;
      with input_sel select
        code <= "00" when "0000",
            "00" when "0001",
            "01" when "0010",
            "01" when "0011",
            "10" when "0100",
            "10" when "0101",
            "10" when "0110",
            "10" when "0111",
            "11" when others;
                        
    END dataflow_with_select;
    
 architecture behav_if of priority_encoder_4to2 is
    begin 
        PROCESS(req_3, req_2, req_1, req_0) BEGIN
            IF(req_3 = '1') THEN
                code <= "11";
                active <= '1';
            ELSIF(req_2 = '1') THEN
                code <= "10";
                active <= '1';
            ELSIF(req_1 = '1') THEN
                code <= "01";
                active <= '1';
            ELSIF(req_0 = '1') THEN 
                code <= "00";
                active <= '1';
             ELSE 
                code <= "00";
                active <= '0';
         END IF; 
        END PROCESS;
    end behav_if;
    
    architecture behav_case of priority_encoder_4to2 is
    BEGIN
        PROCESS(req_3, req_2, req_1, req_0) 
          variable input_sel : std_logic_vector(3 DOWNTO 0);
        BEGIN
            input_sel := req_3 & req_2 & req_1 & req_0;
            CASE input_sel IS
                WHEN "0000" => active <= '0';
                WHEN OTHERS => active <= '1';
            END CASE;
            CASE input_sel IS
                WHEN "0000" => code <= "00";
                WHEN "0001" => code <= "00";
                WHEN "0010" => code <= "01";
                WHEN "0011" => code <= "01";
                WHEN "0100" => code <= "10";
                WHEN "0110" => code <= "10";
                WHEN "0111" => code <= "10";
                WHEN "0101" => code <= "10";
                WHEN OTHERS => code <= "11";
            END CASE;
        
        END PROCESS;
    
    END behav_case;