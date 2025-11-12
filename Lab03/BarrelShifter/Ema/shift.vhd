library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift is
generic (N : integer := 8);
Port ( i: IN std_logic_vector(N-1 DOWNTO 0);
        asm, lar: IN std_logic_vector(1 DOWNTO 0);
        output: OUT std_logic_vector(N-1 DOWNTO 0) 
  );
end shift;

architecture Behavioral of shift is
begin
Process(i, asm, lar)
    variable my_integer : integer range 0 to N-1;
    variable aus_1: unsigned(N-1 DOWNTO 0) := (others => '0');
    variable bit_sign: unsigned(N-1 DOWNTO 0) := (others => '0');
 begin
 my_integer := to_integer(unsigned(asm));
     if(asm = "00") then 
        output <= i;
    else
 
    case lar is
        WHEN "00" =>
           output <= i((my_integer-1) DOWNTO 0) & i(N-1 DOWNTO my_integer);
        WHEN "01" =>
            output <= std_logic_vector(aus_1(my_integer-1 DOWNTO 0)) & i(N-1 DOWNTO my_integer);
        WHEN "10" =>
             bit_sign := (others => i(N-1));
             output <= std_logic_vector(bit_sign(my_integer-1 DOWNTO 0)) & i(N-1 DOWNTO my_integer);
        WHEN OTHERS =>
            output <= i;
    END CASE;
    
    end if;
    
end Process;


end Behavioral;
