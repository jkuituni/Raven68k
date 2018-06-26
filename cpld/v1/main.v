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
	input clk_out
	);

	inout clk;
	assign clk = (!clk_oe) ? clk_out : 1'bZ;


	clock clock_module (
    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk_out),
		.oe(clk_oe)
    );

	always @(clk)
	  begin
			//
		end

endmodule
