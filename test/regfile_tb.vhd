----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2022 14:56:24
-- Design Name: 
-- Module Name: regfile_tb - Behavioral
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

entity regfile_tb is
--  Port ( );
end regfile_tb;

architecture Behavioral of regfile_tb is
    
    component regfile port(
        clk : in STD_LOGIC;
        control : in reg_ctrl;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0);
        addr_out : out std_logic_vector(15 downto 0) 
        );
    end component;
    
    -- input signals
    signal data_in_s : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal control_s : reg_ctrl := (rst=>'0', reg_enable=>'0', din_reg=>NONE, dout_reg=>NONE, addr_reg=>NONE);
    -- clock signal
    signal clk_s : std_logic := '0';
    constant clk_period : time :=  0.1 ns;
    
begin
    
    UUT: regfile port map (
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
        
        --control_s <= (rst=>'0', reg_enable=>'0', din_reg=>NONE, dout_reg=>NONE, addr_reg=>NONE);
        control_s.rst <= '1';
        data_in_s <= "00001111";
        wait for 100ns;
        control_s.rst <= '0';
        wait for 100ns;
        control_s.din_reg <= B;
        wait for 100ns;
        control_s.reg_enable <= '1';
        wait for 100 ns;
        control_s.reg_enable <= '0';
        control_s.dout_reg <= B;
        data_in_s <= "11110000";
        wait for 100 ns;
        control_s.reg_enable <= '1';
        control_s.din_reg <= C;
        control_s.dout_reg <= NONE;
        wait for 100 ns;
        control_s.dout_reg <= H;
        control_s.addr_reg <= BC;
        wait for 100 ns;

    end process;
    
end Behavioral;

