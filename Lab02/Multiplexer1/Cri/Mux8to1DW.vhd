----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 08:21:17 PM
-- Design Name: 
-- Module Name: Mux8to1DW - Dataflow
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

entity Mux8to1DW is
    PORT (i7, i6, i5, i4, i3, i2, i1, i0 : IN std_logic;
    sel: IN std_logic_vector(2 downto 0);
    d: OUT std_logic);
end Mux8to1DW;

architecture Dataflow of Mux8to1DW is
begin
    with sel select
        d <= i0 when "000",
        i1 when "001",
        i2 when "010",
        i3 when "011",
        i4 when "100",
        i5 when "101",
        i6 when "110",
        i7 when "111",
        '0' when others;
end Dataflow;
