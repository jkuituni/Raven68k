`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    12:40:13 06/22/2018
// Design Name:
// Module Name:    irq
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
module irq(
    input clk,
    input reset,
    input duart_irq,
    output reg ipl0,
    output reg ipl1,
    output reg ipl2
    );

    // IRQ levels are coded so that the highest priority interrupt gains
    // the CPUs full attention.  If multiple interrupts come in, the highest
    // priority gets reported.  Once cleared, the next highest priority gets
    // reported, ad nauseam.
    //
  	// Interrupt levels:
  	// 7 (NMI): Unassigned
  	// 6      : Unassigned
  	// 5      : DUART
  	// 4      : Unassigned
  	// 3      : Unassigned
  	// 2      : Unassigned
  	// 1      : Unassigned
  	// 0      : No interrupt

	reg [2:0] r_ipl;

	initial begin
		ipl0  <= 1'b0;
		ipl1  <= 1'b0;
		ipl2  <= 1'b0;
		r_ipl <= 3'b000;
	end

	always @(posedge(clk) or reset) begin
		r_ipl <= 3'b000;
    if (~reset) begin
      ipl0  <= 1'b0;
  		ipl1  <= 1'b0;
  		ipl2  <= 1'b0;
    end
		else begin
      if (~duart_irq)
  			r_ipl = r_ipl + 5;			// add 5
  		ipl0 <= r_ipl[0];
  		ipl1 <= r_ipl[1];
  		ipl2 <= r_ipl[2];
    end
	end

endmodule
