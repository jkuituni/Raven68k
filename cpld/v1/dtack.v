//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    09:54:08 06/22/2018
// Design Name:
// Module Name:    dtack
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
module dtack(
  input clk,
  input reset,
  input ram_evn_cs,
  input ram_odd_cs,
  input rom_evn_cs,
  input rom_odd_cs,
  input duart_dtack,
  output reg dtack
  );

  reg [2:0] clk_count;
  localparam rom_max = 3;

  initial
    begin
      dtack <= 1'b1;
      clk_count <= 3'b000;
    end

  always @(posedge(clk) or negedge(reset))
    begin
      // Always reset if necessary
      if (ram_evn_cs && ram_odd_cs && rom_evn_cs && rom_odd_cs && duart_dtack)
        begin
          dtack <= 1'b1;
          clk_count <= 3'b000;
        end

      // Don't care about /CS signal for devices that provide their own /DTACK
      // Instead, do a XOR against the lot and set dtack accordingly
      if (!duart_dtack)
        dtack <= 1'b0;
      else if (!ram_evn_cs || !ram_odd_cs)
        dtack <= 1'b0;
      else if (!rom_evn_cs || !rom_odd_cs)
        begin
          if (clk_count == rom_max-1)
            dtack <= 1'b0;
          else
            clk_count = clk_count + 1'b1;
        end
    end

endmodule
