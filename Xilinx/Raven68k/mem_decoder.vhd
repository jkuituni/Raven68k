----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:18 06/30/2018 
-- Design Name: 
-- Module Name:    mem_decoder - Behavioral 
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

entity mem_decoder is
	Port (  as : in  STD_LOGIC;
           lds : in  STD_LOGIC;
           uds : in  STD_LOGIC;
			  a7 : in  STD_LOGIC;
			  a8 : in  STD_LOGIC;
			  a9 : in  STD_LOGIC;
			  a17 : in  STD_LOGIC;
			  a21 : in  STD_LOGIC;
			  duart_cs : out  STD_LOGIC;
			  rom_evn_cs : out  STD_LOGIC;
			  rom_odd_cs : out  STD_LOGIC;
			  ram_evn_cs : out  STD_LOGIC;
			  ram_odd_cs : out  STD_LOGIC);
end mem_decoder;

architecture Behavioral of mem_decoder is

	-- internal signals
	signal as_count : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	
begin
	
	process (as)
	begin
		
		if as = '1' then
			if as_count < "1000" then
				rom_evn_cs <= '0';
				rom_odd_cs <= '0';
				as_count <= STD_LOGIC_VECTOR(unsigned(as_count) + 1);
			else
				if a21 = '1' then
					if a17 = '1' then					-- I/O devices
						duart_cs <= '0';
					else
						if uds = '0' then				-- ROM access
							rom_evn_cs <= '0';
						else
							rom_evn_cs <= '1';
						end if;
						if lds = '0' then
							rom_odd_cs <= '0';
						else
							rom_odd_cs <= '1';
						end if;
					end if;
				else										-- RAM access
					if uds = '0' then
						ram_evn_cs <= '0';
					else
						ram_evn_cs <= '1';
					end if;
					if lds = '0' then
						ram_odd_cs <= '0';
					else
						ram_odd_cs <= '1';
					end if;
				end if;
			end if;
		else
			ram_evn_cs <= '1';
			ram_odd_cs <= '1';
			rom_evn_cs <= '1';
			rom_odd_cs <= '1';
			duart_cs <= '1';		
		end if;

	end process;

end Behavioral;

