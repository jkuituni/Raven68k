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
         reset : in  STD_LOGIC;
         dtack_in : in  STD_LOGIC;
         duart_irq : in  STD_LOGIC;
         rw : in  STD_LOGIC;
         as : in  STD_LOGIC;
         lds : in  STD_LOGIC;
         uds : in  STD_LOGIC;
         a17 : in  STD_LOGIC;
         a21 : in  STD_LOGIC;
         ipl : out STD_LOGIC_VECTOR(2 downto 0);
         oe : out  STD_LOGIC;
         rom_evn_cs : out  STD_LOGIC;
         rom_odd_cs : out  STD_LOGIC;
         ram_evn_cs : out  STD_LOGIC;
         ram_odd_cs : out  STD_LOGIC;
         duart_cs : out  STD_LOGIC;
         dtack_out : out  STD_LOGIC
        );
    END COMPONENT;


   --Inputs
   signal dtack_in : std_logic := '1';
   signal duart_irq : std_logic := '1';
   signal rw : std_logic := '1';
   signal as : std_logic := '1';
   signal lds : std_logic := '1';
   signal uds : std_logic := '1';
   signal a17 : std_logic := '0';
   signal a21 : std_logic := '0';
   signal reset : std_logic := '1';

   --Outputs
   signal ipl : std_logic_vector(2 downto 0);
   signal oe : std_logic;
   signal duart_cs : std_logic;
   signal dtack_out : std_logic;
   signal ram_evn_cs : std_logic;
   signal ram_odd_cs : std_logic;
   signal rom_evn_cs : std_logic;
   signal rom_odd_cs : std_logic;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
   uut: cpld PORT MAP (
          reset => reset,
          dtack_in => dtack_in,
          duart_irq => duart_irq,
          rw => rw,
          as => as,
          lds => lds,
          uds => uds,
          a17 => a17,
          a21 => a21,
          ipl => ipl,
          oe => oe,
          rom_evn_cs => rom_evn_cs,
          rom_odd_cs => rom_odd_cs,
          ram_evn_cs => ram_evn_cs,
          ram_odd_cs => ram_odd_cs,
          duart_cs => duart_cs,
          dtack_out => dtack_out
        );

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100ms.
      wait for 100 ms;

      -- Validate that changing RW also changes OE
      rw <= '0';
      wait for 25 ms;
      rw <= '1';
      wait for 25 ms;
      rw <= '0';
      wait for 50 ms;

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
      wait for 50 ms;

      wait;
   end process;

END;
