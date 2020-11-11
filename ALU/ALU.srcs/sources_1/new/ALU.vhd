----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 17:27:09
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    generic(N : integer := 4);
    Port(A, B : in std_logic_vector(N-1 downto 0);
         F : in std_logic_vector(2 downto 0);
         cout : out std_logic;
         Y : out std_logic_vector(N-1 downto 0));
end ALU;

architecture Behavioral of ALU is

signal S : std_logic_vector(N downto 0);
signal nB, BB, op_AND, op_OR, op_zero_ext : std_logic_vector(N-1 downto 0);
signal control1 : std_logic;
signal control2 : std_logic_vector(1 downto 0);

component fourbits_adder is
    Port ( a_total : in STD_LOGIC_VECTOR(3 downto 0);
           b_total : in STD_LOGIC_VECTOR(3 downto 0);
           cin_total : in STD_LOGIC;
           cout_total : out STD_LOGIC;
           s_total : out STD_LOGIC_VECTOR(3 downto 0));
end component; 

component mux_2x1 is
    Port ( a : in STD_LOGIC_VECTOR (N-1 downto 0);
           b : in STD_LOGIC_VECTOR (N-1 downto 0);
           control : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component mux_4x1 is
    Port ( a : in STD_LOGIC_VECTOR (N-1 downto 0);
           b : in STD_LOGIC_VECTOR (N-1 downto 0);
           c : in STD_LOGIC_VECTOR (N-1 downto 0);
           d : in STD_LOGIC_VECTOR (N-1 downto 0);
           control : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (N-1 downto 0));   
end component;

begin

FA : fourbits_adder port map(
    a_total => A,
    b_total => BB,
    cin_total => F(2),
    cout_total => S(N),
    s_total => S(N-1 downto 0));

mux1 : mux_2x1 port map(
    a => B,
    b => nB,
    control => control1,
    output => BB);

mux2 : mux_4x1 port map(
    a => op_AND,
    b => op_OR,
    c => S(N-1 downto 0),
    d => op_zero_ext,
    control => control2,
    output => Y);

control1 <= F(2);
control2 <= F(1 downto 0);
cout <= S(N);
nB <= not(B);
op_AND <= A and BB;
op_OR <= A or BB;
op_zero_ext <= (0=>not(S(N)), others => '0');

end Behavioral;
