----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:42 06/30/2018 
-- Design Name: 
-- Module Name:    bus_error - Behavioral 
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

entity bus_error is
    Port ( e : in  STD_LOGIC;
           as : in  STD_LOGIC;
           berr : out  STD_LOGIC);
end bus_error;

architecture Behavioral of bus_error is

	-- internal signals
	signal berr_count : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
	process (e, as) is
	begin

		if rising_edge(e) then
			if as = '1' then
				berr <= '1';
				berr_count <= "0000";
			else
				if berr_count = "1010" then
					berr <= '0';
				else
					berr_count <= STD_LOGIC_VECTOR(unsigned(berr_count) + 1);
				end if;
			end if;
		end if;

	end process;

end Behavioral;

