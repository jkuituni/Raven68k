--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:26:56 07/02/2018
-- Design Name:   
-- Module Name:   C:/Users/Chris/git/Raven68k/Xilinx/Raven68k/tb_mem_decoder.vhd
-- Project Name:  cpld
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_decoder
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
 
ENTITY tb_mem_decoder IS
END tb_mem_decoder;
 
ARCHITECTURE behavior OF tb_mem_decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem_decoder
    PORT(
         as : IN  std_logic;
         lds : IN  std_logic;
         uds : IN  std_logic;
         a7 : IN  std_logic;
         a8 : IN  std_logic;
         a9 : IN  std_logic;
         a17 : IN  std_logic;
         a21 : IN  std_logic;
         duart_cs : OUT  std_logic;
         rom_evn_cs : OUT  std_logic;
         rom_odd_cs : OUT  std_logic;
         ram_evn_cs : OUT  std_logic;
         ram_odd_cs : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal as : std_logic := '0';
   signal lds : std_logic := '0';
   signal uds : std_logic := '0';
   signal a7 : std_logic := '0';
   signal a8 : std_logic := '0';
   signal a9 : std_logic := '0';
   signal a17 : std_logic := '0';
   signal a21 : std_logic := '0';

 	--Outputs
   signal duart_cs : std_logic;
   signal rom_evn_cs : std_logic;
   signal rom_odd_cs : std_logic;
   signal ram_evn_cs : std_logic;
   signal ram_odd_cs : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mem_decoder PORT MAP (
          as => as,
          lds => lds,
          uds => uds,
          a7 => a7,
          a8 => a8,
          a9 => a9,
          a17 => a17,
          a21 => a21,
          duart_cs => duart_cs,
          rom_evn_cs => rom_evn_cs,
          rom_odd_cs => rom_odd_cs,
          ram_evn_cs => ram_evn_cs,
          ram_odd_cs => ram_odd_cs
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period := 1ns;
 
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 100ms;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
