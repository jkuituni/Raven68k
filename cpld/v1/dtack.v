//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    09:54:08 06/22/2018
// Design Name:
// Module Name:    mem_decoder
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
module mem_decoder(
  input clk,
  input reset,
  input ram_evn_cs,
  input ram_odd_cs,
  input rom_evn_cs,
  input rom_odd_cs,
  input duart_cs,
  input duart_dtack,
  output reg dtack
  );

  reg [3:0] clk_count;
  localparam rom_max = 2;

  initial
    begin
      dtack <= 1'b1;
    end

  always @(posedge(clk) or negedge(reset))
    begin
      if (!duart_cs)
        dtack <= duart_dtack;
      else if (!ram_evn_cs || !ram_odd_cs)
        dtack <= 1'b1;
      else if (!rom_evn_cs || !rom_odd_cs)
        begin
          if (clk_count == rom_max-1)
            dtack <= 1'b1;
          else
            clk_count = clk_count + 1'b1;
        end
    end

    always @(posedge(ram_evn_cs), posedge(ram_odd_cs),
             posedge(rom_evn_cs), posedge(rom_odd_cs),
             posedge(duart_dtack), negedge(reset))
      begin
        dtack <= 1'b1;
        clk_count <= 4'b0;
      end

endmodule
