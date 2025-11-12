----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2025 21:47:20
-- Design Name: 
-- Module Name: Count4to2DS - Dataflow
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

entity Count4to2DS is
    PORT(d: IN std_logic_vector(3 downto 0);
        q: OUT std_logic_vector(1 downto 0));
end Count4to2DS;

architecture Dataflow of Count4to2DS is

begin
    with d select
        q <= "00" when "0001",
        "01" when "0010",
        "10" when "0100",
        "11" when "1000",
        "XX" when others;



end Dataflow;
