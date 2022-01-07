----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Enrique Robles Sanz
-- 
-- Create Date: 27.06.2021 00:47:36
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 6
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

entity ALU is
    Port ( a : in signed (7 downto 0);
           b : in signed (7 downto 0);
           a_16b : in signed (15 downto 0);
           b_16b : in signed (15 downto 0);
           control : in alublock_ctrl;
           flags_in : in STD_LOGIC_VECTOR (7 downto 0); -- Only 4 flags used -> Z C N H
           flags_out : out STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0);
           output_16b : out STD_LOGIC_VECTOR (15 downto 0) );
end ALU;

architecture Behavioral of ALU is

    signal Z, C, N, H : std_logic;
    signal Z_in, C_in, N_in , H_in : std_logic;
    signal result : signed (8 downto 0);
    signal result_16b, op_16b : signed (16 downto 0);

begin
    
    -- Input flags
    Z_in <= flags_in(3);
    C_in <= flags_in(2);
    N_in <= flags_in(1);
    H_in <= flags_in(0);
    
    -- Operations
    process (
        -- Inputs
        a, b, a_16b, b_16b, control, Z_in, C_in, N_in, H_in,
        -- Outputs
        result, result_16b
    )
        variable C_inv, op : signed (8 downto 0);
        variable result_temp : signed (7 downto 0);
        variable bit_index : integer;
    begin

        --Carry in for addition
        C_inv(C_inv'right) := C_in;
        
        --Flags are not affected by default
        Z <= Z_in;
        C <= C_in;
        N <= N_in;
        H <= H_in;
        
        -- Output signals' default value
        result <= (others=>'0');
        result_16b <= (others=>'0');
    
        if control.alu_enable = '1' then
            case control.inst is
                when ADD => 
                    result <= resize(a, result'length) + resize(b, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= result(result'left);
                    N <= '0';
                    H <= a(4) xnor b(4);
                when ADC => 
                    op := resize(a, result'length) + resize(b, result'length);
                    result <= op + C_inv;
                    if(result = "000000000") then
                        Z <= '1';
                    else 
                        Z <= '0';
                    end if;
                    C <= op(op'left);
                    N <= '0';
                    H <= a(4) xnor b(4);
                when SUB => 
                    result <= resize(a, result'length) - resize(b, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= result(result'left);
                    N <= '1';
                    H <= a(4) xnor b(4);
                when SBC => 
                    op := resize(a, result'length) - resize(b, result'length);
                    result <= op - C_inv;
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= op(op'left);
                    N <= '1';
                    H <= a(4) xnor b(4);  
                when LOGIC_AND => 
                    result <= resize(a, result'length) and resize(b, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= '0';
                    N <= '0'; 
                    H <= '1';  
                when LOGIC_OR => 
                    result <= resize(a, result'length) or resize(b, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= '0';
                    N <= '0'; 
                    H <= '0';    
                when LOGIC_XOR => 
                    result <= resize(a, result'length) xor resize(b, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= '0';
                    N <= '0'; 
                    H <= '0'; 
                when CP =>  -- Compare: This instruction differs from the SUB instruction in that the contents of A (destination reg) aren't changed, only the flags.
                    op := resize(a, result'length) - resize(b, result'length);
                    if(op = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= op(op'left);
                    N <= '1';
                    H <= a(4) xnor b(4);
                when INC => -- Increment
                    result <= resize(a, result'length) + to_signed(1, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    N <= '0';
                    H <= a(4) xnor b(4);
                when DEC => -- Decrement
                    result <= resize(a, result'length) - to_signed(1, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    N <= '0';
                    H <= a(4) xnor b(4);
                when ADD_16b =>
                    result_16b <= resize(a_16b, result_16b'length) + resize(b_16b, result_16b'length);
                    C <= result_16b(result_16b'left);
                    N <= '0';
                when INC_16b =>
                    result_16b <= resize(a_16b, result_16b'length) + to_signed(1, result_16b'length);
                when DEC_16b =>
                    result_16b <= resize(a_16b, result_16b'length) - to_signed(1, result_16b'length);
                when RLCA =>
                    result_temp := signed(a(6 downto 0) & a(7));
                    result <= resize(result_temp, result'length);
                    C <= a(a'left);
                    N <= '0';
                    H <= '0';
                when RLC =>
                    result_temp := signed(b(6 downto 0) & b(7));
                    result <= resize(result_temp, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= b(b'left);
                    N <= '0';
                    H <= '0';
                when RLA =>
                    result_temp := signed(a(6 downto 0) & C_in);
                    result <= resize(result_temp, result'length);
                    C <= a(7);
                    N <= '0';
                    H <= '0';
                when RL =>
                    result_temp := signed(b(6 downto 0) & C_in);
                    result <= resize(result_temp, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= b(7);
                    N <= '0';
                    H <= '0';
                when RRCA =>
                    result_temp := signed(a(0) & a(7 downto 1));
                    result <= resize(result_temp, result'length);
                    C <= a(0);
                    N <= '0';
                    H <= '0';
                when RRC =>
                    result_temp := signed(b(0) & b(7 downto 1));
                    result <= resize(result_temp, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= b(0);
                    N <= '0';
                    H <= '0';
                when RRA =>
                    result_temp := signed(C_in & a(7 downto 1));
                    result <= resize(result_temp, result'length);
                    C <= a(0);
                    N <= '0';
                    H <= '0';
                when RR =>
                    result_temp := signed(C_in & b(7 downto 1));
                    result <= resize(result_temp, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= b(0);
                    N <= '0';
                    H <= '0';
                when SLA_inst =>
                    result_temp := signed(b(6 downto 0) & '0');
                    result <= resize(result_temp, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= b(7);
                    N <= '0';
                    H <= '0';
                when SRA_inst =>
                    result_temp := signed(b(7) & b(7 downto 1));
                    result <= resize(result_temp, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= b(0);
                    N <= '0';
                    H <= '0';
                when SRL_inst =>
                    result_temp := signed('0' & b(7 downto 1));
                    result <= resize(result_temp, result'length);
                    if(result = "000000000") then
                        Z<='1';
                    else 
                        Z <= '0';
                    end if;
                    C <= b(0);
                    N <= '0';
                    H <= '0';
                when BIT_inst =>
                    bit_index := to_integer(a); 
                    Z <= not(b(bit_index));
                    N <= '0';
                    H <= '1';                
                when SET =>
                    bit_index := to_integer(a);
                    result <= resize(b, result'length);
                    result(bit_index) <= '1';
                when RES =>
                    bit_index := to_integer(a);
                    result <= resize(b, result'length);
                    result(bit_index) <= '0';
                when others =>
                    result <= (others=>'0');
                    result_16b <= (others=>'0');
                    Z <= Z_in;
                    C <= C_in;
                    N <= N_in;
                    H <= H_in;
            end case;
        end if;
    end process;
    
    output <= std_logic_vector(result (7 downto 0));
    output_16b <= std_logic_vector(result_16b (15 downto 0));
    flags_out <= "0000" & Z & C & N & H; -- F register is a 8-bit register
    
end Behavioral;
