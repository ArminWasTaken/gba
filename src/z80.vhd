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
        NONE,
        ADD, ADC, SUB, SBC, LOGIC_AND, LOGIC_OR, LOGIC_XOR, CP, INC, DEC, --8 bit arithmetic instructions
        ADD_16b, INC_16b, DEC_16b, --16 bit arithmetic instructions
        RLCA, RLC, RLA, RL, RRCA, RRC, RRA, RR, --Rotate instructions
        SLA_INST, SRA_INST, SRL_INST, --Shift instructions
        BIT_INST, SET, RES --Bit manipulation instructions
        ); 
    
    type bus_t is (
        DATAB, ADDRB
        );
                  
    type sys_ctrl is record
        n_m1: std_logic;
        n_mreq: std_logic;
        n_iorq: std_logic;
        n_rd: std_logic;
        n_wr: std_logic;
        n_rfsh: std_logic;
    end record;
    
    type cpu_ctrl is record
        n_wait: std_logic;
        n_int: std_logic;
        n_nmi: std_logic;
    end record;
    
    type internal_ctrl is record
        enable: std_logic;
        --mux_ctrl: ;
        inst: inst_t;
    end record;
    
    type reg_ctrl is record
        rst: std_logic;
        reg_enable: std_logic;
        orig8b: reg8_t;
        dest8b: reg8_t;
        orig16b: reg16_t;
        dest16b: reg16_t;
--        orig_dirtype: dir_t;
--        dest_dirtype: dir_t;
        bustype: bus_t;
    end record;
    
    type alublock_ctrl is record
        reg_enable: std_logic;
        --mux_ctrl: ;
        inst: inst_t;
    end record;
  
end package;
