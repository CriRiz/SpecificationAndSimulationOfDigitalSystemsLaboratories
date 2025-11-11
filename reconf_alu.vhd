----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2025 13:44:50
-- Design Name: 
-- Module Name: reconf_alu - Behavioral
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

entity reconf_alu is
Port ( a, b: IN std_logic_vector(15 DOWNTO 0);
    ctrl : IN std_logic_vector(2 DOWNTO 0);
    nibble: IN std_logic_vector(3 DOWNTO 0);
    output: OUT std_logic_vector(15 DOWNTO 0)    
     );
end reconf_alu;

architecture Behavioral of reconf_alu is
begin
    PROCESS(a,b,ctrl,nibble) 
       variable input1: std_logic_vector(15 DOWNTO 0);
       variable input2: std_logic_vector(15 DOWNTO 0);
       variable n: integer;
    BEGIN
    n:= 3;
    input1 := (OTHERS => '0');
    input2 := (OTHERS => '0');

    if(nibble(0) = '1') then
        input1(n DOWNTO 0) := a(3 DOWNTO 0); 
        input2(n DOWNTO 0) := b(3 DOWNTO 0);
        n := n+4;
    end if;
    if(nibble(1) = '1') then
        input1(n DOWNTO n-3) := a(7 DOWNTO 4);
        input2(n DOWNTO n-3) := b(7 DOWNTO 4);
        n := n+4;
    end if;
    
    if(nibble(2) = '1') then 
        input1(n DOWNTO n-3) := a(11 DOWNTO 8);
        input2(n DOWNTO n-3) := b(11 DOWNTO 8);
        n := n+4;
    end if;
    
    if(nibble(3) ='1') then
        input1(n DOWNTO n-3) := a(15 DOWNTO 12);
        input2(n DOWNTO n-3) := b(15 DOWNTO 12);
    end if;
  
    case ctrl is
        WHEN "100" => output <= std_logic_vector(signed(input1) + signed(input2));
        WHEN "101" => output <= std_logic_vector(signed(input1) - signed(input2));
        WHEN "110" => output <=  input1 and input2;
        WHEN "111"=> output <= input1 or input2;
        WHEN OTHERS => output <= std_logic_vector(unsigned(input1) + 1);         
     end case;    
    END PROCESS;        

end Behavioral;
