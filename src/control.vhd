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
--use WORK.z80.ALL;
use WORK.z80_inst.ALL;
use WORK.z80_microcode.ALL;

entity control is
    Port( clk : in std_logic;
          rst : in std_logic;
          data : in std_logic_vector(7 downto 0);
          regfile_ctrl : out reg_ctrl_t;
          alu_ctrl : out alublock_ctrl_t;
          mem_ctrl : out mem_ctrl_t;
          mux_ctrl : out mux_ctrl_t;
          sys_ctrl : out sys_ctrl_t;
          cpu_ctrl : in cpu_ctrl_t;
          n_halt : out std_logic;
          n_busrq : in std_logic;
          n_busack : out std_logic);
end control;

architecture Behavioral of control is
    
    signal state_next, state_reg : state_t;
    signal inst_next, inst_reg : inst_t; 
    
begin

    ---
    -- State register
    sr: process (clk, rst)
    begin
        if rst = '0' then
            state_reg <= m1t1;
        elsif rising_edge(clk) then
            state_reg <= state_next;
        end if;
    end process;
    
    -- Datapath register
    dpr: process (clk, rst)
    begin
        if rst = '0' then
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
    nsl: process (state_reg, inst_reg)
    begin
        state_next <= control_nsl(state_reg, inst_reg);
    end process;
    
    -- Datapath logic
    dpl: process (data, state_reg, inst_reg)
    begin
        if state_reg = m1t2 then
            inst_next <= slv_to_inst(data);
        else
            inst_next <= inst_reg;
        end if;
    end process;

    -- Output logic
    ol: process (state_reg, inst_reg)
    begin 
        regfile_ctrl <= control_reg_ol(state_reg, inst_reg);
        alu_ctrl <= control_alu_ol(state_reg, inst_reg);
        mem_ctrl <= control_mem_ol(state_reg, inst_reg);
        mux_ctrl <= control_mux_ol(state_reg, inst_reg);
    end process;
    
end Behavioral;
