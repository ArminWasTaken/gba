----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 17:42:54
-- Design Name: 
-- Module Name: mux_4x1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_4x1 is
    generic(N : integer := 4);
    Port ( a : in STD_LOGIC_VECTOR (N-1 downto 0);
           b : in STD_LOGIC_VECTOR (N-1 downto 0);
           c : in STD_LOGIC_VECTOR (N-1 downto 0);
           d : in STD_LOGIC_VECTOR (N-1 downto 0);
           control : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (N-1 downto 0));
end mux_4x1;

architecture Behavioral of mux_4x1 is

begin

process(control,a,b,c,d)
begin
    case control is
        when "00" => output <= a;
        when "01" => output <= b;
        when "10" => output <= c;
        when "11" => output <= d;
    end case;
end process;

end Behavioral;
