----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 07:18:49 PM
-- Design Name: 
-- Module Name: Mux2to1S - Structural
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

entity Mux2to1S is
    PORT(i1, i0: IN std_logic;
            s0: IN std_logic;
            d: OUT std_logic);
end Mux2to1S;

architecture Structural of Mux2to1S is

COMPONENT Not1
    PORT(x:IN std_logic;
    f: OUT std_logic);
END component;

COMPONENT And2
    PORT(a, b: IN std_logic;
    f: OUT std_logic);
END component;

COMPONENT Or2
    PORT(a, b: IN std_logic;
    f: OUT std_logic);
END component;

SIGNAL n0, a0, a1: std_logic;

begin
    --Porte NOT
    NOT_0: Not1 PORT MAP (s0, n0);
    --Porte AND
    AND_0: And2 PORT MAP (i0, n0, a0);
    AND_1: And2 PORT MAP (i1, s0, a1);
    --Porta OR
    OR_0: Or2 PORT MAP (a0, a1, d);

end Structural;
