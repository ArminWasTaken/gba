----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Enrique Robles Sanz
-- 
-- Create Date: 22.11.2021 17:48:26
-- Design Name: 
-- Module Name: reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 1
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library WORK;
--use WORK.z80.ALL;
use WORK.z80_inst.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regfile is
    Port ( clk : in STD_LOGIC;
           rst : in std_logic;
           control : in reg_ctrl_t;
           data_in : in std_logic_vector(7 downto 0);
           data_out : out std_logic_vector(7 downto 0);
           addr_out : out std_logic_vector(15 downto 0) );
end regfile;

architecture Behavioral of regfile is

    type regfile_t is array (regfile8_t) of std_logic_vector(7 downto 0);
    signal regfile_next, regfile_reg: regfile_t;
  
    -- 16 bit Registers
    signal  IX_reg, IX_next, IY_reg, IY_next, SP_reg, SP_next, PC_reg, PC_next : std_logic_vector(15 downto 0);

begin
    
    -- Data Registers
    dr: process(clk, rst)
    begin
        if rst = '1' then
            -- 8 bit reg
            regfile_reg <= (others => "00000001");--(others => '0'));
            
            -- 16 bit reg
            IX_reg <= (others => '0');
            IY_reg <= (others => '0');
            SP_reg <= (others => '0'); 
            PC_reg <= (others => '0');
        elsif rising_edge(clk) then
            regfile_reg <= regfile_next;

            -- 16 bit reg
            IX_reg <= IX_next;
            IY_reg <= IY_next;
            SP_reg <= SP_next;
            PC_reg <= PC_next;
        end if;
    end process;
    
    -- Data in logic
    dil: process(control.reg_enable, control.din_reg, data_in, regfile_reg, SP_reg, PC_reg, IX_reg, IY_reg) 
    begin
        -- Default operation
        regfile_next <= regfile_reg;
        SP_next <= SP_reg; -- Maybe missing mux + (+-1)
        PC_next <= std_logic_vector(unsigned(PC_reg) + 1); -- Maybe missing mux + (+-1)
        IX_next <= IX_reg;
        IY_next <= IY_reg;
        
        if control.reg_enable = '1' then    -- Data from databus only gets INTO the registers if reg_enable = '1' 
            case control.din_reg is
                when NONE =>    -- Default
                when SP_L =>
                    SP_next(7 downto 0) <= data_in;
                when SP_H =>
                    SP_next(15 downto 8) <= data_in;
                when PC_L =>
                    PC_next(7 downto 0) <= data_in;
                when PC_H =>
                    PC_next(15 downto 8) <= data_in;
                when IX_L =>
                    IX_next(7 downto 0) <= data_in;
                when IX_H =>
                    IX_next(15 downto 8) <= data_in;
                when IY_L =>
                    IY_next(7 downto 0) <= data_in;
                when IY_H =>
                    IY_next(15 downto 8) <= data_in;
                when others =>
                    regfile_next(control.din_reg) <= data_in;
            end case;    
        end if;                             
    end process;
    
    -- Output logic
    ol: process(control.dout_reg, control.addr_reg, regfile_reg, SP_reg, PC_reg, IX_reg, IY_reg)
    begin
        data_out <= (others => '0');
        addr_out <= (others => '0');
        
        case control.dout_reg is
            when NONE => -- Default
            when others =>
                data_out <= regfile_reg(control.dout_reg);
        end case;
        
        case control.addr_reg is
            when BC =>
                addr_out(7 downto 0) <= regfile_reg(C);
                addr_out(15 downto 8) <= regfile_reg(B);
            when DE =>
                addr_out(7 downto 0) <= regfile_reg(D);
                addr_out(15 downto 8) <= regfile_reg(E);
            when HL =>
                addr_out(7 downto 0) <= regfile_reg(H);
                addr_out(15 downto 8) <= regfile_reg(L);
            when SP =>
                addr_out <= SP_reg;
            when PC =>
                addr_out <= PC_reg;
            when IX =>
                addr_out <= IX_reg;
            when IY =>
                addr_out <= IY_reg;
            when others=> -- NONE -> Default operation
        end case;

    end process;

end Behavioral;
