`timescale 1 ns/1 ps

module tb_clock();
  reg clk_in, reset;
  wire clk_out;
  inout clk_oe;

  inout clk;
  assign clk = clk_oe ? clk_out : 1'bz;

  initial begin
    clk_in = 0;
    reset = 1;

    // Wait 100 ns for global reset to finish
    # 100;
  end

  clock UUT (
    .clk_in     ( clk_in ),
    .reset      ( reset ),
    .clk_out    ( clk_out ),
    .clk_oe     ( clk_oe )
  );

  always begin
      clk_in = 1'b1;
      #20;
      clk_in = 1'b0;
      #20;
  end

  always @(posedge(clk)) begin
    $dumpfile ("clock.vcd");
    $dumpvars(0,UUT);
    # 2000;
    reset = 0;
    # 1000;
    reset = 1;
    # 2000;
    $finish;
  end

endmodule
