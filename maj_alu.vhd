----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2025 13:24:56
-- Design Name: 
-- Module Name: maj_alu - Behavioral
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

entity maj_alu is
Port ( A,B,C,D,E,F : IN std_logic_vector(7 DOWNTO 0);
        ctrl : IN std_logic_vector(2 DOWNTO 0);
        output : OUT std_logic_vector(7 DOWNTO 0);
        data_valid : OUT std_logic
);
end maj_alu;

architecture struct of maj_alu is
    component alu IS
    GENERIC(N: integer := 8);
        Port (src0, src1: IN std_logic_vector(N-1 DOWNTO 0);
        ctrl: IN std_logic_vector(2 DOWNTO 0);
        result: OUT std_logic_vector(N-1 DOWNTO 0)
    );
    END COMPONENT;
    component comb_log is 
    PORT( input1, input2, input3: IN std_logic_vector(7 DOWNTO 0);
        output : OUT std_logic_vector(7 DOWNTO 0);
        data_valid : OUT std_logic
    );
    END COMPONENT;
    
    SIGNAL O1, O2, O3: std_logic_vector(7 DOWNTO 0);
begin
    alu_1 : alu GENERIC MAP(N=>8) PORT MAP(src0 => A, src1 => B, ctrl => ctrl, result => O1);
    alu_2 : alu GENERIC MAP(N=>8) PORT MAP(src0 => C, src1 => D, ctrl => ctrl, result => O2);
    alu_3 : alu GENERIC MAP(N=>8) PORT MAP(src0 => E, src1 => F, ctrl => ctrl, result => O3);
    comp_log_1 : comb_log PORT MAP(input1 => O1, input2 => O2, input3 => O3, output => output, data_valid => data_valid);
end struct;
