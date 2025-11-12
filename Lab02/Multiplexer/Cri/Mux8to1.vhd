----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/11/2025 03:13:26 PM
-- Design Name: 
-- Module Name: Mux8to1 - Behavioral
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

entity Mux8to1 is
    PORT(i7, i6, i5, i4, i3, i2, i1, i0: IN std_logic;
    sel: IN std_logic_vector (2 downto 0);
    d: OUT std_logic);
end Mux8to1;

architecture Behavioral_if of Mux8to1 is
begin
    process(sel, i0, i1, i2, i3, i4, i5, i6, i7)
    -- Con logica if else
    begin
        if (sel = "000") then --000
            d <= i0;
        elsif (sel = "001") then --001
            d <= i1;
        elsif (sel = "010") then --010
            d <= i2;
        elsif (sel = "011") then --011
            d <= i3;
        elsif (sel = "100") then --100
            d <= i4;
        elsif (sel = "101") then --101
            d <= i5;
        elsif (sel = "110") then --110
            d <= i6;
        else
            d <= i7; --111
        end if;
    end process;
end Behavioral_if;

architecture Behavioral_case of Mux8to1 is
begin
    process(sel, i0, i1, i2, i3, i4, i5, i6, i7)
    -- Con logica case
    begin
        case sel is
            when "000" => d <= i0;
            when "001" => d <= i1;
            when "010" => d <= i2;
            when "011" => d <= i3;
            when "100" => d <= i4;
            when "101" => d <= i5;
            when "110" => d <= i6;
            when "111" => d <= i7;
            when others => d <= '0';
         end case;        
    end process;
end Behavioral_case;

architecture Dataflow of Mux8to1 is
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

architecture Dataflow_s of Mux8to1 is
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
end Dataflow_s;

architecture Structural of Mux8to1 is

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
Mux3: Mux2to1S PORT MAP (u1, u0, sel(2), d);
    
end Structural;