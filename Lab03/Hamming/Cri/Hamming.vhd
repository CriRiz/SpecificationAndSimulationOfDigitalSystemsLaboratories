----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.10.2025 13:18:58
-- Design Name: 
-- Module Name: Hamming - Behavioral
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
use IEEE.std_logic_unsigned.ALL;

entity Hamming is
    PORT(
    i1, i2 : IN std_logic_vector(7 downto 0);
    d      : OUT std_logic_vector(3 downto 0)
    );
end Hamming;

architecture Behavioral of Hamming is 
begin
    PROCESS(i1, i2)
        variable oxor   : unsigned(7 downto 0);
        variable sum0_0, sum0_1, sum0_2, sum0_3 : unsigned (1 downto 0);
        variable sum1_0, sum1_1 : unsigned(2 downto 0);
        variable sum2   : unsigned(3 downto 0);
    begin
        oxor := unsigned(i1) XOR unsigned(i2);
        
        sum0_0 := ('0' & oxor(0)) + ('0' & oxor(1));
        sum0_1 := ('0' & oxor(2)) + ('0' & oxor(3));
        sum0_2 := ('0' & oxor(4)) + ('0' & oxor(5));
        sum0_3 := ('0' & oxor(6)) + ('0' & oxor(7));
        
        sum1_0 := resize(sum0_0, 3) + resize(sum0_1, 3);
        sum1_1 := resize(sum0_2, 3) + resize(sum0_3, 3);
        
        sum2 := resize(sum1_0, 4) + resize(sum1_1, 4);
        
        d <= std_logic_vector(sum2);
        
    end process;

end Behavioral;


architecture Dataflow of Hamming is
    signal oxor   : unsigned(7 downto 0);
    signal sum0_0, sum0_1, sum0_2, sum0_3 : unsigned(1 downto 0);
    signal sum1_0, sum1_1 : unsigned(2 downto 0);
    signal sum2   : unsigned(3 downto 0);
begin
    -- XOR tra i due ingressi
    oxor <= unsigned(i1) XOR unsigned(i2);

    sum0_0 <= ('0' & oxor(0)) + ('0' & oxor(1));
    sum0_1 <= ('0' & oxor(2)) + ('0' & oxor(3));
    sum0_2 <= ('0' & oxor(4)) + ('0' & oxor(5));
    sum0_3 <= ('0' & oxor(6)) + ('0' & oxor(7));

    sum1_0 <= resize(sum0_0, 3) + resize(sum0_1, 3);
    sum1_1 <= resize(sum0_2, 3) + resize(sum0_3, 3);


    sum2 <= resize(sum1_0, 4) + resize(sum1_1, 4);

    d <= std_logic_vector(sum2);
end Dataflow;



architecture Structural of Hamming is
    
    component fullAdder
        generic(
        N : integer := 1);
        PORT(a,b: IN std_logic_vector(N-1 downto 0);
        cin: IN std_logic := '0';
        s: OUT std_logic_vector(N-1 downto 0);
        cout: OUT std_logic);
    end COMPONENT;
    
    component Xor2 is
        PORT(a, b: IN std_logic_vector(7 downto 0);
        o: OUT std_logic_vector(7 downto 0));
    end component ;
    signal oxor: std_logic_vector(7 downto 0);
    signal sum0: std_logic_vector(7 downto 0);
    signal sum1: std_logic_vector(5 downto 0);
    --signal sum2: std_logic_vector(3 downto 0);

begin
    X1: Xor2 port map (a => i1, b => i2, o => oxor);
    A0_0: fullAdder generic map(N => 1) port map(a => oxor(0 downto 0), b => oxor(1 downto 1), cin => '0', s => sum0(0 downto 0), cout => sum0(1));
    A0_1: fullAdder generic map(N => 1) port map(a => oxor(2 downto 2), b => oxor(3 downto 3), cin => '0', s => sum0(2 downto 2), cout => sum0(3));
    A0_2: fullAdder generic map(N => 1) port map(a => oxor(4 downto 4), b => oxor(5 downto 5), cin => '0', s => sum0(4 downto 4), cout => sum0(5));
    A0_3: fullAdder generic map(N => 1) port map(a => oxor(6 downto 6), b => oxor(7 downto 7), cin => '0', s => sum0(6 downto 6), cout => sum0(7));
    A1_1: fullAdder generic map(N => 2) port map(a => sum0(1 downto 0), b => sum0(3 downto 2), cin => '0', s => sum1(1 downto 0), cout => sum1(2));
    A1_2: fullAdder generic map(N => 2) port map(a => sum0(5 downto 4), b => sum0(7 downto 6), cin => '0', s => sum1(4 downto 3), cout => sum1(5));
    A3: fullAdder generic map(N => 3) port map(a => sum1(2 downto 0), b => sum1(5 downto 3), cin => '0', s => d(2 downto 0), cout => d(3));
    
end Structural; 
