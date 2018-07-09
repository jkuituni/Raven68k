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
            ipl : out STD_LOGIC_VECTOR(2 downto 0);
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
  signal as_count : integer := 0;

begin

  process (rw, as, a17, a21, dtack_in)
    variable rom_selected : boolean := false;
    variable ram_selected : boolean := false;
  begin
    if reset = '0' then
     ipl <= "000";
     oe <= '1';
     duart_cs <= '1';
     dtack_out <= '1';
     ram_evn_cs <= '1';
     ram_odd_cs <= '1';
     rom_evn_cs <= '1';
     rom_odd_cs <= '1';
     as_count <= 0;
     rom_selected := false;
     ram_selected := false;
    else

      -- always set
      oe <= not rw;

      if as = '1' then
        duart_cs <= '1';
        ram_evn_cs <= '1';
        ram_odd_cs <= '1';
        rom_evn_cs <= '1';
        rom_odd_cs <= '1';
        dtack_out <= '1';
        rom_selected := false;
        ram_selected := false;
      end if;

      if as = '0' then
        report "as = 0";
        if as_count < 8 then
          rom_selected := true;
          rom_evn_cs <= '0';
          rom_odd_cs <= '0';
          as_count <= as_count + 1;
        else
          if a21 = '1' then
  					if a17 = '1' then					-- I/O devices
  						duart_cs <= '0';
  					else
  						if uds = '0' then				-- ROM access
  							rom_evn_cs <= '0';
  						end if;
  						if lds = '0' then
  							rom_odd_cs <= '0';
  						end if;
  					end if;
  				else										-- RAM access
  					if uds = '0' then
  						ram_evn_cs <= '0';
  					end if;
  					if lds = '0' then
  						ram_odd_cs <= '0';
  					end if;
  				end if;
        end if;
      end if;

      if dtack_in = '1' and rom_selected = false and ram_selected = false then
        dtack_out <= '1';
      end if;

      if dtack_in = '0' then
        dtack_out <= dtack_in;
      end if;

      if ram_selected = true or rom_selected = true then
        dtack_out <= '0';
      end if;

    end if;
  end process;

end Behavioral;
