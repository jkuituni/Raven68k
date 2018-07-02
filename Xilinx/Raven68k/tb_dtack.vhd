--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:46:09 07/02/2018
-- Design Name:   
-- Module Name:   C:/Users/Chris/git/Raven68k/Xilinx/Raven68k/tb_dtack.vhd
-- Project Name:  cpld
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dtack
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
 
ENTITY tb_dtack IS
END tb_dtack;
 
ARCHITECTURE behavior OF tb_dtack IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dtack
    PORT(
         duart_dtack : IN  std_logic;
         ram_evn_cs : IN  std_logic;
         ram_odd_cs : IN  std_logic;
         rom_evn_cs : IN  std_logic;
         rom_odd_cs : IN  std_logic;
         duart_cs : IN  std_logic;
         dtack : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal duart_dtack : std_logic := '0';
   signal ram_evn_cs : std_logic := '0';
   signal ram_odd_cs : std_logic := '0';
   signal rom_evn_cs : std_logic := '0';
   signal rom_odd_cs : std_logic := '0';
   signal duart_cs : std_logic := '0';

 	--Outputs
   signal dtack : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dtack PORT MAP (
          duart_dtack => duart_dtack,
          ram_evn_cs => ram_evn_cs,
          ram_odd_cs => ram_odd_cs,
          rom_evn_cs => rom_evn_cs,
          rom_odd_cs => rom_odd_cs,
          duart_cs => duart_cs,
          dtack => dtack
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
