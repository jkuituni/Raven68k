
-- VHDL Instantiation Created from source file irq.vhd -- 15:01:57 06/30/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT irq
	PORT(
		duart_irq : IN std_logic;          
		ipl : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_irq: irq PORT MAP(
		duart_irq => ,
		ipl => 
	);


