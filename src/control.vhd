----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 14:01:48
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
    Port( clk : in std_logic;
          n_reset : in std_logic;
          data : in std_logic_vector(7 downto 0);
          sys_ctrl : out sys_ctrl;
          cpu_ctrl : in cpu_ctrl;
          n_halt : out std_logic;
          n_busrq : in std_logic;
          n_busack : out std_logic;
          regfile_ctrl : out internal_ctrl;
          alu_ctrl : out internal_ctrl);
end control;

architecture Behavioral of control is

    type state_t is (m1t1, m1t2, m1t3, m1t4, m1t5, m1t6,
                     m2t1, m2t2, m2t3,
                     m3t1, m3t2, m3t3);
    
    signal state_next, state_reg : state_t;
    signal inst_next, inst_reg : inst_t; 
    
begin

    ---
    -- State register
    sr: process (clk, n_reset)
    begin
        if n_reset = '0' then
            state_reg <= m1t1;
        elsif rising_edge(clk) then
            state_reg <= state_next;
        end if;
    end process;
    
    -- Datapath register
    dpr: process (clk, n_reset)
    begin
        if n_reset = '0' then
            inst_reg <= (inst_type => NOP, 
                         orig_8b => NONE, 
                         dest_8b => NONE, 
                         orig_16b => NONE, 
                         dest_16b => NONE,
                         orig_dir => NONE,
                         dest_dir => NONE,  
                         cond => NONE);
        elsif rising_edge(clk) then
            inst_reg <= inst_next;
        end if;
    end process;

    -- Next state logic
    nsl: process (state_reg)
    begin
        case state_reg is
            when m1t1 => 
                state_next <= m1t2;
            when m1t2 => 
                state_next <= m1t3;
            when m1t3 => 
                state_next <= m1t4;
            when m1t4 =>
            --depende de la instrucción
            when others =>
        end case;
    end process;
    
    -- Datapath logic
    dpl: process (inst_reg)
    begin
--        case inst_reg.inst_type is
--            when others =>
--        end case;
    end process;
    
    -- Output logic
    ol: process (state_reg, inst_reg)
    begin 
        case state_reg is 
            when m1t1 =>
                -- Addr_bus <= PC
                -- n_mreq <= '1';
                -- n_rd <= '1';
                -- n_m1 <= '0';
        end case;
    end process;
    
end Behavioral;
