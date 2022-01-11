----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2022 00:08:20
-- Design Name: 
-- Module Name: cpu_tb - Behavioral
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
--use WORK.z80.ALL;
use WORK.z80_inst.ALL;

entity cpu_tb is
--  Port ( );
end cpu_tb;

architecture Behavioral of cpu_tb is
    
    component cpu port(
        clk : in std_logic;
        rst : in std_logic;
        addr : out std_logic_vector(15 downto 0);
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0);
        sys_ctrl : out sys_ctrl_t;
        cpu_ctrl : in cpu_ctrl_t;
        n_halt : out std_logic;
        n_busrq : in std_logic;
        n_busack : out std_logic
        );
    end component;
    
    -- input signals
    signal data_in_s : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal rst_s, busrq_s : std_logic;
    signal cpu_ctrl_s : cpu_ctrl_t;
    -- clock signal
    signal clk_s : std_logic := '0';
    constant clk_period : time :=  125 ns;
    
begin
    
    UUT: cpu port map (
             clk => clk_s,
             rst => rst_s,
             data_in => data_in_s,
             cpu_ctrl => cpu_ctrl_s,
             n_busrq => busrq_s
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

        rst_s <= '1';
        wait for 2*clk_period + clk_period/4;
        rst_s <= '0';
        wait;
--        wait for 100 ns;


--        wait for 100 ns;

--        wait for 100 ns;

--        wait for 100 ns;

    end process;
    
end Behavioral;

