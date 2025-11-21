----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2025 01:27:47 PM
-- Design Name: 
-- Module Name: RingC - Behavioral
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

entity RingC is
    generic(N : integer := 4);
    port(clk, reset_sinc, enable: IN std_logic;
    q: OUT std_logic_vector (N-1 downto 0));
end RingC;

architecture Behavioral of RingC is
    signal currentState, nextState: std_logic_vector (N-1 downto 0) := (others => '0');
begin
    StateReg: process(clk)
        variable init: std_logic_vector (N-2 downto 0) := (others => '0');
        begin
            if rising_edge(clk) then
                if(reset_sinc = '1') then
                    currentState <= '1' & init;
                else
                    currentState <= nextState;
                end if;
            end if;
        
    end process;
    Comb: process(clk,enable)
        begin
        if(enable='1') then
            nextState <= currentState(0) & currentState(N-1 downto 1);
        end if;
        q <= currentState;
    end process;



end Behavioral;
