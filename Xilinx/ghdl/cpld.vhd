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
    Port (  reset : in  STD_LOGIC;
            dtack_in : in  STD_LOGIC;
            duart_irq : in  STD_LOGIC;
            rw : in  STD_LOGIC;
            as : in  STD_LOGIC;
            lds : in  STD_LOGIC;
            uds : in  STD_LOGIC;
            a17 : in  STD_LOGIC;
				    a21 : in  STD_LOGIC;
            oe : out  STD_LOGIC;
            rom_evn_cs : out  STD_LOGIC;
            rom_odd_cs : out  STD_LOGIC;
            ram_evn_cs : out  STD_LOGIC;
            ram_odd_cs : out  STD_LOGIC;
            duart_cs : out  STD_LOGIC;
            dtack_out : out  STD_LOGIC
      );
end cpld;

architecture Behavioral of cpld is

  -- internal signals
  signal as_count : std_logic_vector(3 downto 0) := "0000";
  signal rom_selected : boolean := false;
  signal ram_selected : boolean := false;

	function bool_to_logic(b : boolean) return STD_LOGIC is
	begin
		if (b) then
			return '1';
		else
			return '0';
		end if;
	end function bool_to_logic;

	function active_low(b : boolean) return STD_LOGIC is
	begin
		if (b) then
			return '0';
		else
			return '1';
		end if;
	end function active_low;

begin

  process (reset, as, a17, a21, uds, lds, as_count, rom_selected, ram_selected, dtack_in)
  begin
	if falling_edge(as) then
      if as_count < "1000" then
  		  as_count <= std_logic_vector(to_unsigned(to_integer(unsigned(as_count))+1,4));
      end if;
      -- RAM select
  		ram_evn_cs <= active_low(as_count = "1000" and a17 = '0' and a21 = '0' and uds = '1');
  		ram_odd_cs <= active_low(as_count = "1000" and a17 = '0' and a21 = '0' and lds = '1');
  		ram_selected <= (a17 = '0' and a21 = '0' and (uds = '1' or lds = '1'));

  		-- ROM select
      rom_evn_cs <= active_low(as_count < "1000" or (as = '0' and a17 = '1' and a21 = '0' and uds = '1'));
  		rom_odd_cs <= active_low(as_count < "1000" or (as = '0' and a17 = '1' and a21 = '0' and lds = '1'));
  		rom_selected <= (as_count < "1000" or (as = '0' and a17 = '1' and a21 = '0' and (uds = '1' or lds = '1')));

  		-- I/O devices
  		duart_cs <= active_low(as = '0' and as_count = "1000" and a17 = '1' and a21 = '1');

		-- DTACK
		dtack_out <= active_low(rom_selected = true or ram_selected = true or dtack_in = '0');
    end if;
  end process;

	process (reset, rw, dtack_in, as, rom_selected, ram_selected)
	begin

    if reset = '0' then
      oe <= '0';
    else
  		oe <= not rw;
    end if;

  end process;

end Behavioral;
