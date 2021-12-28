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

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regfile is
    Port ( clk : in STD_LOGIC;
           control : in internal_ctrl;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           databus : inout signed(7 downto 0);
           addrbus : out signed(15 downto 0));
end regfile;

architecture Behavioral of regfile is

    -- 8 bit Registers
    signal B_reg, B_next, C_reg, C_next, D_reg, D_next, E_reg, E_next, H_reg, H_next, L_reg, L_next, I_reg, I_next, R_reg, R_next : signed(7 downto 0);
    
    -- 16 bit Registers and Register pairs
    signal BC_reg, BC_next, DE_reg, DE_next, HL_reg, HL_next, IX_reg, IX_next, IY_reg, IY_next, SP_reg, SP_next, PC_reg, PC_next : signed(15 downto 0);
    
    -- Alternate Register set
    ---- 8 bit Registers
    signal B2_reg, B2_next, C2_reg, C2_next, D2_reg, D2_next, E2_reg, E2_next, H2_reg, H2_next, L2_reg, L2_next : signed(7 downto 0);
    
    ---- Register pairs
    signal BC2_reg, BC2_next, DE2_reg, DE2_next, HL2_reg, HL2_next : signed(15 downto 0);    

begin
    
    process(clk, reset, databus) begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                -- 8 bit reg
                B_next <= (others => '0');
                C_next <= (others => '0');
                D_next <= (others => '0');
                E_next <= (others => '0');
                H_next <= (others => '0');
                L_next <= (others => '0');
                I_next <= (others => '0');
                R_next <= (others => '0');
                -- 16 bit reg
                BC_next <= (others => '0');
                DE_next <= (others => '0');
                HL_next <= (others => '0');
                IX_next <= (others => '0');
                IY_next <= (others => '0');
                SP_next <= (others => '0'); -- Maybe not 
                PC_next <= (others => '0'); -- Maybe not
                -- Alternate set
                B2_next <= (others => '0');
                C2_next <= (others => '0');
                D2_next <= (others => '0');
                E2_next <= (others => '0');
                H2_next <= (others => '0');
                L2_next <= (others => '0');
                BC2_next <= (others => '0');
                DE2_next <= (others => '0');
                HL2_next <= (others => '0');
            elsif(enable ='1') then
                
            else 
                
            end if;
        end if;
    end process;
    
    process(B_next, C_next, D_next, E_next, H_next, L_next, I_next, R_next, BC_next, DE_next, HL_next, IX_next, IY_next, SP_next, PC_next, 
            B2_next, C2_next, D2_next, E2_next, H2_next, L2_next, BC2_next, DE2_next, HL2_next) 
    begin
        -- 8 bit reg
        B_reg <= B_next;
        C_reg <= C_next;
        D_reg <= D_next;
        E_reg <= E_next;
        H_reg <= H_next;
        L_reg <= L_next;
        I_reg <= I_next;
        R_reg <= R_next;
        -- 16 bit reg
        BC_reg <= BC_next;
        DE_reg <= DE_next;
        HL_reg <= HL_next;
        IX_reg <= IX_next;
        IY_reg <= IY_next;
        SP_reg <= SP_next;
        PC_reg <= PC_next;
        -- Alternate set
        B2_reg <= B2_next;
        C2_reg <= C2_next;
        D2_reg <= D2_next;
        E2_reg <= E2_next;
        H2_reg <= H2_next;
        L2_reg <= L2_next;
        BC2_reg <= BC2_next; 
        DE2_reg <= DE2_next; 
        HL2_reg <= HL2_next; 
    end process;
    
    

end Behavioral;
