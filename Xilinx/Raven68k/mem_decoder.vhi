
-- VHDL Instantiation Created from source file mem_decoder.vhd -- 19:39:06 06/30/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mem_decoder
	PORT(
		as : IN std_logic;
		lds : IN std_logic;
		uds : IN std_logic;
		a7 : IN std_logic;
		a8 : IN std_logic;
		a9 : IN std_logic;
		a17 : IN std_logic;
		a21 : IN std_logic;          
		duart_cs : OUT std_logic;
		rom_evn_cs : OUT std_logic;
		rom_odd_cs : OUT std_logic;
		ram_evn_cs : OUT std_logic;
		ram_odd_cs : OUT std_logic
		);
	END COMPONENT;

	Inst_mem_decoder: mem_decoder PORT MAP(
		as => ,
		lds => ,
		uds => ,
		a7 => ,
		a8 => ,
		a9 => ,
		a17 => ,
		a21 => ,
		duart_cs => ,
		rom_evn_cs => ,
		rom_odd_cs => ,
		ram_evn_cs => ,
		ram_odd_cs => 
	);


