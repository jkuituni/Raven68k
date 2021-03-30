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
		rw: in std_logic;
		ah: in std_logic_vector(23 downto 20);
		al: in std_logic_vector(3 downto 1);
		lds: in std_logic;
		uds: in std_logic;
		dtack: out std_logic;
		duart_dtack: in std_logic;
		we: out std_logic;
		oe: out std_logic;
		duart_iack: out std_logic;
		reset: in std_logic;
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
	shared variable rom_overlay : std_logic := '0';
begin
	-- Handle ROM overlay at bottom of the memory at reset
	process (reset, as)
		variable as_cnt : integer range 0 to 8 := 0;
	begin
		if reset = '0' then
			-- In Reset -> Init count and set ROM overlay
			as_cnt := 0;
			rom_overlay := '1';
		else
			-- Nopt in Reset but ROM overlay still needed?
			if rom_overlay = '1' and rising_edge(as) then
				if as_cnt < 4 then
					--  Yes and not yet 8 clocks -> keep counting..
					as_cnt := as_cnt + 1;
				else
					-- Yes and count reached -> Clear ROM overlay flag.
					rom_overlay := '0';
				end if;
			end if;
		end if;
	end process;

	process(as, ah, uds, lds, rw, duart_dtack)
		variable mem_dtack : std_logic := '0';
	begin
		-- Init the chip selects by default to '1'
		rom_uce <= '1';
		rom_lce <= '1';
		ram_uce <= '1';
		ram_lce <= '1';
		duart_ce <= '1';
		rtc_ce <= '1';
		mem_dtack := '0';

		-- Do the memory map decoding..
		if as = '0' then
			case ah(23 downto 20) is
				when "0000" =>
					if rom_overlay = '1' then
						-- We're at RESET -> This is ROM
						if lds = '0' then
							rom_lce <= '0';
						end if;
						if uds = '0' then
							rom_uce <= '0';
					else
						-- We're post RESET -> This is RAM
						if lds = '0' then
							ram_lce <= '0';
						end if;
						if uds = '0' then
							ram_uce <= '0';
						end if;
					end if;
					-- Set flag for memory op
					mem_dtack := '1';
					end if;
				when "0001" =>
					if lds = '0' then
						ram_lce <= '0';
					end if;
					if uds = '0' then
						ram_uce <= '0';
					end if;
					-- Set flag for memory op
					mem_dtack := '1';
				when "0010" =>
					-- DUART is byte wide only and at low byte
					if lds = '0' and uds = '1' then
						duart_ce <= '0';
					end if;
				when "0011" =>
					-- RTC is byte wide only and at low byte
					if lds = '0' and uds = '1' then
						rtc_ce <= '0';
					end if;
				when "1111" =>
					-- ROM at top of memory
						if lds = '0' then
							rom_lce <= '0';
						end if;
						if uds = '0' then
							rom_uce <= '0';
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
