--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:54:56 07/02/2018
-- Design Name:   
-- Module Name:   C:/Users/Chris/git/Raven68k/Xilinx/Raven68k/tb_cpld.vhd
-- Project Name:  cpld
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpld
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_cpld IS
END tb_cpld;
 
ARCHITECTURE behavior OF tb_cpld IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpld
    PORT(
         clk : IN  std_logic;
         duart_dtack : IN  std_logic;
         duart_irq : IN  std_logic;
         rw : IN  std_logic;
         as : IN  std_logic;
         lds : IN  std_logic;
         uds : IN  std_logic;
         e : IN  std_logic;
         a7 : IN  std_logic;
         a8 : IN  std_logic;
         a9 : IN  std_logic;
         a17 : IN  std_logic;
         a21 : IN  std_logic;
         clk_out : OUT  std_logic;
         ipl : OUT  std_logic_vector(2 downto 0);
         oe : OUT  std_logic;
         rom_evn_cs : INOUT  std_logic;
         rom_odd_cs : INOUT  std_logic;
         ram_evn_cs : INOUT  std_logic;
         ram_odd_cs : INOUT  std_logic;
         berr : OUT  std_logic;
         duart_cs : OUT  std_logic;
         dtack_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal duart_dtack : std_logic := '1';
   signal duart_irq : std_logic := '1';
   signal rw : std_logic := '1';
   signal as : std_logic := '1';
   signal lds : std_logic := '1';
   signal uds : std_logic := '1';
   signal e : std_logic := '1';
   signal a7 : std_logic := '0';
   signal a8 : std_logic := '0';
   signal a9 : std_logic := '0';
   signal a17 : std_logic := '0';
   signal a21 : std_logic := '0';

	--BiDirs
   signal rom_evn_cs : std_logic;
   signal rom_odd_cs : std_logic;
   signal ram_evn_cs : std_logic;
   signal ram_odd_cs : std_logic;

 	--Outputs
   signal clk_out : std_logic;
   signal ipl : std_logic_vector(2 downto 0);
   signal oe : std_logic;
   signal berr : std_logic;
   signal duart_cs : std_logic;
   signal dtack_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1us;
   constant clk_out_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpld PORT MAP (
          clk => clk,
          duart_dtack => duart_dtack,
          duart_irq => duart_irq,
          rw => rw,
          as => as,
          lds => lds,
          uds => uds,
          e => e,
          a7 => a7,
          a8 => a8,
          a9 => a9,
          a17 => a17,
          a21 => a21,
          clk_out => clk_out,
          ipl => ipl,
          oe => oe,
          rom_evn_cs => rom_evn_cs,
          rom_odd_cs => rom_odd_cs,
          ram_evn_cs => ram_evn_cs,
          ram_odd_cs => ram_odd_cs,
          berr => berr,
          duart_cs => duart_cs,
          dtack_out => dtack_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 125 ns;
		clk <= '1';
		wait for 125 ns;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 100ms;	

      -- Validate that CS also handles DTACK
      a21 <= '1';
      a17 <= '1';
      uds <= '0';
      for i in 1 to 10 loop
        as <= '0';
        wait for 20 ms;
        as <= '1';
        wait for 20 ms;
      end loop;
		
      wait;
   end process;

END;
