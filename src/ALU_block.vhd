----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Enrique Robles Sanz
-- 
-- Create Date: 28.12.2021 18:14:49
-- Design Name: 
-- Module Name: ALU_block - Behavioral
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
library WORK;
use WORK.z80.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_block is
    Port ( clk : in STD_LOGIC;
           control : in alublock_ctrl;
           data_in : in std_logic_vector(7 downto 0);
           data_out : out std_logic_vector(7 downto 0) );
end ALU_block;

architecture Behavioral of ALU_block is

    component ALU port(
        a : in signed (7 downto 0);
        b : in signed (7 downto 0);
        a_16b : in signed (15 downto 0);
        b_16b : in signed (15 downto 0);
        control : in alublock_ctrl;
        flags_in : in STD_LOGIC_VECTOR (7 downto 0);
        flags_out : out STD_LOGIC_VECTOR (7 downto 0);
        output : out STD_LOGIC_VECTOR (7 downto 0);
        output_16b : out STD_LOGIC_VECTOR (15 downto 0) );
    end component;
    
    -- 8 bit Registers
    signal A_reg, A_next : std_logic_vector(7 downto 0);
    signal F_reg, F_next : std_logic_vector(7 downto 0);
    signal temp_reg, temp_next, tempA_reg, tempA_next : std_logic_vector(7 downto 0);
    
    -- Alternate Register set
    ---- 8 bit Registers
    signal A2_reg, A2_next : std_logic_vector(7 downto 0); 
    signal F2_reg, F2_next : std_logic_vector(7 downto 0);
    
    -- ALU block signals
    signal a_input, b_input : signed(7 downto 0);
    signal a_16b_input, b_16b_input : signed(15 downto 0);
    signal alu_output, flags_input, flags_output : STD_LOGIC_VECTOR(7 downto 0);
begin
    
    ALU1: ALU port map(
            a => a_input,
            b => b_input,
            a_16b => a_16b_input,
            b_16b => b_16b_input,
            control => control,
            flags_in => flags_input,
            flags_out => flags_output,
            output => alu_output);
    
    -- ALU Registers
    alu_r: process(clk, control.rst) 
    begin
        if(control.rst = '1') then
            -- 8 bit reg
            A_reg <= (others => '0');
            F_reg <= (others => '0');
            temp_reg <= (others => '0');
            tempA_reg <= (others => '0');
            -- Alternate set
            A2_reg <= (others => '0');
            F2_reg <= (others => '0');
        elsif(rising_edge(clk)) then
            -- 8 bit reg
            A_reg <= A_next;
            F_reg <= F_next;
            temp_reg <= temp_next;
            tempA_reg <= tempA_next;
            -- Alternate set
            A2_reg <= A2_next;
            F2_reg <= F2_next; 
        end if;
    end process;
    
    -- Input logic
    alu_il: process(data_in, control.reg_enable, control.din_alu
            --A_reg, F_reg, temp_reg, tempA_reg, A2_reg, F2_reg, flags_output
            ) 
    begin
        -- Default
        -- 8 bit reg
        A_next <= A_reg;
        F_next <= F_reg;
        temp_next <= temp_reg;
        tempA_next <= tempA_reg;
        -- Alternate set
        A2_next <= A2_reg;
        F2_next <= F2_reg;
        
        if control.reg_enable = '1' then
            tempA_next <= A_reg;
            F_next <= flags_output;
                case control.din_alu is
                    when A =>
                        A_next <= data_in;
                    when TEMP =>
                        temp_next <= data_in;
                    when F =>
                        F_next <= data_in;
                    when others =>
                end case;
        end if;
    end process;
    
    -- Output logic
    alu_ol: process(control.dout_alu, A_reg, F_reg, tempA_reg, temp_reg, 
            alu_output, flags_output)
    begin
    
    case control.dout_alu is
        when A =>
            data_out <= A_reg;
        when TEMP =>
            data_out <= temp_reg;
        when F =>
            data_out <= F_reg;
        when ALU_OUT =>
            data_out <= alu_output;
    end case;
    
    a_input <= signed(tempA_reg);
    b_input <= signed(temp_reg);
    
    a_16b_input <= (others => '0'); -- For now
    b_16b_input <= (others => '0'); -- For now
    
    flags_input <= F_reg;
    end process;
    
end Behavioral;

