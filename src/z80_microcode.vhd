----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2022 11:09:35
-- Design Name: 
-- Module Name: z80_microcode - Behavioral
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

package z80_microcode is

    type state_t is (m1t1, m1t2, m1t3, m1t4, m1t5, m1t6,
                     m2t1, m2t2, m2t3,
                     m3t1, m3t2, m3t3);
                     
--    type control_signals_t is record
        
--    end record;
    
    type sequence_t is array (state_t) of state_t; 
    type microcode_state_t is array (inst_type_t) of sequence_t; 
    type microcode_dir_t is array (dir_t) of microcode_state_t;
    constant microcode_state_lut_none: microcode_state_t :=(
        ADD => (m1t1=>m1t2, m1t2=>m1t3)
    );
    constant microcode_dir_lut: microcode_dir_t :=(
        NONE => microcode_state_lut_none
    );

    
    
    function control_nsl (state : state_t; inst: inst_t) return state_t;
    function control_reg_ol (state: state_t; inst: inst_t) return reg_ctrl_t;
    function control_alu_ol (state: state_t; inst: inst_t) return alublock_ctrl_t;
    function control_mem_ol (state: state_t; inst: inst_t) return mem_ctrl_t;
    
end package;

package body z80_microcode is
    
    function control_nsl (state : state_t; inst: inst_t) return state_t is
        variable ns : state_t := m1t1;
    begin
        case state is
            when m1t1 =>
                ns := m1t2;
            when m1t2 =>
                ns := m1t3;
            when m1t3 =>
                ns := m1t4;
            when m1t4 =>
                ns := m2t1;
            when others =>
                case inst.inst_type is
                    when ADD => 
                        if inst.dir
                            case state is 
                                m2
                                    
                        ns :=
                end case;
        end case;
        
        
        
    end function;
    
    function control_reg_ol (state : state_t; inst: inst_t) return reg_ctrl_t is
        variable reg_ctrl : reg_ctrl_t;
    begin
    end function;
    
    function control_alu_ol (state : state_t; inst: inst_t) return alublock_ctrl_t is
        variable alu_ctrl : alublock_ctrl_t;
    begin
    end function;
    
    function control_mem_ol (state : state_t; inst: inst_t) return mem_ctrl_t is
        variable mem_ctrl : mem_ctrl_t;
    begin
    end function;
end package body;
