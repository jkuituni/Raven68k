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
module main(
	input duart_irq,
	input clk_in,
	input reset,
	output ipl0,
	output ipl1,
	output ipl2,
	output clk_out
	);

	irq irq_module (
    .duart_irq(duart_irq), 
    .ipl0(ipl0),
    .ipl1(ipl1),
    .ipl2(ipl2)
    );
	
	clock clock_module (
    .clk(clk_in), 
    .reset(reset), 
    .clk_div(clk_out)
    );

endmodule

