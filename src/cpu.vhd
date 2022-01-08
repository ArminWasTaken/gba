----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 13:38:56
-- Design Name: 
-- Module Name: cpu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

library WORK;
use WORK.z80.ALL;
use WORK.z80_inst.ALL;

entity cpu is
    Port( clk : in std_logic;
          n_reset : in std_logic;
          addr : out std_logic_vector(15 downto 0);
          data : inout std_logic_vector(7 downto 0);
          sys_ctrl : out sys_ctrl_t;
          cpu_ctrl : in cpu_ctrl_t;
          n_halt : out std_logic;
          n_busrq : in std_logic;
          n_busack : out std_logic);
end cpu;

architecture Behavioral of cpu is

    component control port(
        clk : in std_logic;
        n_reset : in std_logic;
        data : in std_logic_vector(7 downto 0);
        sys_ctrl : out sys_ctrl_t;
        cpu_ctrl : in cpu_ctrl_t;
        n_halt : out std_logic;
        n_busrq : in std_logic;
        n_busack : out std_logic;
        regfile_ctrl : out reg_ctrl_t;
        alu_ctrl : out alublock_ctrl_t );
    end component;
    
    component blk_mem_gen_0 port(
        clka : IN STD_LOGIC;
        rsta : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) );
    end component;
    
    component regfile port(
        clk : in STD_LOGIC;
        control : in reg_ctrl_t;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0);
        addr_out : out std_logic_vector(15 downto 0)  );
    end component;
    
    component ALU_block port(
        clk : in STD_LOGIC;
        control : in alublock_ctrl_t;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0) );
    end component;
    
    component databus_mux port(
        control: in internal_ctrl_t;
        reg_data: in std_logic_vector(7 downto 0);
        alu_data: in std_logic_vector(7 downto 0);
        mem_data: in std_logic_vector(7 downto 0);
        databus: out std_logic_vector(7 downto 0) );
    end component;

    signal alu_ctrl_s : alublock_ctrl_t;
    signal regfile_ctrl_s : reg_ctrl_t;
    signal mem_ctrl_s : mem_ctrl_t;
    signal internal_ctrl_s : internal_ctrl_t;
    signal reg_out_s, alu_out_s, mem_out_s, databus_s : std_logic_vector(7 downto 0);
    signal addrbus_s : std_logic_vector(15 downto 0);

begin

    CONTROL1: control port map(
            clk => clk,
            n_reset => n_reset,
            data => databus_s,
            sys_ctrl => sys_ctrl,
            cpu_ctrl => cpu_ctrl,
            n_halt => n_halt,
            n_busrq => n_busrq,
            n_busack => n_busack,
            regfile_ctrl => regfile_ctrl_s,
            alu_ctrl => alu_ctrl_s );
    
    REGFILE1: regfile port map(
            clk => clk,
            control => regfile_ctrl_s,
            data_in => databus_s,
            data_out => reg_out_s,
            addr_out => addrbus_s
            );
    
    ALUblock: ALU_block port map(
            clk => clk,
            control => alu_ctrl_s,
            data_in => databus_s,
            data_out => alu_out_s
            );
            
    MEM: blk_mem_gen_0 port map(
            clka => clk,
            rsta => mem_ctrl_s.rsta,
            ena => mem_ctrl_s.ena,
            wea => mem_ctrl_s.wea,
            addra => addrbus_s(10 downto 0),
            dina => databus_s,
            douta => mem_out_s
            );
            
    DATA_MUX: databus_mux port map(
            control => internal_ctrl_s,
            reg_data => reg_out_s,
            alu_data => alu_out_s,
            mem_data => mem_out_s,
            databus => databus_s
            );

end Behavioral;
