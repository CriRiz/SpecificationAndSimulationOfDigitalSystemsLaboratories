library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_alu is
end tb_alu;


architecture testbench of tb_alu is


signal A_tb, B_tb, C_tb, D_tb, E_tb, F_tb, result_tb: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal control: STD_LOGIC_VECTOR(2 DOWNTO 0);
signal data_valid_tb : std_logic;


begin
    CompToTest: entity work.maj_alu(struct)
    PORT MAP(A =>  A_tb, B => B_tb, C =>  C_tb, D => D_tb, E =>  E_tb, F => F_tb, ctrl => control,
     output => result_tb, data_valid => data_valid_tb
    );
    
    PROCESS 
    BEGIN
        A_tb <= "10001000";
        B_tb <= "00011000";
        C_tb <= "10001000";
        D_tb <= "00011000";
        E_tb <= "10001000";
        F_tb <= "00011000";
        control <= "111";
        assert result_tb = "10011000" report "Errore or " severity error;
        assert data_valid_tb = '1' report "ERRORE DATA VALID" severity error;
        wait for 10 ns;
        A_tb <= "10001000";
        B_tb <= "00011000";
        C_tb <= "10001000";
        D_tb <= "00011000";
        E_tb <= "10001001";
        F_tb <= "00011000";
        control <= "111";
        assert result_tb = "10011000" report "Errore or " severity error;
        assert data_valid_tb = '1' report "ERRORE DATA VALID" severity error;
        wait for 10 ns;
        
        A_tb <= "10101000";
        B_tb <= "00011000";
        C_tb <= "10001000";
        D_tb <= "00011000";
        E_tb <= "10001000";
        F_tb <= "00011000";
        control <= "111";
        assert result_tb = "10011000" report "Errore or " severity error;
        assert data_valid_tb = '1' report "ERRORE DATA VALID" severity error;
        wait for 10 ns;
        A_tb <= "11001000";
        B_tb <= "01011000";
        C_tb <= "10001001";
        D_tb <= "00011000";
        E_tb <= "10001011";
        F_tb <= "00011100";
        control <= "111";
        assert (result_tb = "ZZZZZZZZ") report "Errore or " severity error;
        assert data_valid_tb = '0' report "ERRORE DATA VALID" severity error;
        wait for 10 ns;
    WAIT;
    END PROCESS;

end testbench;