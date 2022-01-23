--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:59:43 01/22/2022
-- Design Name:   
-- Module Name:   /root/xilinx/raven/experiment1/raven_controller_t.vhd
-- Project Name:  experiment1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: raven_controller
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
 
ENTITY raven_controller_t IS
END raven_controller_t;
 
ARCHITECTURE behavior OF raven_controller_t IS 
 
	type in_vector is record
		a1, a2, a3, a20, a21, a22, a23, as, lds, uds, fc0, fc1, fc2,
		duart_dtack: std_logic;
	end record;
	
	type out_vector is record
		ram_lce, ram_uce, rom_lce, rom_uce, duart_ce, rtc_ce, ide_ce,
		dtack, duart_iack: std_logic;
	end record;
	
	type in_vector_array is array (natural range <>) of in_vector;
	type out_vector_array is array (natural range <>) of out_vector;
	
	constant inputs : in_vector_array := (
	--  a1   a2   a3   a20  a21  a22  a23  as   lds  uds  fc0  fc1  fc2  duart_dtack
		-- first four cycles of as should get to ROM
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		-- subsequent cycles should get to RAM
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		-- ram ucs
		('0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		-- ram lcs
		('0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),		
		-- rom ucs
		('0', '0', '0', '1', '1', '1', '1', '0', '1', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),		
		-- rom lcs
		('0', '0', '0', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		-- duart ucs (invalid)
		('0', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '1'),	
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),		
		-- duart lcs (no duart_dtack)
		('0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),				
		-- duart lcs (with duart_dtack)
		('0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		-- rtc ucs (invalid)
		('0', '0', '0', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		-- rtc lcs
		('0', '0', '0', '1', '1', '0', '0', '0', '1', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		-- ide ucs 
		('0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1'),
		-- ide lcs
		('0', '0', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '1')		
	);
	
	constant outputs: out_vector_array := (
	-- RAML RAMH ROML ROMH DUART RTC IDE  DTACK DUART_IACK
		-- rom init 
		('1', '1', '0', '0', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('1', '1', '0', '0', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('1', '1', '0', '0', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('1', '1', '0', '0', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		-- ram
		('0', '0', '1', '1', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('0', '0', '1', '1', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('0', '0', '1', '1', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('0', '0', '1', '1', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		-- ram ucs
		('1', '0', '1', '1', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),		
		-- ram lcs
		('0', '1', '1', '1', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),		
		-- rom ucs
		('1', '1', '1', '0', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),		
		-- rom lcs
		('1', '1', '0', '1', '1', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		-- duart ucs (invalid)
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),		
		-- duart lcs (without duart_dtack)
		('1', '1', '1', '1', '0', '1', '1', '1', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		-- duart lcs (with duart_dtack)
		('1', '1', '1', '1', '0', '1', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		-- rtc ucs (invalid)
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		-- rtc lcs
		('1', '1', '1', '1', '1', '0', '1', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		-- ide ucs
		('1', '1', '1', '1', '1', '1', '0', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1'),
		-- ide lcs
		('1', '1', '1', '1', '1', '1', '0', '0', '1'),
		('1', '1', '1', '1', '1', '1', '1', '1', '1')		
	);
	
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT raven_controller
    PORT(
         as : IN  std_logic;
         fc0 : IN  std_logic;
         fc1 : IN  std_logic;
         fc2 : IN  std_logic;
         rw : IN  std_logic;
         a1 : IN  std_logic;
         a2 : IN  std_logic;
         a3 : IN  std_logic;
         a20 : IN  std_logic;
         a21 : IN  std_logic;
         a22 : IN  std_logic;
         a23 : IN  std_logic;
         lds : IN  std_logic;
         uds : IN  std_logic;
         dtack : OUT  std_logic;
         duart_dtack : IN  std_logic;
         we : OUT  std_logic;
         oe : OUT  std_logic;
         duart_iack : OUT  std_logic;
         reset : IN  std_logic;
         clk_in : IN  std_logic;
         clk_out : OUT  std_logic;
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
   signal fc0 : std_logic := '0';
   signal fc1 : std_logic := '0';
   signal fc2 : std_logic := '0';
   signal rw : std_logic := '0';
   signal a1 : std_logic := '0';
   signal a2 : std_logic := '0';
   signal a3 : std_logic := '0';
   signal a20 : std_logic := '0';
   signal a21 : std_logic := '0';
   signal a22 : std_logic := '0';
   signal a23 : std_logic := '0';
   signal lds : std_logic := '0';
   signal uds : std_logic := '0';
   signal duart_dtack : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk_in : std_logic := '0';

 	--Outputs
   signal dtack : std_logic;
   signal we : std_logic;
   signal oe : std_logic;
   signal duart_iack : std_logic;
   signal clk_out : std_logic;
   signal rom_uce : std_logic;
   signal rom_lce : std_logic;
   signal ram_uce : std_logic;
   signal ram_lce : std_logic;
   signal duart_ce : std_logic;
   signal rtc_ce : std_logic;
   signal ide_ce : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: raven_controller PORT MAP (
          as => as,
          fc0 => fc0,
          fc1 => fc1,
          fc2 => fc2,
          rw => rw,
          a1 => a1,
          a2 => a2,
          a3 => a3,
          a20 => a20,
          a21 => a21,
          a22 => a22,
          a23 => a23,
          lds => lds,
          uds => uds,
          dtack => dtack,
          duart_dtack => duart_dtack,
          we => we,
          oe => oe,
          duart_iack => duart_iack,
          reset => reset,
          clk_in => clk_in,
          clk_out => clk_out,
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
		variable input : std_logic_vector(12 downto 0);
		variable expected_output : std_logic_vector(8 downto 0);
		variable i2 : integer;
   begin		
		reset <= '1';
		as <= '1';
		uds <= '1';
		lds <= '1';
	
		wait for 50 ns;
		
		for i in inputs'range loop
			a1 <= inputs(i).a1;
			a2 <= inputs(i).a2;
			a3 <= inputs(i).a3;
			a20 <= inputs(i).a20;
			a21 <= inputs(i).a21;
			a22 <= inputs(i).a22;
			a23 <= inputs(i).a23;
			as <= inputs(i).as;
			lds <= inputs(i).lds;
			uds <= inputs(i).uds;
			fc0 <= inputs(i).fc0;
			fc1 <= inputs(i).fc1;
			fc2 <= inputs(i).fc2;
			duart_dtack <= inputs(i).duart_dtack;
			
			wait for 50ns;
			
			assert (
				(ram_lce = outputs(i).ram_lce) and
				(ram_uce = outputs(i).ram_uce) and
				(rom_lce = outputs(i).rom_lce) and
				(rom_uce = outputs(i).rom_uce) and
				(duart_ce = outputs(i).duart_ce) and
				(rtc_ce = outputs(i).rtc_ce) and
				(ide_ce = outputs(i).ide_ce) and
				(dtack = outputs(i).dtack) and
				(duart_iack = outputs(i).duart_iack)
			) severity error;
		end loop;
		wait;
   end process;

END;
