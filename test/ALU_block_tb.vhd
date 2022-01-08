----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2022 17:12:33
-- Design Name: 
-- Module Name: ALU_block_tb - Behavioral
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
use WORK.z80_inst.ALL;

entity ALU_block_tb is
--  Port ( );
end ALU_block_tb;

architecture Behavioral of ALU_block_tb is
    
    component ALU_block port(
        clk : in STD_LOGIC;
        control : in alublock_ctrl;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
        );
    end component;
    
    -- input signals
    signal data_in_s : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal control_s : alublock_ctrl := (rst=>'0', reg_enable=>'0', alu_enable=>'0', inst=>NONE, din_alu=>NONE, dout_alu=>NONE);
    -- clock signal
    signal clk_s : std_logic := '0';
    constant clk_period : time :=  0.1 ns;
    
begin
    
    UUT: ALU_block port map (
             clk => clk_s,
             control => control_s,
             data_in => data_in_s
             );
        
   -- Clock process definitions( clock with 50% duty cycle)
    clk_process :process
    begin
        clk_s <= '0';
    wait for clk_period/2;
        clk_s <= '1';
    wait for clk_period/2;
    end process;
    
    stim_proc: process
    begin
        
        --control_s <= (rst=>'0', reg_enable=>'0', alu_enable=>'0', inst=>NONE, din_alu=>NONE, dout_alu=>NONE);
        control_s.rst <= '1';
        data_in_s <= "00000011";
        wait for 100ns;
        control_s.rst <= '0';
        control_s.din_alu <= TEMP;
        wait for 100ns;
        control_s.reg_enable <= '1';
        wait for 100 ns;
        control_s.din_alu <= A;
        control_s.dout_alu <= TEMP;
        data_in_s <= "00001100";
        wait for 100 ns;
        control_s.reg_enable <= '0';
        control_s.alu_enable <= '1';
        control_s.inst <= ADD;
        control_s.dout_alu <= ALU_OUT;
        wait for 100 ns;

        wait for 100 ns;

    end process;
    
end Behavioral;
