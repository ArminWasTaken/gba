----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2020 14:16:23
-- Design Name: 
-- Module Name: fourbits_adder - Behavioral
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

entity fourbits_adder is
    Port ( a_total : in STD_LOGIC_VECTOR(3 downto 0);
           b_total : in STD_LOGIC_VECTOR(3 downto 0);
           cin_total : in STD_LOGIC;
           cout_total : out STD_LOGIC;
           s_total : out STD_LOGIC_VECTOR(3 downto 0));
end fourbits_adder;

architecture Behavioral of fourbits_adder is

component fulladder_dataflow port(
    a : in std_logic;
    b : in std_logic;
    cin : in std_logic;
    cout : out std_logic;
    s : out std_logic
    );
end component;

--Declaración de señales
signal C1,C2,C3 : std_logic;

begin

U1 : fulladder_dataflow
port map (
 a=>a_total(0),
 b=>b_total(0),
 cin=>cin_total,
 cout=>C1,
 s=>s_total(0)
);

U2 : fulladder_dataflow
port map (
 a=>a_total(1),
 b=>b_total(1),
 cin=>C1,
 cout=>C2,
 s=>s_total(1)
);

U3 : fulladder_dataflow
port map (
 a=>a_total(2),
 b=>b_total(2),
 cin=>C2,
 cout=>C3,
 s=>s_total(2)
);

U4 : fulladder_dataflow
port map (
 a=>a_total(3),
 b=>b_total(3),
 cin=>C3,
 cout=>cout_total,
 s=>s_total(3)
);

end Behavioral;
