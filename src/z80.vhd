----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Enrique Robles Sanz
-- 
-- Create Date: 28.09.2021 13:03:23
-- Design Name: 
-- Module Name: z80 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 2
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library WORK;
use WORK.z80_inst.ALL;

package z80 is

    type alu_inst_t is (
        NONE, EX_AF, -- Idle mode and AF <-> A'F' content swap instruction
        ADD, ADC, SUB, SBC, LOGIC_AND, LOGIC_OR, LOGIC_XOR, CP, INC, DEC, --8 bit arithmetic instructions
        ADD_16b, INC_16b, DEC_16b, --16 bit arithmetic instructions
        RLCA, RLC, RLA, RL, RRCA, RRC, RRA, RR, --Rotate instructions
        SLA_INST, SRA_INST, SRL_INST, --Shift instructions
        BIT_INST, SET, RES --Bit manipulation instructions
        ); 
    
    type alu_dest_t is (
        NONE, A, TEMP, F, ALU_OUT
        );
    
    type mux_ctrl_t is (
        REG, ALU, MEM, EXT
        );
                  
    type sys_ctrl_t is record
        n_m1: std_logic;
        n_mreq: std_logic;
        n_iorq: std_logic;
        n_rd: std_logic;
        n_wr: std_logic;
        n_rfsh: std_logic;
    end record;
    
    type cpu_ctrl_t is record
        n_wait: std_logic;
        n_int: std_logic;
        n_nmi: std_logic;
    end record;
    
    type reg_ctrl_t is record
        reg_enable: std_logic;
        din_reg: reg8_t;
        dout_reg: reg8_t;
        addr_reg: reg16_t;
    end record;
    
    type alublock_ctrl_t is record
        reg_enable: std_logic;
        alu_enable: std_logic;
        inst: alu_inst_t;
        din_alu: alu_dest_t;
        dout_alu: alu_dest_t;
    end record;
    
    type mem_ctrl_t is record
        ena: std_logic;
        wea: std_logic_vector(0 downto 0);
    end record;
  
end package;
