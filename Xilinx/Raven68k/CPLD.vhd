----------------------------------------------------------------------------------
-- Company: Shiny Things Inc
-- Engineer: Jani Kuituniemi
-- 
-- Create Date:    22:13:30 01/18/2018 
-- Design Name:    Raven68k CPLD
-- Module Name:    CPLD - RTL 
-- Project Name:   Raven68k
-- Target Devices: XC9572XL
-- Tool versions: 
-- Description: System control signal and memory I/O decoding logic.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity CPLD is
  port(
		-- CPU Control signals
		dtack: inout std_logic;
		rw: in std_logic;
		as: in std_logic;
		uds: in std_logic;
		lds: in std_logic;
		fc0: in std_logic;
		fc1: in std_logic;
		fc2: in std_logic;
		ipl0: out std_logic;
		ipl1: out std_logic;
		ipl2: out std_logic;
		oe: out std_logic;
		-- Memory control signals
		romsel: out std_logic;
		ramsel: out std_logic;
		rssel: out std_logic;
		rtcsel: out std_logic;
		irq_ack: out std_logic;
		-- Address signals
		addr: in std_logic_vector(23 downto 5);
		-- I/O Interrupts..
		rsirq: in std_logic;
		rtcirq: in std_logic
  );
end CPLD;

architecture rtl of CPLD is

-- Some internal signals used
signal is_irq: std_logic := '0';
signal is_memory: std_logic := '0';
signal a0: std_logic := '0'; -- Unused currently!

begin
	process(dtack,rw,as,fc0,fc1,fc2,uds,lds,addr,is_irq,is_memory,rsirq,rtcirq)
	begin
		-- Init the chip selection signals
		romsel <= '0';
		ramsel <= '0';
		rssel <= '0';
		rtcsel <= '0';

		-- Init the CPU control signals
		dtack <= '0';
		ipl0 <= '0';
		ipl2 <= '1'; -- Always set to '1' in our case
		
		-- Handle IRQs..
		irq_ack <= fc0 OR fc1 OR fc2;
		is_irq <= rsirq OR rtcirq;
		-- Handle 68681 DUART IRQ
		if rsirq = '1' then
			ipl0 <= '0'; -- IRQ level 1
			ipl1 <= '1';
		end if;
		-- Handle DS1501Y RTC IRQ
		if rtcirq = '1' then
			ipl0 <= '1'; -- IRQ level 2
			ipl1 <= '0';
		end if;
		
		-- Handle R/W
		oe <= not rw;
		
		-- Determine, if we're accessing memory..
		if as = '1' AND (lds = '1' OR uds ='1') then
			is_memory <= '1';
		end if;
		
		-- IF we're accessing memory, set DTACK
		if is_memory = '1' then
			dtack <= '1';
		end if;
		-- Handle a0. LDS and UDS are virtual a0
		-- One or both are set for a0 depending 
		-- on whether it is a byte or word size 
		-- memory operation. Not currently used!
		a0 <= lds OR uds;
		
		-- Do initial memory decoding between RAM/ROM/IO
		if is_memory = '1' then
			case addr(23 downto 16) is
				when "00000000" =>
					romsel <= '1';
				when "00000001" =>
						case addr(16 downto 15) is
						  when "10" =>
							 -- Is I/O area ->
							 case addr(6 downto 5) is
								when "00" =>
									rssel <= '1';
								when "01" =>
									if lds = '1' then
										rtcsel <= '1';
									end if;
								when others => null;
							 end case;
							when others => null;
				   end case;
			when others =>
				ramsel <= '1';
			end case;
		end if;
		
	end process;

end architecture rtl;

