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
use IEEE.NUMERIC_STD.ALL;

entity TestBenchD is
end TestBenchD;

architecture Behavioral of TestBenchD is
    signal i7_s, i6_s, i5_s, i4_s, i3_s, i2_s, i1_s, i0_s : std_logic := '0';
    signal sel : std_logic_vector(2 downto 0) := (others => '0');
    signal d_s : std_logic;
begin
    -- Istanza del componente Mux8to1 (senza architettura specificata)
    CompToTest: entity work.Mux8to1(Dataflow_s)
        port map(
            i7 => i7_s, i6 => i6_s, i5 => i5_s, i4 => i4_s,
            i3 => i3_s, i2 => i2_s, i1 => i1_s, i0 => i0_s,
            sel => sel, d => d_s
        );

    -- Processo di stimolo
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

        for i in 0 to 7 loop
            sel <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;

        wait;
    end process;
end Behavioral;

