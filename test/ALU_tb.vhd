----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.11.2021 16:09:53
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

library WORK;
use WORK.z80.ALL;

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
    
    component ALU port(
        a : in signed (7 downto 0);
        b : in signed (7 downto 0);
        a_16b : in signed (15 downto 0);
        b_16b : in signed (15 downto 0);
        control : in inst;
        flags_in : in STD_LOGIC_VECTOR (7 downto 0);
        flags_out : out STD_LOGIC_VECTOR (7 downto 0);
        output : out STD_LOGIC_VECTOR (7 downto 0);
        output_16b : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    -- input signals
    signal a_s, b_s : signed(7 downto 0) := (others => '0');
    signal a_16b_s, b_16b_s : signed(15 downto 0) := (others => '0');
    signal flags_in_s : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal control_s : inst := ADD;
    -- output signals
    signal flags_out_s, output_s : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal output_16b_s : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    
    --constant clk_period : time :=  0.1 ns;
begin
    
    UUT: ALU port map (
             a => a_s,
             b => b_s,
             a_16b => a_16b_s,
             b_16b => b_16b_s,
             control => control_s,
             flags_in => flags_in_s,
             flags_out => flags_out_s,
             output => output_s,
             output_16b => output_16b_s
             );
        
--   -- Clock process definitions( clock with 50% duty cycle)
--    clk_process :process
--    begin
--        clk <= '0';
--    wait for clk_period/2;
--        clk <= '1';
--    wait for clk_period/2;
--    end process;
    
    stim_proc: process
    begin
        
        control_s <= ADD_16b;
        a_16b_s <= "0011000110000000";
        b_16b_s <= "0111000100000000";
--        control_s <= SET;
--        a_s <= to_signed(4, a_s'length);
--        b_s <= (others => '0');

--        control_s <= BIT_inst;
--        a_s <= to_signed(2, a_s'length);
--        b_s <= "11111011";
        
        wait for 100ns;
        
--        control_s <= RES;
--        a_s <= to_signed(1, a_s'length);
--        b_s <= (others => '1');


--        a_s <= to_signed(1, a_s'length); -- 0000 0010
--        b_s <= to_signed(-2, a_s'length); -- 0000 0010
        
--        wait for 100ns;

--        a_s <= "10000000";
--        b_s <= "10000000";
        
--        wait for 100ns;
        
--        control_s <= SUB;

--       wait for 100ns;
        
    end process;
    
end Behavioral;
