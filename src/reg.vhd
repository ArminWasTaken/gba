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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library WORK;
use WORK.z80.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in signed(7 downto 0);
           data_out : out signed(7 downto 0));
end reg;

architecture Behavioral of reg is

    signal data_reg, data_next : signed(7 downto 0);

begin
    
    process(clk, data_in) begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                data_next <= (others => '0');
            elsif(enable ='1') then
                data_next <= data_in;
            else 
                data_next <= data_reg;
            end if;
        end if;
    end process;
    
    process(data_next) begin
        data_reg <= data_next;
    end process;
    
    data_out <= data_reg;

end Behavioral;
