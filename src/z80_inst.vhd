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
        ADD, ADC, SUB, SBC, LOGIC_AND, LOGIC_OR, LOGIC_XOR, CP, INC, DEC, --8 bit arithmetic instructions
        ADD_16b, INC_16b, DEC_16b, --16 bit arithmetic instructions
        RLCA, RLC, RLA, RL, RRCA, RRC, RRA, RR, --Rotate instructions
        SLA_INST, SRA_INST, SRL_INST, --Shift instructions
        BIT_INST, SET, RES, --Bit manipulation instructions
        NOP
        ); 
    
    -- ALU instructions LUT
    type inst_alu_lut_t is array(0 to 7) of inst_type_t;
    constant inst_alu_lut: inst_alu_lut_t :=(
        0 => ADD, 1 => ADC, 2 => SUB, 3 => SBC, 4 => LOGIC_AND, 5 => LOGIC_XOR, 6 => LOGIC_OR, 7 => CP 
    );
                  
    --type dir_t is (NONE, DIRECT, INDIRECT);
    
    -- 8 bit Registers
    type reg8_t is (NONE, B, C, D, E, H, L, HL_CONTENT,A);
    type reg_lut_t is array(0 to 7) of reg8_t;
    constant reg_lut: reg_lut_t :=(
        0 => B, 1 => C, 2 => D, 3 => E, 4 => H, 5 => L, 6 => HL_CONTENT, 7 => A 
    );
    
    -- 16 bit Registers (8 bit Register pairs)
    type reg16_t is (NONE, BC, DE, HL, SP, AF, BC_CONTENT, DE_CONTENT, HL_CONTENT, SP_CONTENT, AF_CONTENT);
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
        orig_8b: reg8_t;
        dest_8b: reg8_t;
        orig_16b: reg16_t;
        dest_16b: reg16_t;
        orig_int: integer;
        dest_int: integer;
        cond: condition_t;
        --dir_type: dir_t;
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
        variable inst : inst_t := (inst_type => NOP, orig_8b => NONE, dest_8b => NONE, orig_16b => NONE, dest_16b => NONE, orig_int => 0, dest_int => 0, cond => NONE); --, dir_type => NONE);
    begin
        case x is 
            when "00" =>
                case z is 
                    when "000" =>
                        case y is 
                            when "000" =>
                                --NOP
                            when "001" =>
                                --EX AF, AF'
                            when "010" =>
                                --DJNZ d
                            when "011" =>
                                --JR d
                            when others =>
                                --JR condition[y-4], d
                        end case;
                    when "001" =>
                        if (q = '0') then
                            --LD regp1[p], nn
                        else
                            --ADD HL, regp1[p]
                        end if;
                    when "010" =>
                        if (q = '0') then
                            case p is
                                when "00" =>
                                    --LD (BC), A
                                when "01" =>
                                    --LD (DE), A
                                when "10" =>
                                    --LD (nn), HL
                                when "11" =>
                                    --LD (nn), A
                            end case;
                        else
                            case p is
                                when "00" =>
                                    --LD A, (BC)
                                when "01" =>
                                    --LD A, (DE)
                                when "10" =>
                                    --LD HL, (nn)
                                when "11" =>
                                    --LD A, (nn)
                            end case;    
                        end if;
                    when "011" =>
                        if (q = '0') then
                            --INC regp1[p]
                        else
                            --DEC regp1[p]
                        end if;
                    when "100" =>
                        --INC reg[y]
                    when "101" =>
                        --DEC reg[y]
                    when "110" =>
                        --LD reg[y], n
                    when "111" =>
                        case y is 
                            when "000" =>
                                --RLCA
                            when "001" =>
                                --RRCA
                            when "010" =>
                                --RLA
                            when "011" =>
                                --RRA
                            when "100" =>
                                --DAA ???
                            when "101" =>
                                --CPL ???
                            when "110" =>
                                --SCF ???
                            when "111" =>
                                --CCF ???
                        end case;
                end case;
            when "01" =>
                if (z = "110") then
                    if (y = "110") then
                        --HALT
                    else
                        --NOP
                    end if;
                else
                    --LD reg[y], reg[z]
                end if;
            when "10" =>
                --alu[y] reg[z]
            when "11" =>
                case z is 
                    when "000" =>
                        --RET condition[y]
                    when "001" =>
                        if (q = '0') then
                            --POP regp2[p]
                        else
                            case p is
                                when "00" =>
                                    --RET
                                when "01" =>
                                    --EXX
                                when "10" =>
                                    --JP HL      (JP (HL))
                                when "11" =>
                                    --LD SP, HL
                            end case;
                        end if;
                    when "010" =>
                        --JP condition[y], nn
                    when "011" =>
                        case y is 
                            when "000" =>
                                --JP nn
                            when "001" =>
                                --(CB prefix) ???
                            when "010" =>
                                --OUT (n), A
                            when "011" =>
                                --IN A, (n)
                            when "100" =>
                                --EX (SP), HL
                            when "101" =>
                                --EX DE, HL
                            when "110" =>
                                --DI
                            when "111" =>
                                --EI
                        end case;
                    when "100" =>
                        --CALL condition[y], nn
                    when "101" =>
                        if (q = '0') then
                            --PUSH regp2[p]
                        else
                            case p is
                                when "00" =>
                                    --CALL nn
                                when "01" =>
                                    --(DD prefix)
                                when "10" =>
                                    --(ED prefix)
                                when "11" =>
                                    --(FD prefix)
                            end case;
                        end if;
                    when "110" =>
                        --alu[y] n
                    when "111" =>
                        --RST y*8
                end case;
        end case;
    end function;
    
end package body;
