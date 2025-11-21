
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2025 05:06:01 PM
-- Design Name: 
-- Module Name: Tst_RingC - Behavioral
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
    generic(N: integer := 4);
    port(
        clk, enable_r, rst_r : IN std_logic;
        num : OUT std_logic_vector(N-1 downto 0)
    );
end RingC;

architecture Structural of RingC is 
    
    component Scl is
        generic (N : integer := 4);
        port(
            es : IN std_logic ;
            s  : IN std_logic_vector(N-1 downto 0);
            o  : OUT std_logic
        );
    end component;
    
    component Reg is
        port(
            d, clk, er, rst : IN std_logic;
            q               : OUT std_logic
        );
    end component;

    signal chain : std_logic_vector(N-1 downto 0);
    signal scl_out : std_logic;

begin

    -- LOGICA DI CALCOLO DEL BIT IN USCITA
    scl_inst : Scl
        port map(
            s  => chain,
            es => enable_r,
            o  => scl_out
        );

    -- GENERAZIONE REGISTRI: SHIFT A DESTRA
    gen_regs : for i in 0 to N-2 generate
        stage : Reg 
            port map(
                clk => clk,
                rst => rst_r,
                er  => enable_r,
                d   => chain(i+1),   -- prende da destra
                q   => chain(i)
            );
    end generate;

    -- ULTIMO REGISTRO: RICEVE LO SCL
    last_reg : Reg
        port map(
            clk => clk,
            rst => rst_r,
            er  => enable_r,
            d   => scl_out,
            q   => chain(N-1)
        );

    -- USCITA
    num <= chain;

end Structural;
