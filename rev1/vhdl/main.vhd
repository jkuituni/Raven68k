----------------------------------------------------------------------------------
--
-- Raven 68K System CPLD Implementation
--
-- Handles the main glue logic tasks and some control signal 
-- generation:
--  
-- * CPU DTACK generation
-- * Address decoding
-- * Chip Select generation
-- * Low/Hi chip selects
-- * Interrupt IACK generation
--
-- Corresponds to the hardware revision 1.0 only!
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
  port (
		-- Control signals..
		as: in std_logic;
		fc: in std_logic_vector(2 downto 0);
		ipl: out std_logic_vector(2 downto 0);
		rw: in std_logic;
		ah: in std_logic_vector(23 downto 21);
		al: in std_logic_vector(3 downto 1);
		lds: in std_logic;
		uds: in std_logic;
		dtack: out std_logic;
		duart_dtack: in std_logic;
		we: out std_logic;
		oe: out std_logic;
		duart_iack: out std_logic;
		-- Chip selects
		rom_uce: out std_logic;
		rom_lce: out std_logic;
		ram_uce: out std_logic;
		ram_lce: out std_logic;
		duart_ce: out std_logic;
		rtc_ce: out std_logic
  );
end main;

architecture rtl of main is
	signal mem_dtack: std_logic;
begin
	process(as, ah, uds, lds, rw, duart_dtack)
	begin
		-- Init the chip selects by default to '1'
		rom_uce <= '1';
		rom_lce <= '1';
		ram_uce <= '1';
		ram_lce <= '1';
		duart_ce <= '1';
		rtc_ce <= '1';
		mem_dtack <= '0';

		-- Do the memory map decoding..
		if as = '0' then
			case ah(23 downto 21) is
				when "000" =>
					if lds = '0' then 
						rom_lce <= '0';
					end if;
					if uds = '0' then
						rom_uce <= '0';
					end if;
					-- Set flag for memory op
					mem_dtack <= '1';
				when "001" =>
					if lds = '0' then 
						ram_lce <= '0';
					end if;
					if uds = '0' then
						ram_uce <= '0';
					end if;
					-- Set flag for memory op
					mem_dtack <= '1';
				when "010" =>
					-- DUART is byte wide only and at low byte
					if lds = '0' and uds = '1' then
						duart_ce <= '0';
					end if;
				when "011" =>
					-- RTC is byte wide only and at low byte
					if lds = '0' and uds = '1' then
						rtc_ce <= '0';
					end if;
				when others => null;
			end case;
		end if;
		-- Handle DTACK generation..
		if mem_dtack = '0' then
			dtack <= duart_dtack;
		else
			dtack <= not mem_dtack;
		end if;
		-- Generate separate WE and OE
		if lds = '0' and uds = '0' then
			if rw = '1' then
				oe <= '0';
				we <= '1';
			else
				oe <= '1';
				we <= '0';
			end if;
		end if;
	end process;
 
 process(fc, al, as)
 begin
	-- Init the DUART IACK signal to '0'
	duart_iack <= '0';
	-- Handle IACK generation based on CPU FC-pins..
	if fc(2 downto 0) = "111" and as = '0' then
		case al(3 downto 1) is
			when "001" =>
				duart_iack <= '1';
			when others => null;
		end case;		
	end if;
 end process;
 
end rtl;

