----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:49:29 06/29/2018 
-- Design Name: 
-- Module Name:    cpld - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpld is
    Port ( clk : in  STD_LOGIC;
			  clk_out : out  STD_LOGIC;
			  duart_dtack : in  STD_LOGIC;
			  duart_irq : in  STD_LOGIC;
           rw : in  STD_LOGIC;
           as : in  STD_LOGIC;
           lds : in  STD_LOGIC;
           uds : in  STD_LOGIC;
           -- fc0 : in  STD_LOGIC;
           -- fc1 : in  STD_LOGIC;
           -- fc2 : in  STD_LOGIC;
			  e : in  STD_LOGIC;
			  a7 : in  STD_LOGIC;
			  a8 : in  STD_LOGIC;
			  a9 : in  STD_LOGIC;
			  a17 : in  STD_LOGIC;
			  a21 : in  STD_LOGIC;
			  ipl : out STD_LOGIC_VECTOR(2 downto 0);
           oe : out  STD_LOGIC;
			  rom_evn_cs : inout  STD_LOGIC;
			  rom_odd_cs : inout  STD_LOGIC;
			  ram_evn_cs : inout  STD_LOGIC;
			  ram_odd_cs : inout  STD_LOGIC;
			  berr : out  STD_LOGIC;
			  duart_cs : out  STD_LOGIC;
			  dtack_out : out  STD_LOGIC
			);
end cpld;

architecture Behavioral of cpld is

	-- internal signals
	signal decoder_duart_cs : STD_LOGIC;
	signal decoder_rom_evn_cs : STD_LOGIC;
	signal decoder_rom_odd_cs : STD_LOGIC;
	signal decoder_ram_evn_cs : STD_LOGIC;
	signal decoder_ram_odd_cs : STD_LOGIC;
	
begin

	-- instantiate modules
	
	IRQ : entity irq PORT MAP(
		duart_irq => duart_irq,
		ipl => ipl
	);
		
	BUS_ERR : entity bus_error PORT MAP(
		e => e,
		as => as,
		berr => berr
	);
	
	MEM_DECODER: entity mem_decoder PORT MAP(
		as => as,
		lds => lds,
		uds => uds,
		a7 => a7,
		a8 => a8,
		a9 => a9,
		a17 => a17,
		a21 => a21,
		duart_cs => decoder_duart_cs,
		rom_evn_cs => decoder_rom_evn_cs,
		rom_odd_cs => decoder_rom_odd_cs,
		ram_evn_cs => decoder_ram_evn_cs,
		ram_odd_cs => decoder_ram_odd_cs
	);
	
	DTACK: entity dtack PORT MAP(
		duart_dtack => duart_dtack,
		ram_evn_cs => decoder_ram_evn_cs,
		ram_odd_cs => decoder_ram_odd_cs,
		rom_evn_cs => decoder_rom_evn_cs,
		rom_odd_cs => decoder_rom_odd_cs,
		duart_cs => decoder_duart_cs,
		dtack => dtack_out
	);
	
	process (rw, clk, decoder_duart_cs, decoder_ram_evn_cs, decoder_ram_odd_cs, 
				decoder_rom_evn_cs, decoder_rom_odd_cs)
	begin
		
		-- always set
		oe <= not rw;
		clk_out <= not clk;
		
		duart_cs <= decoder_duart_cs;
		ram_odd_cs <= decoder_ram_odd_cs;
		ram_evn_cs <= decoder_ram_evn_cs;
		rom_odd_cs <= decoder_rom_odd_cs;
		rom_evn_cs <= decoder_rom_evn_cs;
		
		-- process reset
--		if reset = '0' then
--		 -- 
--		else
--		 
--		end if;
		
	end process;

end Behavioral;

