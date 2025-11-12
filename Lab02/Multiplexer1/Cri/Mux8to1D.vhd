----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 02:35:52 PM
-- Design Name: 
-- Module Name: Mux8to1D - Dataflow
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

entity Mux8to1D is
    PORT (i7, i6, i5, i4, i3, i2, i1, i0 : IN std_logic;
    sel: IN std_logic_vector(2 downto 0);
    d: OUT std_logic);
end Mux8to1D;

architecture Dataflow of Mux8to1D is
begin
    d <= i0 when sel = "000" else
    i1 when sel = "001" else
    i2 when sel = "010" else
    i3 when sel = "011" else
    i4 when sel = "100" else
    i5 when sel = "101" else
    i6 when sel = "110" else
    i7 when sel = "111" else
    '0';

end Dataflow;
