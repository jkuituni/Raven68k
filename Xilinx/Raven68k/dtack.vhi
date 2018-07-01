
-- VHDL Instantiation Created from source file dtack.vhd -- 19:42:55 06/30/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT dtack
	PORT(
		duart_dtack : IN std_logic;
		ram_evn_cs : IN std_logic;
		ram_odd_cs : IN std_logic;
		rom_evn_cs : IN std_logic;
		rom_odd_cs : IN std_logic;
		duart_cs : IN std_logic;          
		dtack : OUT std_logic
		);
	END COMPONENT;

	Inst_dtack: dtack PORT MAP(
		duart_dtack => ,
		ram_evn_cs => ,
		ram_odd_cs => ,
		rom_evn_cs => ,
		rom_odd_cs => ,
		duart_cs => ,
		dtack => 
	);


