`timescale 1 ns/1 ps  // time-unit = 1 ns, precision = 1 ps

module tb_main();
  reg clk, reset, clk_out;

  initial begin
    reset = 1;
    clk = 0;
    clk_out = 0;

    // Wait 100 ns for global reset to finish
    # 100;
  end

  main UUT (
    .clk_in   ( clk ),
    .reset    ( reset ),
    .clk_out  ( clk_out )
    );

    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end


    always @(posedge(clk)) begin
      $dumpfile ("main.vcd");
      $dumpvars(0,tb_main);

      # 300;
      $finish;
    end
endmodule
