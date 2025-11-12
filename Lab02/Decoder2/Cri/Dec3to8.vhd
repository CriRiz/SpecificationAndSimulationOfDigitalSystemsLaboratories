----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2025 01:09:25 PM
-- Design Name: 
-- Module Name: Dec3to8 - Behavioral
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

entity Dec3to8 is
    PORT(i: IN std_logic_vector (2 DOWNTO 0);
    enable: IN std_logic;
    d: OUT std_logic_vector (7 DOWNTO 0));
end Dec3to8;

architecture Behavioral_if of Dec3to8 is

begin
    PROCESS (i,enable)
    begin
        IF (enable = '1') THEN
            IF(i = "000") THEN
                d <= "00000001";
            ELSIF (i = "001") THEN
                d <= "00000010";
            ELSIF (i = "010") THEN
                d <= "00000100";
            ELSIF (i = "011") THEN
                d <= "00001000";
            ELSIF (i = "100") THEN
                d <= "00010000";
            ELSIF (i = "101") THEN
                d <= "00100000";
            ELSIF (i = "110") THEN
                d <= "01000000";
            ELSIF (i = "111") THEN
                d <= "10000000";
            ELSE
                d <= "00000000";
            END IF;
         END IF;
    END PROCESS;

end Behavioral_if;

architecture Behavioral_case of Dec3to8 is

begin
    PROCESS (i,enable)
        BEGIN
        IF (enable = '1') then
            CASE i is
                when "000" => d <= "00000001";
                when "001" => d <= "00000010";
                when "010" => d <= "00000100";
                when "011" => d <= "00001000";
                when "100" => d <= "00010000";
                when "101" => d <= "00100000";
                when "110" => d <= "01000000";
                when "111" => d <= "10000000";
                when others => d <= "00000000";
            END CASE;
        END IF;
    END PROCESS;

end Behavioral_case;

architecture Dataflow_else of Dec3to8 is

begin
    d <= "00000001" when (i = "000" and enable = '1') else
    "00000010" when (i = "001" and enable = '1') else
    "00000100" when (i = "010" and enable = '1') else
    "00001000" when (i = "011" and enable = '1') else
    "00010000" when (i = "100" and enable = '1') else
    "00100000" when (i = "101" and enable = '1') else
    "01000000" when (i = "110" and enable = '1') else
    "10000000" when (i = "111" and enable = '1') else
    "UUUUUUUU";

end Dataflow_else;

architecture Dataflow_with of Dec3to8 is
    SIGNAL tmp : std_logic_vector(7 downto 0);

begin

    with i select 
    tmp <= "00000001" when ("000"),
    "00000010" when ("001"),
    "00000100" when ("010"),
    "00001000" when ("011"),
    "00010000" when ("100"),
    "00100000" when ("101"),
    "01000000" when ("110"),
    "10000000" when ("111"),
    "00000000" when others;
    
    d <= tmp when enable = '1' else (others => 'U');


end Dataflow_with;