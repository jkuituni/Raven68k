`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    09:54:08 06/22/2018
// Design Name:
// Module Name:    clock
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
module clock (
    input clk_in,
    input reset,
    output reg clk_out,
    output reg oe
    );

	localparam sys_clk = 50000000;			// 50MHz clock
  localparam div_clk = 5000000;       // 5MHz desired clock
  localparam max = sys_clk / (2*div_clk);
	reg [4:0] count;

  initial begin
    clk_out <= 0;
    count <= 4'd0;
    oe <= 1'b0;
  end

  always @(posedge(clk_in), negedge(reset))
	begin
		if (!reset) begin
      clk_out <= 0;
			count <= 4'd0;
	  end else if (count == max-1) begin
			count = 4'd0;
      oe = 1'd1;
      clk_out <= ~clk_out;
      oe = 1'd0;
		end else begin
			count = count + 1'd1;
    end
	end

endmodule
