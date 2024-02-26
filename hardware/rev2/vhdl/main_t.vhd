--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:46:25 01/16/2022
-- Design Name:   
-- Module Name:   /home/ccureau/git/Raven68k/rev1/xilinx/main_t.vhd
-- Project Name:  Raven68k
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY main_t IS
END main_t;
 
ARCHITECTURE behavior OF main_t IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         as : IN  std_logic;
         fc : IN  std_logic_vector(2 downto 0);
         rw : IN  std_logic;
         ah : IN  std_logic_vector(23 downto 20);
         al : IN  std_logic_vector(3 downto 1);
         lds : IN  std_logic;
         uds : IN  std_logic;
         dtack : OUT  std_logic;
         duart_dtack : IN  std_logic;
         we : OUT  std_logic;
         oe : OUT  std_logic;
         duart_iack : OUT  std_logic;
         reset : IN  std_logic;
         rom_uce : OUT  std_logic;
         rom_lce : OUT  std_logic;
         ram_uce : OUT  std_logic;
         ram_lce : OUT  std_logic;
         duart_ce : OUT  std_logic;
         rtc_ce : OUT  std_logic;
         ide_ce : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal as : std_logic := '0';
   signal fc : std_logic_vector(2 downto 0) := (others => '0');
   signal rw : std_logic := '0';
   signal ah : std_logic_vector(23 downto 20) := (others => '0');
   signal al : std_logic_vector(3 downto 1) := (others => '0');
   signal lds : std_logic := '0';
   signal uds : std_logic := '0';
   signal duart_dtack : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal dtack : std_logic;
   signal we : std_logic;
   signal oe : std_logic;
   signal duart_iack : std_logic;
   signal rom_uce : std_logic;
   signal rom_lce : std_logic;
   signal ram_uce : std_logic;
   signal ram_lce : std_logic;
   signal duart_ce : std_logic;
   signal rtc_ce : std_logic;
   signal ide_ce : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          as => as,
          fc => fc,
          rw => rw,
          ah => ah,
          al => al,
          lds => lds,
          uds => uds,
          dtack => dtack,
          duart_dtack => duart_dtack,
          we => we,
          oe => oe,
          duart_iack => duart_iack,
          reset => reset,
          rom_uce => rom_uce,
          rom_lce => rom_lce,
          ram_uce => ram_uce,
          ram_lce => ram_lce,
          duart_ce => duart_ce,
          rtc_ce => rtc_ce,
          ide_ce => ide_ce
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		reset <= '0' after 10ns, '1' after 20ns;
		duart_dtack <= '1' after 0ns, '0' after 70ns, '1' after 72ns, '0' after 74ns,
							'1' after 76ns;
		as <= '1' after 20ns, '0' after 22ns, '1' after 24ns, '0' after 26ns,
				'1' after 28ns, '0' after 30ns, '1' after 32ns, '0' after 34ns,
				'1' after 36ns, '0' after 38ns, '1' after 40ns, '0' after 42ns,
				'1' after 44ns, '0' after 46ns, '1' after 48ns, '0' after 50ns,
				'1' after 52ns, '0' after 62ns, '1' after 64ns, '0' after 66ns,
				'1' after 68ns, '0' after 70ns, '1' after 72ns, '0' after 74ns,
				'1' after 76ns;
		ah <= "0000", "0010" after 60ns;
		
      wait;
   end process;

END;
