----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:30 06/30/2018 
-- Design Name: 
-- Module Name:    dtack - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dtack is
    Port ( duart_dtack : in  STD_LOGIC;
           ram_evn_cs : in  STD_LOGIC;
           ram_odd_cs : in  STD_LOGIC;
           rom_evn_cs : in  STD_LOGIC;
           rom_odd_cs : in  STD_LOGIC;
			  duart_cs : in  STD_LOGIC;
           dtack : out  STD_LOGIC);
end dtack;

architecture Behavioral of dtack is

begin
	process (duart_dtack, duart_cs, ram_evn_cs, ram_odd_cs, rom_evn_cs, rom_odd_cs)
	begin
	
		-- initial state
		dtack <= '1';
		
		-- at 4MHz, one clock period is 250ns.
		-- we can ground DTACK (for now)
		-- At 6MHz or higher, ROM needs a clock or two

		if duart_cs = '0' then
			dtack <= duart_dtack;
		elsif (ram_evn_cs = '0' or ram_odd_cs = '0'
			or rom_evn_cs = '0' or rom_odd_cs = '0') then
				dtack <= '0';
		end if;	
	
	end process;

end Behavioral;

