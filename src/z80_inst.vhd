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

package z80_inst is
    
    type inst_type_t is (
        -- 8 bit arithmetic instructions
        ADD, ADC, SUB, SBC, LOGIC_AND, LOGIC_OR, LOGIC_XOR, CP, INC, DEC, 
        -- 16 bit arithmetic instructions
        ADD_16b, INC_16b, DEC_16b, 
        -- Rotate instructions
        RLCA, RLC, RLA, RL, RRCA, RRC, RRA, RR, RLD, RRD, 
        -- Shift instructions
        SLA_INST, SRA_INST, SRL_INST, 
        -- Bit manipulation instructions
        BIT_INST, SET, RES, 
        -- CPU instructions
        LD, PUSH, POP, EX, EXX, LDI, LDIR, LDD, LDDR, CPI, CPIR, CPD, CPDR,
        DAA, CPL, NEG, CCF, SCF, NOP, HALT, DI, EI, IM_0, IM_1, IM_2,
        JP, JR, DJNZ, CALL, RET, RETI, RETN, RST, 
        IN_INST, INI, INIR, IND, INDR, OUT_INST, OUTI, OTIR, OUTD, OTDR
        ); 
    
    -- ALU instructions LUT
    type alu_inst_lut_t is array(0 to 7) of inst_type_t;
    constant alu_inst_lut: alu_inst_lut_t :=(
        0 => ADD, 1 => ADC, 2 => SUB, 3 => SBC, 4 => LOGIC_AND, 5 => LOGIC_XOR, 6 => LOGIC_OR, 7 => CP 
    );
                  
    type dir_t is (NONE, IMMEDIATE, IMMEDIATE_EXT, MOD_P0, RELATIVE, EXTENDED, INDEXED, REG, IMPLIED, INDIRECT, BIT_ADDRESSING);
    
    -- 8 bit Registers
    type reg8_t is (NONE, B, C, D, E, H, L, HL_CONTENT, A, F,
                    IX_L, IX_H, IY_L, IY_H, SP_L, SP_H, PC_L, PC_H);
    subtype regfile8_t is reg8_t range B to L;
    subtype alublock_t is reg8_t range A to F;
    type reg_lut_t is array(0 to 7) of reg8_t;
    constant reg_lut: reg_lut_t :=(
        0 => B, 1 => C, 2 => D, 3 => E, 4 => H, 5 => L, 6 => HL_CONTENT, 7 => A 
    );
    
    -- 16 bit Registers (8 bit Register pairs)
    type reg16_t is (NONE, BC, DE, HL, SP, PC, AF, IX, IY);
    subtype regfile16_t is reg16_t range BC to PC;
    type regp1_lut_t is array(0 to 3) of reg16_t;
    constant regp1_lut: regp1_lut_t :=(
        0 => BC, 1 => DE, 2 => HL, 3 => SP
    );
    type regp2_lut_t is array(0 to 3) of reg16_t;
    constant regp2_lut: regp2_lut_t :=(
        0 => BC, 1 => DE, 2 => HL, 3 => AF
    );
    
    ---
    -- Conditions
    type condition_t is (NONE, NZ, Z, NC, C, PO, PE, P, M);
    type condition_lut_t is array(0 to 7) of condition_t;
    constant condition_lut: condition_lut_t :=(
        0 => NZ, 1 => Z, 2 => NC, 3 => C, 4 => PO, 5 => PE, 6 => P, 7 => M 
    );
    
    type inst_t is record
        inst_type: inst_type_t;
        orig_dir: dir_t;
        dest_dir: dir_t;
        
        orig_8b: reg8_t;
        dest_8b: reg8_t;
        orig_16b: reg16_t;
        dest_16b: reg16_t;
        cond: condition_t;
    end record;
    
    function slv_to_inst (opcode: std_logic_vector) return inst_t;

end package;

package body z80_inst is

    function slv_to_inst (opcode: std_logic_vector) return inst_t is
        alias x : std_logic_vector(1 downto 0) is opcode(7 downto 6);
        alias y : std_logic_vector(2 downto 0) is opcode(5 downto 3);
        alias z : std_logic_vector(2 downto 0) is opcode(2 downto 0);
        alias p : std_logic_vector(1 downto 0) is opcode(5 downto 4);
        alias q : std_logic is opcode(3);
        variable inst : inst_t := (inst_type => NOP, orig_8b => NONE, dest_8b => NONE, orig_16b => NONE, dest_16b => NONE, cond => NONE, orig_dir => NONE, dest_dir => NONE);
    begin
        case x is 
            when "00" =>
                case z is 
                    when "000" =>
                        case y is 
                            when "000" =>
                                --NOP
                                inst := (inst_type => NOP, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => NONE, 
                                         dest_16b => NONE,
                                         orig_dir => NONE,
                                         dest_dir => NONE,  
                                         cond => NONE
                                         );           
                            when "001" =>
                                --EX AF, AF'
                                inst := (inst_type => EX, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => AF, 
                                         dest_16b => AF, -- A is A' and F is F'
                                         orig_dir => REG,
                                         dest_dir => REG,  
                                         cond => NONE);
                            when "010" =>
                                --DJNZ d
                                inst := (inst_type => DJNZ, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => NONE, 
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED,  
                                         cond => NONE);
                            when "011" =>
                                --JR d
                                inst := (inst_type => JR, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => NONE, 
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED,  
                                         cond => NONE);
                            when others =>
                                --JR condition[y-4], d
                                inst := (inst_type => JR, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => NONE, 
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED,   
                                         cond => condition_lut(to_integer(unsigned(y))-4));
                        end case;
                    when "001" =>
                        if (q = '0') then
                            --LD regp1[p], nn
                            inst := (inst_type => LD, 
                                     orig_8b => NONE, 
                                     dest_8b => NONE, 
                                     orig_16b => NONE, --nn
                                     dest_16b => regp1_lut(to_integer(unsigned(p))), 
                                     orig_dir => IMMEDIATE_EXT,
                                     dest_dir => REG,  
                                     cond => NONE);
                        else
                            --ADD HL, regp1[p]
                            inst := (inst_type => ADD, 
                                     orig_8b => NONE, 
                                     dest_8b => NONE, 
                                     orig_16b => regp1_lut(to_integer(unsigned(p))), 
                                     dest_16b => HL, 
                                     orig_dir => REG,
                                     dest_dir => REG, 
                                     cond => NONE);
                        end if;
                    when "010" =>
                        if (q = '0') then
                            case p is
                                when "00" =>
                                    --LD (BC), A
                                    inst := (inst_type => LD, 
                                             orig_8b => A, 
                                             dest_8b => NONE, 
                                             orig_16b => NONE, 
                                             dest_16b => BC, 
                                             orig_dir => REG,
                                             dest_dir => INDIRECT, 
                                             cond => NONE);
                                when "01" =>
                                    --LD (DE), A
                                    inst := (inst_type => LD, 
                                             orig_8b => A, 
                                             dest_8b => NONE, 
                                             orig_16b => NONE, 
                                             dest_16b => DE, 
                                             orig_dir => REG,
                                             dest_dir => INDIRECT,
                                             cond => NONE);
                                when "10" =>
                                    --LD (nn), HL
                                    inst := (inst_type => LD, 
                                             orig_8b => NONE, 
                                             dest_8b => NONE, 
                                             orig_16b => HL, 
                                             dest_16b => NONE,
                                             orig_dir => REG,
                                             dest_dir => EXTENDED,
                                             cond => NONE);
                                when "11" =>
                                    --LD (nn), A
                                    inst := (inst_type => LD, 
                                             orig_8b => A, 
                                             dest_8b => NONE, 
                                             orig_16b => NONE, 
                                             dest_16b => NONE,
                                             orig_dir => REG,
                                             dest_dir => EXTENDED,
                                             cond => NONE);
                            end case;
                        else
                            case p is
                                when "00" =>
                                    --LD A, (BC)
                                    inst := (inst_type => LD, 
                                             orig_8b => NONE, 
                                             dest_8b => A, 
                                             orig_16b => BC,
                                             dest_16b => NONE, 
                                             orig_dir => INDIRECT,
                                             dest_dir => REG, 
                                             cond => NONE);
                                when "01" =>
                                    --LD A, (DE)
                                    inst := (inst_type => LD, 
                                             orig_8b => NONE, 
                                             dest_8b => A, 
                                             orig_16b => DE,
                                             dest_16b => NONE, 
                                             orig_dir => INDIRECT,
                                             dest_dir => REG,
                                             cond => NONE);
                                when "10" =>
                                    --LD HL, (nn)
                                    inst := (inst_type => LD, 
                                             orig_8b => NONE, 
                                             dest_8b => NONE, 
                                             orig_16b => NONE,
                                             dest_16b => HL, 
                                             orig_dir => EXTENDED,
                                             dest_dir => REG, 
                                             cond => NONE);
                                when "11" =>
                                    --LD A, (nn)
                                    inst := (inst_type => LD, 
                                             orig_8b => NONE, 
                                             dest_8b => A, 
                                             orig_16b => NONE,
                                             dest_16b => NONE, 
                                             orig_dir => EXTENDED,
                                             dest_dir => REG,  
                                             cond => NONE);
                            end case;    
                        end if;
                    when "011" =>
                        if (q = '0') then
                            --INC regp1[p]
                            inst := (inst_type => INC, 
                                     orig_8b => NONE, 
                                     dest_8b => NONE, 
                                     orig_16b => NONE,
                                     dest_16b => regp1_lut(to_integer(unsigned(p))), 
                                     orig_dir => NONE,
                                     dest_dir => REG, 
                                     cond => NONE);
                        else
                            --DEC regp1[p]
                            inst := (inst_type => DEC, 
                                     orig_8b => NONE, 
                                     dest_8b => NONE, 
                                     orig_16b => NONE,
                                     dest_16b => regp1_lut(to_integer(unsigned(p))), 
                                     orig_dir => NONE,
                                     dest_dir => REG, 
                                     cond => NONE);
                        end if;
                    when "100" =>
                        --INC reg[y]
                        inst := (inst_type => INC, 
                                 orig_8b => NONE, 
                                 dest_8b => reg_lut(to_integer(unsigned(y))), 
                                 orig_16b => NONE,
                                 dest_16b => NONE, 
                                 orig_dir => NONE,
                                 dest_dir => REG,  
                                 cond => NONE);
                    when "101" =>
                        --DEC reg[y]
                        inst := (inst_type => DEC, 
                                 orig_8b => NONE, 
                                 dest_8b => reg_lut(to_integer(unsigned(y))), 
                                 orig_16b => NONE,
                                 dest_16b => NONE, 
                                 orig_dir => NONE,
                                 dest_dir => REG, 
                                 cond => NONE);
                    when "110" =>
                        --LD reg[y], n
                        inst := (inst_type => LD, 
                                 orig_8b => NONE,
                                 dest_8b => reg_lut(to_integer(unsigned(y))), 
                                 orig_16b => NONE,
                                 dest_16b => NONE, 
                                 orig_dir => IMMEDIATE,
                                 dest_dir => REG,
                                 cond => NONE);
                    when "111" =>
                        case y is 
                            when "000" =>
                                --RLCA
                                inst := (inst_type => RLCA, 
                                         orig_8b => A, 
                                         dest_8b => A, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);
                            when "001" =>
                                --RRCA
                                inst := (inst_type => RRCA, 
                                         orig_8b => A, 
                                         dest_8b => A, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED,  
                                         cond => NONE);
                            when "010" =>
                                --RLA
                                inst := (inst_type => RLA, 
                                         orig_8b => A, 
                                         dest_8b => A, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                        orig_dir => IMPLIED,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);
                            when "011" =>
                                --RRA
                                inst := (inst_type => RRA, 
                                         orig_8b => A, 
                                         dest_8b => A, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);
                            when "100" =>
                                --DAA
                                inst := (inst_type => DAA, 
                                         orig_8b => A, 
                                         dest_8b => A, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED,  
                                         cond => NONE);
                            when "101" =>
                                --CPL
                                inst := (inst_type => CPL, 
                                         orig_8b => A, 
                                         dest_8b => A, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);
                            when "110" =>
                                --SCF
                                inst := (inst_type => SCF, 
                                         orig_8b => NONE, 
                                         dest_8b => F, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);
                            when "111" =>
                                --CCF ???
                                inst := (inst_type => CCF, 
                                         orig_8b => NONE, 
                                         dest_8b => F, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => IMPLIED,  
                                         cond => NONE);
                        end case;
                end case;
            when "01" =>
                if (z = "110") then
                    if (y = "110") then
                        --HALT
                        inst := (inst_type => HALT, 
                                 orig_8b => NONE, 
                                 dest_8b => NONE, 
                                 orig_16b => NONE,
                                 dest_16b => NONE, 
                                 orig_dir => NONE,
                                 dest_dir => NONE, 
                                 cond => NONE);
                    else
                        --NOP
                        inst := (inst_type => NOP, 
                                 orig_8b => NONE, 
                                 dest_8b => NONE, 
                                 orig_16b => NONE,
                                 dest_16b => NONE, 
                                 orig_dir => NONE,
                                 dest_dir => NONE,  
                                 cond => NONE);
                    end if;
                else
                    --LD reg[y], reg[z]
                    inst := (inst_type => LD, 
                             orig_8b => reg_lut(to_integer(unsigned(z))), 
                             dest_8b => reg_lut(to_integer(unsigned(y))), 
                             orig_16b => NONE,
                             dest_16b => NONE, 
                             orig_dir => REG,
                             dest_dir => REG, 
                             cond => NONE);
                end if;
            when "10" =>
                --alu[y] reg[z]
                if(y = "111") then  -- CP instruction does not return the result back to reg A as the rest of alu instructions do
                    inst := (inst_type => alu_inst_lut(to_integer(unsigned(y))), 
                             orig_8b => reg_lut(to_integer(unsigned(z))), 
                             dest_8b => NONE, 
                             orig_16b => NONE,
                             dest_16b => NONE, 
                             orig_dir => REG,
                             dest_dir => IMPLIED,  
                             cond => NONE);
                else
                    inst := (inst_type => alu_inst_lut(to_integer(unsigned(y))), 
                             orig_8b => reg_lut(to_integer(unsigned(z))), 
                             dest_8b => A, 
                             orig_16b => NONE,
                             dest_16b => NONE, 
                             orig_dir => REG,
                             dest_dir => IMPLIED,  
                             cond => NONE);
                end if;
            when "11" =>
                case z is 
                    when "000" =>
                        --RET condition[y]
                        inst := (inst_type => RET, 
                                 orig_8b => NONE, 
                                 dest_8b => NONE, 
                                 orig_16b => NONE,
                                 dest_16b => NONE, 
                                 orig_dir => IMPLIED,
                                 dest_dir => IMPLIED, 
                                 cond => condition_lut(to_integer(unsigned(y))));
                    when "001" =>
                        if (q = '0') then
                            --POP regp2[p]
                            inst := (inst_type => POP, 
                                     orig_8b => NONE, 
                                     dest_8b => NONE, 
                                     orig_16b => NONE,  -- SP
                                     dest_16b => regp2_lut(to_integer(unsigned(p))), 
                                     orig_dir => IMPLIED,
                                     dest_dir => REG, 
                                     cond => NONE);
                        else
                            case p is
                                when "00" =>
                                    --RET
                                    inst := (inst_type => RET, 
                                             orig_8b => NONE, 
                                             dest_8b => NONE, 
                                             orig_16b => NONE,
                                             dest_16b => NONE, 
                                             orig_dir => IMPLIED,
                                             dest_dir => IMPLIED, 
                                             cond => NONE);
                                when "01" =>
                                    --EXX
                                    inst := (inst_type => EXX, 
                                             orig_8b => NONE, 
                                             dest_8b => NONE, 
                                             orig_16b => NONE,
                                             dest_16b => NONE, 
                                             orig_dir => IMPLIED,
                                             dest_dir => IMPLIED, 
                                             cond => NONE);
                                when "10" =>
                                    --JP (HL)
                                    inst := (inst_type => JP, 
                                             orig_8b => NONE, 
                                             dest_8b => NONE, 
                                             orig_16b => HL,
                                             dest_16b => PC, 
                                             orig_dir => INDIRECT,
                                             dest_dir => IMPLIED, 
                                             cond => NONE);
                                when "11" =>
                                    --LD SP, HL
                                    inst := (inst_type => LD, 
                                             orig_8b => NONE, 
                                             dest_8b => NONE,
                                             orig_16b => HL,
                                             dest_16b => SP, 
                                             orig_dir => REG,
                                             dest_dir => REG, 
                                             cond => NONE);
                            end case;
                        end if;
                    when "010" =>
                        --JP condition[y], nn
                        inst := (inst_type => JP, 
                                 orig_8b => NONE, 
                                 dest_8b => NONE, 
                                 orig_16b => NONE,
                                 dest_16b => PC, 
                                 orig_dir => IMMEDIATE_EXT,
                                 dest_dir => IMPLIED, 
                                 cond => condition_lut(to_integer(unsigned(y))));
                    when "011" =>
                        case y is 
                            when "000" =>
                                --JP nn
                                inst := (inst_type => JP, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => NONE,
                                         dest_16b => PC, 
                                         orig_dir => IMMEDIATE_EXT,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);                               
                            when "001" =>
                                --(CB prefix) ???
                            when "010" =>
                                --OUT (n), A
                                inst := (inst_type => OUT_INST, 
                                         orig_8b => A, 
                                         dest_8b => NONE, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => IMPLIED,
                                         dest_dir => INDIRECT, 
                                         cond => NONE);
                            when "011" =>
                                --IN A, (n)
                                inst := (inst_type => IN_INST, 
                                         orig_8b => NONE, 
                                         dest_8b => A, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => INDIRECT,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);
                            when "100" =>
                                --EX (SP), HL
                                inst := (inst_type => EX, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => HL,
                                         dest_16b => SP, 
                                         orig_dir => REG,
                                         dest_dir => INDIRECT, 
                                         cond => NONE);
                            when "101" =>
                                --EX DE, HL
                                inst := (inst_type => EX, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => HL,
                                         dest_16b => DE, 
                                         orig_dir => REG,
                                         dest_dir => REG, 
                                         cond => NONE);
                            when "110" =>
                                --DI
                                inst := (inst_type => DI, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => NONE,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);
                            when "111" =>
                                --EI
                                inst := (inst_type => EI, 
                                         orig_8b => NONE, 
                                         dest_8b => NONE, 
                                         orig_16b => NONE,
                                         dest_16b => NONE, 
                                         orig_dir => NONE,
                                         dest_dir => IMPLIED, 
                                         cond => NONE);
                        end case;
                    when "100" =>
                        --CALL condition[y], nn
                        inst := (inst_type => CALL, 
                                 orig_8b => NONE, 
                                 dest_8b => NONE, 
                                 orig_16b => NONE,
                                 dest_16b => NONE, 
                                 orig_dir => IMPLIED,
                                 dest_dir => IMPLIED, 
                                 cond => condition_lut(to_integer(unsigned(y))));
                    when "101" =>
                        if (q = '0') then
                            --PUSH regp2[p]
                            inst := (inst_type => PUSH, 
                                     orig_8b => NONE, 
                                     dest_8b => NONE, 
                                     orig_16b => regp2_lut(to_integer(unsigned(p))),
                                     dest_16b => NONE, -- (SP-1) and (SP-2)
                                     orig_dir => REG,
                                     dest_dir => IMPLIED, 
                                     cond => NONE);
                        else
                            case p is
                                when "00" =>
                                    --CALL nn
                                    inst := (inst_type => CALL, 
                                             orig_8b => NONE, 
                                             dest_8b => NONE, 
                                             orig_16b => NONE,
                                             dest_16b => NONE, 
                                             orig_dir => IMPLIED,
                                             dest_dir => IMPLIED, 
                                             cond => NONE);
                                when "01" =>
                                    --(DD prefix) ???
                                when "10" =>
                                    --(ED prefix) ???
                                when "11" =>
                                    --(FD prefix) ???
                            end case;
                        end if;
                    when "110" =>
                        --alu[y] n
                        if(y = "111") then  -- CP instruction does not return the result back to reg A as the rest of alu instructions do
                            inst := (inst_type => alu_inst_lut(to_integer(unsigned(y))), 
                                     orig_8b => NONE, 
                                     dest_8b => NONE, 
                                     orig_16b => NONE,
                                     dest_16b => NONE, 
                                     orig_dir => IMMEDIATE,
                                     dest_dir => IMPLIED,  
                                     cond => NONE);
                        else
                            inst := (inst_type => alu_inst_lut(to_integer(unsigned(y))), 
                                     orig_8b => NONE, 
                                     dest_8b => A, 
                                     orig_16b => NONE,
                                     dest_16b => NONE, 
                                     orig_dir => IMMEDIATE,
                                     dest_dir => IMPLIED,  
                                     cond => NONE);
                        end if;
                    when "111" =>
                        --RST y*8
                        inst := (inst_type => RST, 
                                 orig_8b => NONE, 
                                 dest_8b => NONE, 
                                 orig_16b => NONE,
                                 dest_16b => NONE, -- (SP-1) and (SP-2)
                                 orig_dir => MOD_P0,
                                 dest_dir => IMPLIED, 
                                 cond => NONE);
                end case;
        end case;
        
        return inst;
        
    end function;
    
end package body;
