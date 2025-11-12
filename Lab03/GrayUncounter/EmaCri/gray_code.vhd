----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2025 15:38:03
-- Design Name: 
-- Module Name: gray_code - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gray_code is
    generic ( N : integer := 4);
    port(
        g_in : In std_logic_vector( N-1 downto 0);
        g_out : OUT std_logic_vector(N-1 downto 0)
    );

--  Port ( );
end gray_code;

architecture Dataflow of gray_code is
    signal bin : unsigned (N-1 downto 0);
    signal bin_inc : unsigned (N-1 downto 0);
begin
        
        -- grey code in binario
        bin(N-1) <= g_in(N-1);
        
        generate_bin: for i in N-2 downto 0 generate
            bin(i) <= bin(i+1) XOR g_in(i);
        end generate;
        
        -- incrementare binario
        bin_inc <= bin + 1;
        
        -- binario in grey code
        generate_grey: for j in 0 to N-2 generate 
            g_out(j) <= bin_inc(j) XOR bin_inc(j+1);
        end generate;
        
        g_out(N-1) <= bin_inc(N-1);
end Dataflow;
