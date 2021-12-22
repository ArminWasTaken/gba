----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 13:38:56
-- Design Name: 
-- Module Name: cpu - Behavioral
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

entity cpu is
    Port( clk : in std_logic;
          n_reset : in std_logic;
          addr : out std_logic_vector(15 downto 0);
          data : inout std_logic_vector(7 downto 0);
          sys_ctrl : out sys_ctrl;
          cpu_ctrl : in cpu_ctrl;
          n_halt : out std_logic;
          n_busrq : in std_logic;
          n_busack : out std_logic);
end cpu;

architecture Behavioral of cpu is

begin


end Behavioral;
