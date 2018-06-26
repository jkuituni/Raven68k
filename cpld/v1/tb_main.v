`timescale 1 ns/1 ps  // time-unit = 1 ns, precision = 1 ps

module tb_main();
  reg clk, reset, duart_irq, a7, a8, a9, a17, a21, as, lds, uds;
  wire clk_out, clk_oe, ipl0, ipl1, ipl2, ram_evn_cs, ram_odd_cs, rom_evn_cs, rom_odd_cs, duart_cs, mem_decode_oe;

  initial begin
    reset = 1;
    clk = 0;
    duart_irq = 1;
    a7 = 0;
    a8 = 0;
    a9 = 0;
    a17 = 0;
    a21 = 0;
    as = 1;
    lds = 1;
    uds = 1;

    // Wait 100 ns for global reset to finish
    # 100;
  end

  main UUT (
    .clk_in        ( clk ),
  	.reset         ( reset ),
  	.duart_irq     ( duart_irq ),
    .a7            ( a7 ),
    .a8            ( a8 ),
    .a9            ( a9 ),
    .a17           ( a17 ),
    .a21           ( a21 ),
    .as            ( as ),
    .lds           ( lds ),
    .uds           ( uds ),
    .e             ( e ),
  	.clk_out       ( clk_out ),
  	.clk_oe        ( clk_oe ),
  	.ipl0          ( ipl0 ),
  	.ipl1          ( ipl1 ),
  	.ipl2          ( ipl2 ),
    .ram_evn_cs    ( ram_evn_cs ),
  	.ram_odd_cs    ( ram_odd_cs ),
  	.rom_evn_cs    ( rom_evn_cs ),
  	.rom_odd_cs    ( rom_odd_cs ),
  	.duart_cs      ( duart_cs ),
  	.mem_decode_oe ( mem_decode_oe ),
    .berr          ( berr )
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

      # 2000;
      $finish;
    end
endmodule
