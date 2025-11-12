----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 02:35:52 PM
-- Design Name: 
-- Module Name: Mux8to1S - Structural
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

entity Mux8to1S is
    PORT(i7, i6, i5, i4, i3, i2, i1, i0: IN std_logic;
    sel: IN std_logic_vector (2 downto 0);
    d: OUT std_logic);
end Mux8to1S;

architecture Structural of Mux8to1S is

COMPONENT Mux4to1S
    PORT(i3, i2, i1, i0: IN std_logic;
            sel: IN std_logic_vector (1 downto 0);
            d: OUT std_logic);
end component;

COMPONENT Mux2to1S
    PORT(i1, i0: IN std_logic;
                s0: IN std_logic;
                d: OUT std_logic);
end component;

signal u0, u1, o: std_logic;

begin
Mux1: Mux4to1S PORT MAP (i3, i2, i1, i0, sel(1 downto 0), u0);
Mux2: Mux4to1S PORT MAP (i7, i6, i5, i4, sel(1 downto 0), u1);
Mux3: Mux2to1S PORT MAP (u1, u0, sel(2), o);
    
end Structural;
