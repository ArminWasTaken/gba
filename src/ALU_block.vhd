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
           control : in internal_ctrl;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           databus : inout signed(7 downto 0);
           addrbus : out signed(15 downto 0));
end ALU_block;

architecture Behavioral of ALU_block is

    component ALU port(
        a : in signed (7 downto 0);
        b : in signed (7 downto 0);
        a_16b : in signed (15 downto 0);
        b_16b : in signed (15 downto 0);
        control : in alu_inst_t;
        flags_in : in STD_LOGIC_VECTOR (7 downto 0);
        flags_out : out STD_LOGIC_VECTOR (7 downto 0);
        output : out STD_LOGIC_VECTOR (7 downto 0);
        output_16b : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    -- 8 bit Registers
    signal A_reg, A_next, F_reg, F_next : signed(7 downto 0);
    signal temp_reg, temp_next, tempA_reg, tempA_next : signed(15 downto 0);
    
    -- 16 bit Registers and Register pairs
    signal AF_reg, AF_next : signed(15 downto 0);
    
    -- Alternate Register set
    ---- 8 bit Registers
    signal A2_reg, A2_next, F2_reg, F2_next : signed(7 downto 0);
    
    ---- Register pairs
    signal AF2_reg, AF2_next : signed(15 downto 0);    
    
    -- ALU block signals
    signal a_input, b_input : signed(7 downto 0);
    signal a_16b_input, b_16b_input : signed(15 downto 0);
    signal flags_input : STD_LOGIC_VECTOR(7 downto 0);
begin
    
    ALU1: ALU port map(
            a => a_input,
            b => b_input,
            a_16b => a_16b_input,
            b_16b => b_16b_input,
            control => control, -- Changes required to  internal control type (and ALU control signal)
            flags_in => flags_input);
    
    process(clk, reset, databus) begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                -- 8 bit reg
                A_next <= (others => '0');
                F_next <= (others => '0');
                temp_next <= (others => '0');
                tempA_next <= (others => '0');
                -- 16 bit reg
                AF_next <= (others => '0');
                -- Alternate set
                A2_next <= (others => '0');
                F2_next <= (others => '0');
                AF2_next <= (others => '0');
            elsif(enable ='1') then
                
            else 
                
            end if;
        end if;
    end process;
    
    process(A_next, F_next, temp_next, tempA_next, 
            A2_next, F2_next, AF2_next) 
    begin
        -- 8 bit reg
        A_reg <= A_next;
        F_reg <= F_next;
        temp_reg <= temp_next;
        tempA_reg <= tempA_next;
        -- 16 bit reg
        AF_reg <= AF_next;
        -- Alternate set
        A2_reg <= A2_next;
        F2_reg <= F2_next;
        AF2_reg <= AF2_next; 
    end process;
    
    

end Behavioral;

