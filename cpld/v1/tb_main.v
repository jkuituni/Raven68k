`timescale 1 ms/1 ms  // time-unit = 1 ns, precision = 1 ps

module tb_main();
  reg clk_in, reset;
  wire clk_out;

  initial begin
    reset = 1;
    clk_in = 0;

    // Wait 100 ns for global reset to finish
    # 100;
  end

  clock clock_module (
	  .clk_in(clk_in),
	  .reset(reset),
    .clk_out(clk_out)
    );

    always begin
        clk_in = 1'b1;
        # 1;
        clk_in = 1'b0;
        # 1;
    end

    always @(posedge(clk_in)) begin
      $dumpfile ("clock.vcd");
      $dumpvars(0,tb_clock);
      $display("clk_out");
      $monitor("  %d",clk_out);

      # 5000;
      $finish;
    end
endmodule
