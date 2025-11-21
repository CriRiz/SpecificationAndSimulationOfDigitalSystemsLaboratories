
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2025 04:16:10 PM
-- Design Name: 
-- Module Name: Scl - Behavioral
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

entity Scl is
    generic (N : integer := 4);
    port(es: IN std_logic ;
    s: IN std_logic_vector(N-1 downto 0);
    o: OUT std_logic);
end Scl;

architecture Behavioral of Scl is

begin

    process(es,s)
    variable cmp : std_logic;
        begin
        if(es = '1') then
        cmp := '1';
            for i in 0 to N-1 loop
                cmp:= cmp and not s(i);
            end loop;
            o <= cmp;
        else
            o <= '0';
        end if;
            
    end process;

end Behavioral;
