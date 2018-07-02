----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:51 06/30/2018 
-- Design Name: 
-- Module Name:    irq - Behavioral 
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

entity irq is
    Port ( duart_irq : in  STD_LOGIC;
           ipl : out STD_LOGIC_VECTOR(2 downto 0));
end irq;

architecture Behavioral of irq is

	-- internal signals
	signal t_irq : STD_LOGIC_VECTOR(2 downto 0) := "000";
	
begin
	process (duart_irq)
	begin
	
		-- initial state
		t_irq <= "000";
		
		-- only duart has an IRQ at the moment
		if duart_irq = '1' then
			t_irq <= "000";
		elsif duart_irq = '0' then
			t_irq <= "100"; 						-- IRQ 5
		end if;
		ipl <= t_irq;
		
	end process;

end Behavioral;

