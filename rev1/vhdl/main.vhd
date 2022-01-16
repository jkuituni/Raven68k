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
		rtc_ce: out std_logic;
		ide_ce: out std_logic
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
			-- Not in Reset but ROM overlay still needed
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

	process(as, ah, uds, lds, duart_dtack)
		variable mem_dtack : std_logic;
		variable tmp_rom_uce : std_logic;
		variable tmp_rom_lce : std_logic;
		variable tmp_ram_uce : std_logic;
		variable tmp_ram_lce : std_logic;
		variable tmp_duart_ce : std_logic;
		variable tmp_rtc_ce: std_logic;
		variable tmp_ide_ce: std_logic;
	begin
		-- Init the chip selects by default to '1'
		tmp_rom_uce := '1';
		tmp_rom_lce := '1';
		tmp_ram_uce := '1';
		tmp_ram_lce := '1';
		tmp_duart_ce := '1';
		tmp_rtc_ce := '1';
		tmp_ide_ce := '1';
		mem_dtack := '0';

		-- Do the memory map decoding..
		if as = '0' then
			case ah(23 downto 20) is
				when "0000" =>
					-- SRAM from $000000-$0FFFFF
					-- Also for first 4 clocks, ROM
					if rom_overlay = '1' then
						-- We're at RESET -> This is ROM
						if lds = '0' then
							tmp_rom_lce := '0';
						end if;
						if uds = '0' then
							tmp_rom_uce := '0';
						end if;
					else
						-- We're post RESET -> This is RAM
						if lds = '0' then
							tmp_ram_lce := '0';
						end if;
						if uds = '0' then
							tmp_ram_uce := '0';
						end if;
					end if;
					-- Set flag for memory op
					mem_dtack := '1';
				when "0001" =>
					-- SRAM from $100000-$1FFFFF
					if lds = '0' then
						tmp_ram_lce := '0';
					end if;
					if uds = '0' then
						tmp_ram_uce := '0';
					end if;
					-- Set flag for memory op
					mem_dtack := '1';
				when "0010" =>
					-- DUART from $200000-$2FFFFF
					-- DUART is byte wide only and at low byte
					if lds = '0' then
						tmp_duart_ce := '0';
					end if;
				when "0011" =>
					-- RTC from $300000-$3FFFFF
					-- RTC is byte wide only and at low byte
					if lds = '0' then
						tmp_rtc_ce := '0';
					end if;
				when "0100" =>
					-- IDE from $400000-$4FFFFF
					-- IDE is word wide with only one chip select
						if lds = '0' or uds = '0' then
							tmp_ide_ce := '0';
						end if;					
				when "1111" =>
					-- ROM from $F00000-$FFFFFF
					-- ROM at top of memory
						if lds = '0' then
							tmp_rom_lce := '0';
						end if;
						if uds = '0' then
							tmp_rom_uce := '0';
						end if;
				when others => null;
			end case;
		end if;
		-- Set output from temp variables
		rom_uce <= tmp_rom_uce;
		rom_lce <= tmp_rom_lce;
		ram_uce <= tmp_ram_uce;
		ram_lce <= tmp_ram_lce;
		duart_ce <= tmp_duart_ce;
		rtc_ce <= tmp_rtc_ce;
		ide_ce <= tmp_ide_ce;
		-- Handle DTACK generation..
		if mem_dtack = '0' then
			dtack <= duart_dtack;
		else
			dtack <= not mem_dtack;
		end if;
	end process;

 process(rw)
 begin
     we <= rw;
	  oe <= not rw;
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
