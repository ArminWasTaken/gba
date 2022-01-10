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
                     
    -- State sequence
    type state_sequence_t is array (state_t) of state_t; 
    type microcode_state_t is array (dir_t, dir_t, inst_type_t) of state_sequence_t;
    constant microcode_state_lut: microcode_state_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t3 => m2t1, others => m1t1)
            )
        )
    );
    
    -- Regfile sequence
    type mux_seq_t is (none, dest8, dest16low, dest16high, orig8, orig16low, orig16high);
    type reg_mux_t is record
        en: std_logic;
        din: mux_seq_t;
        dout: mux_seq_t;
        addr: mux_seq_t;
    end record;
    type reg_ctrl_sequence_t is array (state_t) of reg_mux_t; 
    type microcode_reg_t is array (dir_t, dir_t, inst_type_t) of reg_ctrl_sequence_t;
    constant microcode_reg_lut: microcode_reg_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t3   => (en => '0', din => NONE, dout => NONE, addr => NONE),  
                        m2t1   => (en => '0', din => NONE, dout => NONE, addr => NONE), 
                        others => (en => '0', din => NONE, dout => NONE, addr => NONE))
            )
        )
    );
    
    -- ALU sequence
    type alu_ctrl_sequence_t is array (state_t) of alublock_ctrl_t; 
    type microcode_alu_t is array (dir_t, dir_t, inst_type_t) of alu_ctrl_sequence_t;
    constant microcode_alu_lut: microcode_alu_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t1 =>   (reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE), 
                        m1t2 =>   (reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE), 
                        m1t3 =>   (reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE),  
                        m2t1 =>   (reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE), 
                        others => (reg_enable => '0', alu_enable => '0', inst => NONE, din_alu => NONE, dout_alu => NONE))
            )
        )
    );
    
    -- Memory sequence
    type mem_ctrl_sequence_t is array (state_t) of mem_ctrl_t; 
    type microcode_mem_t is array (dir_t, dir_t, inst_type_t) of mem_ctrl_sequence_t;
    constant microcode_mem_lut: microcode_mem_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t1 => (ena => '1', wea => "0"), 
                        m1t2 => (ena => '1', wea => "0"), 
                        m1t3 => (ena => '0', wea => "0"),  
                        m2t1 => (ena => '0', wea => "0"), 
                        others => (ena => '0', wea => "0"))
            )
        )
    );
    
    -- Databus mux sequence
    type mux_ctrl_sequence_t is array (state_t) of mux_ctrl_t; 
    type microcode_mux_t is array (dir_t, dir_t, inst_type_t) of mux_ctrl_sequence_t;
    constant microcode_mux_lut: microcode_mux_t :=(
        REG => (
            IMPLIED => (
                ADD => (m1t1 => MEM, m1t2 => MEM, m1t3 => MEM, m2t1 => MEM, others => MEM)
            )
        )
    );

    function control_nsl    (state: state_t; inst: inst_t) return state_t;
    function control_reg_ol (state: state_t; inst: inst_t) return reg_ctrl_t;
    function control_alu_ol (state: state_t; inst: inst_t) return alublock_ctrl_t;
    function control_mem_ol (state: state_t; inst: inst_t) return mem_ctrl_t;
    function control_mux_ol (state: state_t; inst: inst_t) return mux_ctrl_t;
    
end package;

package body z80_microcode is
    
    function control_nsl (state : state_t; inst: inst_t) return state_t is
        variable ns : state_t;
        variable sequence : state_sequence_t;
    begin
        
        case state is
            when m1t1 =>
                ns := m1t2;
            when m1t2 =>
                ns := m1t3;
            when others=>
                sequence := microcode_state_lut(inst.orig_dir, inst.dest_dir, inst.inst_type);
                ns := sequence(state);
        end case; 
        
        return ns;
        
    end function;
    
    function control_reg_ol (state : state_t; inst: inst_t) return reg_ctrl_t is
        variable reg_ctrl : reg_ctrl_t;
        variable reg_mux : reg_mux_t;
        variable sequence : reg_ctrl_sequence_t;
    begin
        
        sequence := microcode_reg_lut(inst.orig_dir, inst.dest_dir, inst.inst_type);
        reg_mux := sequence(state);
        
        -- Databus -> reg
        case reg_mux.din is
            when dest8 =>
                reg_ctrl.din_reg := inst.dest_8b;
            when dest16low =>
                reg_ctrl.din_reg := get_reg_low(inst.dest_16b);          
        end case;
                
                
                
                
--        -- 8 bits o 16 -> secuenciar
--        reg_ctrl.dout_reg := inst.orig_8b;
--        -- Origen o destino a addr limitado a 16 bits
--        reg_ctrl.addr_reg := inst.orig_16b;

    end function;
    
    function control_alu_ol (state : state_t; inst: inst_t) return alublock_ctrl_t is
        variable alu_ctrl : alublock_ctrl_t;
        variable sequence : alu_ctrl_sequence_t;
    begin
        
        sequence := microcode_alu_lut(inst.orig_dir, inst.dest_dir, inst.inst_type);
        
    end function;
    
    function control_mem_ol (state : state_t; inst: inst_t) return mem_ctrl_t is
        variable mem_ctrl : mem_ctrl_t;
        variable sequence : mem_ctrl_sequence_t;
    begin
        
        sequence := microcode_mem_lut(inst.orig_dir, inst.dest_dir, inst.inst_type);
        
    end function;
    
    function control_mux_ol (state : state_t; inst: inst_t) return mux_ctrl_t is
        variable mux_ctrl : mux_ctrl_t;
        variable sequence : mux_ctrl_sequence_t;
    begin
        
        sequence := microcode_mux_lut(inst.orig_dir, inst.dest_dir, inst.inst_type);
        
    end function;
    
end package body;
