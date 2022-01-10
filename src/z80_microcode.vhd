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
    
    type state_sequence_t is array (state_t) of state_t; 
    type microcode_state_t is array (dir_t, dir_t, inst_type_t) of state_sequence_t;
    constant microcode_state_lut: microcode_state_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t1 => m1t2, m1t2 => m1t3, m1t3 => m2t1, others => m1t1),
                others => (others => m1t1)
            ),
            others => (others => (others => m1t1))
        ),
        others => (others => (others => (others => m1t1)))
    );
    
    type reg_ctrl_sequence_t is array (state_t) of reg_ctrl_t; 
    type microcode_reg_t is array (dir_t, dir_t, inst_type_t) of reg_ctrl_sequence_t;
    constant microcode_reg_lut: microcode_reg_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t1 => (rst => '0', reg_enable => '0', din_reg => NONE, dout_reg => NONE, addr_reg => NONE), 
                        m1t2 => (rst => '0', reg_enable => '0', din_reg => NONE, dout_reg => NONE, addr_reg => NONE), 
                        m1t3 => (rst => '0', reg_enable => '0', din_reg => NONE, dout_reg => NONE, addr_reg => NONE),  
                        m2t1 => (rst => '0', reg_enable => '0', din_reg => NONE, dout_reg => NONE, addr_reg => NONE), 
                        others => (rst => '0', reg_enable => '0', din_reg => NONE, dout_reg => NONE, addr_reg => NONE)),
                others => (others => (rst => '0', reg_enable => '0', din_reg => NONE, dout_reg => NONE, addr_reg => NONE))
            ),
            others => (others => (others => (rst => '0', reg_enable => '0', din_reg => NONE, dout_reg => NONE, addr_reg => NONE)))
        ),
        others => (others => (others => (others => (rst => '0', reg_enable => '0', din_reg => NONE, dout_reg => NONE, addr_reg => NONE))))
    );
    
    type alu_ctrl_sequence_t is array (state_t) of alublock_ctrl_t; 
    type microcode_alu_t is array (dir_t, dir_t, inst_type_t) of alu_ctrl_sequence_t;
    constant microcode_alu_lut: microcode_alu_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t1 => (rst => '0', reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE), 
                        m1t2 => (rst => '0', reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE), 
                        m1t3 => (rst => '0', reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE),  
                        m2t1 => (rst => '0', reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE), 
                        others => (rst => '0', reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE)),
                others => (others => (rst => '0', reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE))
            ),
            others => (others => (others => (rst => '0', reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE)))
        ),
        others => (others => (others => (others => (rst => '0', reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE))))
    );

    type mem_ctrl_sequence_t is array (state_t) of mem_ctrl_t; 
    type microcode_mem_t is array (dir_t, dir_t, inst_type_t) of mem_ctrl_sequence_t;
    constant microcode_mem_lut: microcode_mem_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t1 => (rsta => '0', ena => '1', wea => "0"), 
                        m1t2 => (rsta => '0', ena => '1', wea => "0"), 
                        m1t3 => (rsta => '0', ena => '0', wea => "0"),  
                        m2t1 => (rsta => '0', ena => '0', wea => "0"), 
                        others => (rsta => '0', ena => '0', wea => "0")),
                others => (others => (rsta => '0', ena => '1', wea => "0"))
            ),
            others => (others => (others => (rsta => '0', ena => '0', wea => "0")))
        ),
        others => (others => (others => (others => (rsta => '0', ena => '0', wea => "0"))))
    );

    function control_nsl (state : state_t; inst: inst_t) return state_t;
    function control_reg_ol (state: state_t; inst: inst_t) return reg_ctrl_t;
    function control_alu_ol (state: state_t; inst: inst_t) return alublock_ctrl_t;
    function control_mem_ol (state: state_t; inst: inst_t) return mem_ctrl_t;
    
end package;

package body z80_microcode is
    
    function control_nsl (state : state_t; inst: inst_t) return state_t is
        variable ns : state_t;
        variable sequence : state_sequence_t;
    begin
    
        sequence := microcode_state_lut(inst.orig_dir, inst.dest_dir, inst.inst_type);
        ns := sequence(state);
        
        return ns;
        
    end function;
    
    function control_reg_ol (state : state_t; inst: inst_t) return reg_ctrl_t is
        variable reg_ctrl : reg_ctrl_t;
        variable sequence : reg_ctrl_sequence_t;
    begin
        
        sequence := microcode_reg_lut(inst.orig_dir, inst.dest_dir, inst.inst_type);
        
        
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
