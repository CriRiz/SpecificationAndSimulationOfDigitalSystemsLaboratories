----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2025 20:31:45
-- Design Name: 
-- Module Name: Encoder4to2 - Behavioral
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

entity Encoder4to2 is
    PORT(d: IN std_logic_vector(3 downto 0);
        q: OUT std_logic_vector(1 downto 0));
end Encoder4to2;

architecture Behavioral_if of Encoder4to2 is

begin
    PROCESS(d)
    begin
        IF d = "0001" then q <= "00";
        ELSIF d = "0010" then q <= "01";
        ELSIF d = "0100" then q <= "10";
        ELSIF d = "1000" then q <= "11";
        ELSE q <= "XX";
        END IF;
    END PROCESS;
end Behavioral_if;

architecture Behavioral_case of Encoder4to2 is
begin
    PROCESS(d)
    begin
        case d is
        when "0001" => q <= "00";
        when "0010" => q <= "01";
        when "0100" => q <= "10";
        when "1000" => q <= "11";
        when others => q <= "XX";
        END case;
        
    END PROCESS;

end Behavioral_case;

architecture Dataflow_select of Encoder4to2 is

begin
    with d select
        q <= "00" when "0001",
        "01" when "0010",
        "10" when "0100",
        "11" when "1000",
        "XX" when others;
end Dataflow_select;

architecture Dataflow_when of Encoder4to2 is

begin
    q <= "00" when d = "0001" else
    "01" when d = "0010" else
    "10" when d = "0100" else
    "11" when d = "1000" else
    "XX";

end Dataflow_when;