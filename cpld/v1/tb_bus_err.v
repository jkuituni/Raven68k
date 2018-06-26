`timescale 1 ns/1 ps  // time-unit = 1 ns, precision = 1 ps

module tb_bus_err();
  reg as, clk;
  wire berr;

  initial begin
    as  = 0;
    clk = 0;

    // Wait 100 ns for global reset to finish
    # 100;
  end

  bus_err UUT (
    .as   ( as ),
    .e    ( clk ),
    .berr ( berr )
    );

    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

    always @(posedge(clk)) begin
    $dumpfile ("bus_err.vcd");
    $dumpvars(0,UUT);

    // /E without /AS should do nothing
    #10;

    // /AS should count 8 cycles, then produce /BERR
    as = 0;
    #100;

    // /AS high should reset /BERR
    as = 1;
    #20;

    $finish;
    end

endmodule
