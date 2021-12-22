----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2021 11:24:38
-- Design Name: 
-- Module Name: reg_tb - Behavioral
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

entity reg_tb is
--  Port ( );
end reg_tb;

architecture Behavioral of reg_tb is
    
    component reg port(
        clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        reset : in STD_LOGIC;
        data_in : in signed(sample_size - 1 downto 0);
        data_out : out signed(sample_size - 1 downto 0));
    end component;
    
    -- input signals
    signal data_in_s : signed(7 downto 0) := (others => '0');
    signal clk, enable_s, reset_s : STD_LOGIC;
    -- output signals
    signal data_out_s : signed(7 downto 0) := (others => '0');
    
    constant clk_period : time :=  0.1 ns;
    
begin
    
    UUT: reg port map (
             clk => clk,
             enable => enable_s,
             reset => reset_s,
             data_in => data_in_s,
             data_out => data_out_s
             );
        
   -- Clock process definitions( clock with 50% duty cycle)
    clk_process :process
    begin
        clk <= '0';
    wait for clk_period/2;
        clk <= '1'; 
    wait for clk_period/2;
    end process;
    
    stim_proc: process
    begin
        
        data_in_s <= "00001111";
        enable_s <= '0';
        reset_s <= '1';
        
        wait for 100ns;
        
        reset_s <= '0';
        
        wait for 100ns;
        
        enable_s <= '1';
        
        wait for 100ns;
        
        data_in_s <= "11110000";
        
        wait for 100ns;
        
        enable_s <= '0';
        
        wait for 100ns;
        
        reset_s <= '1';
        
    end process;

end Behavioral;