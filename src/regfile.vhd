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
use WORK.z80.ALL;
use WORK.z80_inst.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regfile is
    Port ( clk : in STD_LOGIC;
           control : in reg_ctrl;
           databus : inout signed(7 downto 0);
           addrbus : out signed(15 downto 0));
end regfile;

architecture Behavioral of regfile is

    type regfile_t is array (regfile8_t) of signed(7 downto 0);
    signal regfile_next, regfile_reg: regfile_t;
    signal regpair_flag_next, regpair_flag_reg: std_logic;
    
--    -- 8 bit Registers
--    signal B_reg, B_next, C_reg, C_next, D_reg, D_next, E_reg, E_next, H_reg, H_next, L_reg, L_next : signed(7 downto 0);
--    signal I_reg, I_next, R_reg, R_next : signed(7 downto 0);
  
    -- 16 bit Registers
    signal  IX_reg, IX_next, IY_reg, IY_next, SP_reg, SP_next, PC_reg, PC_next : signed(15 downto 0);
    
--    -- Alternate Register set
--    ---- 8 bit Registers
--    signal B2_reg, B2_next, C2_reg, C2_next, D2_reg, D2_next, E2_reg, E2_next, H2_reg, H2_next, L2_reg, L2_next : signed(7 downto 0);

begin
    
    process(clk, control.rst)
    begin
        if control.rst = '1' then
            -- 8 bit reg
            regfile_reg <= (others => (others => '0'));
            regpair_flag_reg <= '0';
            
--            B_next <= (others => '0');
--            C_next <= (others => '0');
--            D_next <= (others => '0');
--            E_next <= (others => '0');
--            H_next <= (others => '0');
--            L_next <= (others => '0');
--            -- Alternate set
--            B2_next <= (others => '0');
--            C2_next <= (others => '0');
--            D2_next <= (others => '0');
--            E2_next <= (others => '0');
--            H2_next <= (others => '0');
--            L2_next <= (others => '0');
--            -- Interrupt and refresh
--            I_next <= (others => '0');
--            R_next <= (others => '0');
--            -- 16 bit reg
            IX_reg <= (others => '0');
            IY_reg <= (others => '0');
            SP_reg <= (others => '0'); 
            PC_reg <= (others => '0');
        elsif rising_edge(clk) then
            regfile_reg <= regfile_next;
            regpair_flag_reg <= regpair_flag_next;
            
--            -- 8 bit reg
--            B_reg <= B_next;
--            C_reg <= C_next;
--            D_reg <= D_next;
--            E_reg <= E_next;
--            H_reg <= H_next;
--            L_reg <= L_next;
--            -- Alternate set
--            B2_reg <= B2_next;
--            C2_reg <= C2_next;
--            D2_reg <= D2_next;
--            E2_reg <= E2_next;
--            H2_reg <= H2_next;
--            L2_reg <= L2_next;
--            -- Interrupt and refresh
--            I_reg <= I_next;
--            R_reg <= R_next;
            -- 16 bit reg
            IX_reg <= IX_next;
            IY_reg <= IY_next;
            SP_reg <= SP_next;
            PC_reg <= PC_next;
        end if;
    end process;
    
    process( regpair_flag_reg, control, databus, regfile_next, regfile_reg, SP_next, SP_reg, PC_next, PC_reg, 
--        B_next, C_next, D_next, E_next, H_next, L_next,
--        I_next, R_next,
             IX_next, IY_next
--        B2_next, C2_next, D2_next, E2_next, H2_next, L2_next
    ) 
    begin
        -- Default operation
        regfile_next <= regfile_reg;
        regpair_flag_next <= regpair_flag_reg;
        
        if control.reg_enable = '1' then    -- Data from databus only gets INTO the registers if reg_enable = '1' 
            case control.dest8b is
                when NONE =>
                    case control.dest16b is
                        when BC =>
                            if regpair_flag_reg = '0' then
                                regfile_next(C) <= databus;
                                regpair_flag_next <= '1';
                            else
                                regfile_next(B) <= databus;
                                regpair_flag_next <= '0';
                            end if;
                        when DE =>
                            if regpair_flag_reg = '0' then
                                regfile_next(E) <= databus;
                                regpair_flag_next <= '1';
                            else
                                regfile_next(D) <= databus;
                                regpair_flag_next <= '0';
                            end if;
                        when HL =>
                            if regpair_flag_reg = '0' then
                                regfile_next(L) <= databus;
                                regpair_flag_next <= '1';
                            else
                                regfile_next(H) <= databus;
                                regpair_flag_next <= '0';
                            end if;
                        when SP =>
                            if regpair_flag_reg = '0' then
                                SP_next(7 downto 0) <= databus;
                                regpair_flag_next <= '1';
                            else
                                SP_next(15 downto 8) <= databus;
                                regpair_flag_next <= '0';
                            end if;
                        when PC =>
                            if regpair_flag_reg = '0' then
                                PC_next(7 downto 0) <= databus;
                                regpair_flag_next <= '1';
                            else
                                PC_next(15 downto 8) <= databus;
                                regpair_flag_next <= '0';
                            end if;
                        when others=> -- NONE -> Default operation
                    end case;
                when others =>
                    regfile_next(control.dest8b) <= databus;
            end case;
        else                                -- reg_enable = '0' -> Data is read FROM the registers 
            case control.orig8b is
                when NONE =>
                    if control.bustype = DATAB then
                        case control.orig16b is
                            when BC =>
                                if regpair_flag_reg = '0' then
                                    databus <= regfile_reg(C);
                                    regpair_flag_next <= '1';
                                else
                                    databus <= regfile_reg(B);
                                    regpair_flag_next <= '0';
                                end if;
                            when DE =>
                                if regpair_flag_reg = '0' then
                                    databus <= regfile_reg(E);
                                    regpair_flag_next <= '1';
                                else
                                    databus <= regfile_reg(D);
                                    regpair_flag_next <= '0';
                                end if;
                            when HL =>
                                if regpair_flag_reg = '0' then
                                    databus <= regfile_reg(H);
                                    regpair_flag_next <= '1';
                                else
                                    databus <= regfile_reg(L);
                                    regpair_flag_next <= '0';
                                end if;
                            when SP =>
                                if regpair_flag_reg = '0' then
                                    databus <= SP_reg(7 downto 0);
                                    regpair_flag_next <= '1';
                                else
                                    databus <= SP_reg(15 downto 8);
                                    regpair_flag_next <= '0';
                                end if;
                            when PC =>
                                if regpair_flag_reg = '0' then
                                    databus <= PC_reg(7 downto 0);
                                    regpair_flag_next <= '1';
                                else
                                    databus <= PC_reg(15 downto 8);
                                    regpair_flag_next <= '0';
                                end if;
                            when others=> -- NONE -> Default operation
                        end case;
                    else
                        case control.orig16b is
                            when BC =>
                                addrbus(7 downto 0) <= regfile_reg(C);
                                addrbus(15 downto 8) <= regfile_reg(B);
                            when DE =>
                                addrbus(7 downto 0) <= regfile_reg(D);
                                addrbus(15 downto 8) <= regfile_reg(E);
                            when HL =>
                                addrbus(7 downto 0) <= regfile_reg(H);
                                addrbus(15 downto 8) <= regfile_reg(L);
                            when SP =>
                                addrbus <= SP_reg;
                            when PC =>
                                addrbus <= PC_reg;
                            when others=> -- NONE -> Default operation
                        end case;
                    end if;
                when others =>
                    if control.bustype = DATAB then
                            databus <= regfile_reg(control.orig8b);
                        else
                            addrbus(7 downto 0) <= regfile_reg(control.orig8b);
                    end if;
            end case;
            
            case control.dest8b is
                when NONE =>
                    case control.dest16b is
                        when BC =>
                            addrbus(7 downto 0) <= regfile_reg(C);
                            addrbus(15 downto 8) <= regfile_reg(B);
                        when DE =>
                            addrbus(7 downto 0) <= regfile_reg(D);
                            addrbus(15 downto 8) <= regfile_reg(E);
                        when HL =>
                            addrbus(7 downto 0) <= regfile_reg(H);
                            addrbus(15 downto 8) <= regfile_reg(L);
                        when SP =>
                            addrbus <= SP_reg;
                        when PC =>
                            addrbus <= PC_reg;
                        when others=> -- NONE -> Default operation
                    end case;
                when others =>
                    addrbus(7 downto 0) <= regfile_reg(control.dest8b);
            end case;
        end if;
        
    end process;
    
end Behavioral;
