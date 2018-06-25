`timescale 1 ns/1 ps  // time-unit = 1 ns, precision = 1 ps

module tb_irq();
  reg duart_irq, reset;
  wire irq1, irq2, irq3;

  reg clk;

  initial begin
    duart_irq = 1;
    reset = 1;
    clk = 0;

    // Wait 100 ns for global reset to finish
    # 100;
  end

  irq UUT (
    .clk        ( clk ),
    .reset      ( reset ),
    .duart_irq  ( duart_irq ),
    .ipl0       ( ipl0 ),
    .ipl1       ( ipl1 ),
    .ipl2       ( ipl2 )
  );

  always begin
      clk = 1'b1;
      #5;
      clk = 1'b0;
      #5;
  end

  always @(posedge(clk)) begin
    $dumpfile ("irq.vcd");
    $dumpvars(0,UUT);
    $display("clk  duart_irq  reset  |  ipl0  ipl1  ipl2");
    $monitor(" %d     %d         %d     |   %d     %d     %d",
      clk, duart_irq, reset, ipl0, ipl1, ipl2);
    duart_irq = 1;
    # 20;
    duart_irq = 0;
    # 20;
    reset = 0;
    # 20;
    reset = 1;        // This should not happen -- /RESET clears /IRQ
    # 20;
    duart_irq = 1;
    # 20;
    $finish;
  end

endmodule
