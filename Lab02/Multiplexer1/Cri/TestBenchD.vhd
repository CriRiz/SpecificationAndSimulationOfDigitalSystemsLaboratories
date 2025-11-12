----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2025 06:29:50 PM
-- Design Name: 
-- Module Name: TestBenchD - Behavioral
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

entity TestBenchD is
--  Port ( );
end TestBenchD;

architecture Behavioral of TestBenchD is

COMPONENT Mux8to1B 
    PORT (i7, i6, i5, i4, i3, i2, i1, i0 : IN std_logic;
    s2, s1, s0: IN std_logic;
    d: OUT std_logic);
END component;

signal i7_s, i6_s, i5_s, i4_s, i3_s, i2_s, i1_s, i0_s: std_logic;
signal s2_s, s1_s, s0_s, d_s: std_logic;

begin
    COMPTOTEST: Mux8to1B PORT MAP (i7_s, i6_s, i5_s, i4_s, i3_s, i2_s, i1_s, i0_s, s2_s, s1_s, s0_s, d_s);
    process
    begin
    
        i0_s <= '0';
        i1_s <= '1';
        i2_s <= '0';
        i3_s <= '1';
        i4_s <= '0';
        i5_s <= '1';
        i6_s <= '0';
        i7_s <= '1';
        
        s2_s <= '0'; s1_s <= '0'; s0_s <= '0'; wait for 10 ns; -- seleziona i0
        s2_s <= '0'; s1_s <= '0'; s0_s <= '1'; wait for 10 ns; -- seleziona i1
        s2_s <= '0'; s1_s <= '1'; s0_s <= '0'; wait for 10 ns; -- seleziona i2
        s2_s <= '0'; s1_s <= '1'; s0_s <= '1'; wait for 10 ns; -- seleziona i3
        s2_s <= '1'; s1_s <= '0'; s0_s <= '0'; wait for 10 ns; -- seleziona i4
        s2_s <= '1'; s1_s <= '0'; s0_s <= '1'; wait for 10 ns; -- seleziona i5
        s2_s <= '1'; s1_s <= '1'; s0_s <= '0'; wait for 10 ns; -- seleziona i6
        s2_s <= '1'; s1_s <= '1'; s0_s <= '1'; wait for 10 ns; -- seleziona i7
        wait;
        
    end process;


end Behavioral;
