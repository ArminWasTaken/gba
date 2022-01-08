----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Enrique Robles Sanz
-- 
-- Create Date: 04.01.2022 18:23:40
-- Design Name: 
-- Module Name: databus_mux - Behavioral
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
use WORK.z80_inst.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity databus_mux is
    Port ( control: in mux_ctrl_t;
           reg_data: in std_logic_vector(7 downto 0);
           alu_data: in std_logic_vector(7 downto 0);
           mem_data: in std_logic_vector(7 downto 0);
           ext_data: in std_logic_vector(7 downto 0);
           databus: out std_logic_vector(7 downto 0) );
end databus_mux;

architecture Behavioral of databus_mux is

begin

    process(control, reg_data, alu_data, mem_data)
    begin
        
        case control is
            when REG =>
                databus <= reg_data;
            when ALU =>
                databus <= alu_data;
            when MEM =>
                databus <= mem_data;
            when EXT =>
                databus <= ext_data;
        end case;  
    
    end process;

end Behavioral;
