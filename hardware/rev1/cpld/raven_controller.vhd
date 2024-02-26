----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:02:55 01/22/2022 
-- Design Name: 
-- Module Name:    raven_controller - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity raven_controller is
  port (
                -- Control signals..
                as: in std_logic;
					 fc0: in std_logic;
					 fc1: in std_logic;
					 fc2: in std_logic;
                rw: in std_logic;
					 a1: in std_logic;
					 a2: in std_logic;
					 a3: in std_logic;
					 a20: in std_logic;
					 a21: in std_logic;
					 a22: in std_logic;
					 a23: in std_logic;
                lds: in std_logic;
                uds: in std_logic;
                dtack: out std_logic;
                duart_dtack: in std_logic;
                we: out std_logic;
                oe: out std_logic;
                duart_iack: out std_logic;
                reset: in std_logic;
					 clk_in: in std_logic;
					 clk_out: out std_logic;
                -- Chip selects
                rom_uce: out std_logic;
                rom_lce: out std_logic;
                ram_uce: out std_logic;
                ram_lce: out std_logic;
                duart_ce: out std_logic;
                rtc_ce: out std_logic;
                ide_ce: out std_logic
  );
end raven_controller;

architecture Behavioral of raven_controller is
	
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
	
	process (clk_in)
		variable tmp : std_logic := '0';
		variable count : integer := 1;
	begin
		if (clk_in'event and clk_in = '1') then
			count := count + 1;
			if (count = 5) then -- 25MHz / 5 = 5MHz
				tmp := not tmp;
				count := 1;
			end if;
		end if;
		clk_out <= tmp;
	end process;

	process(reset, as, duart_dtack, rw, a1, a2, a3, a20, a21, a22, a21, a23, fc0, fc1, fc2, uds, lds)
	begin
		if reset = '0' or as = '1' then
			ram_uce <= '1';
			ram_lce <= '1';
			rom_uce <= '1';
			rom_lce <= '1';
			duart_ce <= '1';
			rtc_ce <= '1';
			ide_ce <= '1';
			dtack <= '1';
			duart_iack <= '1';
			
		else 
			ram_uce <= not(not as and not a23 and not a22 and not a21 and not a20 and not rom_overlay and not uds);
			ram_lce <= not(not as and not a23 and not a22 and not a21 and not a20 and not rom_overlay and not lds);
			rom_uce <= not((not as and not a23 and not a22 and not a21 and not a20 and rom_overlay and not uds) or (a23 and a22 and a21 and a20 and not uds));
			rom_lce <= not((not as and not a23 and not a22 and not a21 and not a20 and rom_overlay and not lds) or (a23 and a22 and a21 and a20 and not lds));
			duart_ce <= not(not as and not a23 and not a22 and a21 and not a20 and not lds);
			rtc_ce <= not(not as and not a23 and not a22 and a21 and a20 and not lds);
			ide_ce <= not(not as and not a23 and a22 and not a21 and not a20 and ((not uds) or (not lds)));
			
			dtack <= not(
				-- ram
				(not as and not a23 and not a22 and not a21 and not a20 and ((not uds) or (not lds)))
				-- rom
				or (not as and a23 and a22 and a21 and a20 and ((not uds) or (not lds)))
				-- rtc
				or (not as and not a23 and not a22 and a21 and a20 and (not lds))
				-- ide
				or (not as and not a23 and a22 and not a21 and not a20 and ((not uds) or (not lds)))
				-- duart
				or (not as and not a23 and not a22 and a21 and not a20 and not duart_dtack)
			);
			
			duart_iack <= not(not as and fc0 and fc1 and fc2 and not a3 and not a2 and a1);
		end if;
		we <= rw;
		oe <= not rw;
		

	end process;
end Behavioral;

