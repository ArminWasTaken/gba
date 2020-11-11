----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.10.2020 18:52:29
-- Design Name: 
-- Module Name: mult_2x2 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult_2x2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end mult_2x2;

architecture Behavioral of mult_2x2 is

type ROM_mem is array (0 to 6) of std_logic_vector (3 downto 0);

 --Resultados de las multiplicaciones
constant ROM_content: ROM_mem := (0 => "0000", --0
                                  1 => "0001", --1
                                  2 => "0010", --2
                                  3 => "0011", --3
                                  4 => "0100", --4
                                  5 => "0110", --6
                                  6 => "1001"); --9
                                  
component deco port(
    A : in STD_LOGIC_VECTOR (1 downto 0);
    B : in STD_LOGIC_VECTOR (1 downto 0);
    C : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;
                                  
signal Addr : std_logic_vector (2 downto 0);

begin

decodificador : deco port map(
        A=>a,
        B=>b,
        C=>Addr
    );

y <= ROM_content(to_integer(unsigned(Addr)));

end Behavioral;
