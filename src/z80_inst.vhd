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
    
    type inst_type_t is ( DIRECT, INDIRECT, IMMEDIATE );
    
    type inst_t is record
        inst_type: inst_type_t;
        input1: std_logic;
        input2: std_logic;
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
                                --JR cc[y-4], d
                        end case;
                    when "001" =>
                        if (q = '0') then
                            --LD rp[p], nn
                        else
                            --ADD HL, rp[p]
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
                                when "01" =>
                                when "10" =>
                                when "11" =>
                            end case;    
                        end if;
                    when "011" =>
                    when "100" =>
                    when "101" =>
                    when "110" =>
                    when "111" =>
                        case y is 
                            when "000" =>
                            when "001" =>
                            when "010" =>
                            when "011" =>
                            when "100" =>
                            when "101" =>
                            when "110" =>
                            when "111" =>
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
                    --LD r[y], r[z]
                end if;
            when "10" =>
                --alu[y] r[z]
            when "11" =>
                case z is 
                    when "000" =>
                    when "001" =>
                    when "010" =>
                    when "011" =>
                        case y is 
                            when "000" =>
                            when "001" =>
                            when "010" =>
                            when "011" =>
                            when "100" =>
                            when "101" =>
                            when "110" =>
                            when "111" =>
                        end case;
                    when "100" =>
                    when "101" =>
                    when "110" =>
                    when "111" =>
                end case;
        end case;
    end function;
    
end package body;
