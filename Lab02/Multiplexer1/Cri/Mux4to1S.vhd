----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 07:18:49 PM
-- Design Name: 
-- Module Name: Mux4to1S - Structural
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

entity Mux4to1S is
    PORT(i3, i2, i1, i0: IN std_logic;
        sel: IN std_logic_vector (1 downto 0);
        d: OUT std_logic);
end Mux4to1S;

architecture Structural of Mux4to1S is
begin
    d <= i0 when sel = "00" else
    i1 when sel = "01" else
    i2 when sel = "10" else
    i3;
end Structural;
