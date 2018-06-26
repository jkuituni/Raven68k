`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    12:29:19 06/22/2018
// Design Name:
// Module Name:    main
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module main (
	input clk_in,
	input reset,
	input duart_irq,
	input a7,
	input a8,
	input a9,
	input a17,
	input a21,
	input as,
	input lds,
	input uds,
	input e,
	output clk_out,
	output clk_oe,
	output ipl0,
	output ipl1,
	output ipl2,
	output ram_evn_cs,
	output ram_odd_cs,
	output rom_evn_cs,
	output rom_odd_cs,
	output duart_cs,
	output mem_decode_oe,
	output berr
	);

	inout clk;
	assign clk = clk_oe ? clk_out : 1'bZ;

	inout ram_cs_even;
	assign ram_cs_even 	= mem_decode_oe ? ram_evn_cs : 1'bZ;
	inout ram_ocs_odd;
	assign ram_cs_odd 	= mem_decode_oe ? ram_odd_cs : 1'bZ;
	inout rom_cs_even;
	assign rom_cs_even 	= mem_decode_oe ? rom_evn_cs : 1'bZ;
	inout rom_ocs_odd;
	assign rom_cs_odd 	= mem_decode_oe ? rom_odd_cs : 1'bZ;
	inout cs_duart;
	assign cs_duart 		= mem_decode_oe ? duart_cs : 1'bZ;


	clock clock_module (
    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk_out),
		.clk_oe(clk_oe)
    );

	irq irq_module (
		.clk				( clk ),
		.reset			( reset ),
    .duart_irq	( duart_irq ),
    .ipl0				( ipl0 ),
    .ipl1				( ipl1 ),
    .ipl2				( ipl2 )
		);

		bus_err bus_err_module (
			.as 		( as ),
			.e 			( e ),
			.berr 	( berr )
			);

	mem_decoder mem_decoder_module (
		.reset					( reset ),
    .a7							( a7 ),
    .a8							( a8 ),
    .a9							( a9 ),
    .a17						( a17 ),
    .a21						( a21 ),
    .as							( as ),
    .lds						( lds ),
    .uds						( uds ),
    .ram_evn_cs			( ram_evn_cs ),
    .ram_odd_cs			( ram_odd_cs ),
    .rom_evn_cs			( rom_evn_cs ),
    .rom_odd_cs			( rom_odd_cs ),
    .duart_cs				( duart_cs ),
		.mem_decode_oe	( mem_decode_oe )
		);

endmodule
