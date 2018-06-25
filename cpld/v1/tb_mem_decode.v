`timescale 1 ns/1 ps  // time-unit = 1 ns, precision = 1 ps

module tb_mem_decoder();
  reg reset, a7, a8, a9, a17, a21, as, lds, uds;
  wire ram_evn_cs, ram_odd_cs, rom_evn_cs, rom_odd_cs, duart_cs;

  reg clk;
  integer index;

  initial begin
  reset = 1;
  a7    = 0;
  a8    = 0;
  a9    = 0;
  a17   = 0;
  a21   = 0;
  as    = 1;
  lds   = 1;
  uds   = 1;

    // Wait 100 ns for global reset to finish
    # 100;
  end

  mem_decoder UUT (
    .reset        ( reset ),
    .a7           ( a7 ),
    .a8           ( a8 ),
    .a9           ( a9 ),
    .a17          ( a17 ),
    .a21          ( a21 ),
    .as           ( as ),
    .lds          ( lds ),
    .uds          ( uds ),
    .ram_evn_cs   ( ram_evn_cs ),
    .ram_odd_cs   ( ram_odd_cs ),
    .rom_evn_cs   ( rom_evn_cs ),
    .rom_odd_cs   ( rom_odd_cs ),
    .duart_cs     ( duart_cs )
  );

  always begin
      clk = 1'b1;
      #5;
      clk = 1'b0;
      #5;
  end

  always @(posedge(clk)) begin
    $dumpfile ("mem_decoder.vcd");
    $dumpvars(0,UUT);
    reset = 0;
    #5;
    reset = 1;      // processing starts here
    #5;

    // after reset, first 8 /AS should activate ROM
    // last two should leave ROM unselected
    // activate A21 just to make sure
    a21 = 1'b1;
    for (index = 0; index < 10; index = index + 1)
      begin
        as = 1'b0;
        #1;
        as = 1'b1;
        #1;
      end
    a21 = 1'b0;
    #5;

    // /AS without A21 should pull proper RAM low
    // /LDS down
    a21 = 1'b0;
    lds = 1'b0;
    as = 1'b0;
    #1;
    as = 1'b1;
    #2;
    // /UDS down
    lds = 1'b1;
    uds = 1'b0;
    as = 1'b0;
    #1;
    as = 1'b1;
    #2;
    // Both /LDS and /UDS down
    lds = 1'b0;
    as = 1'b0;
    #1
    as = 1'b1;
    #2;
    // cleanup
    lds = 1'b1;
    uds = 1'b1;
    #5;

    // A21 high with A17 low is ROM selected
    // LDS down
    a21 = 1'b1;
    a17 = 1'b0;
    lds = 1'b0;
    as = 1'b0;
    #1;
    as = 1'b1;
    #2;
    // /UDS down
    lds = 1'b1;
    uds = 1'b0;
    as = 1'b0;
    #1;
    as = 1'b1;
    #2;
    // Both /LDS and /UDS down
    lds = 1'b0;
    as = 1'b0;
    #1
    as = 1'b1;
    #2;
    // cleanup
    lds = 1'b1;
    uds = 1'b1;
    a21 = 1'b0;
    #5;

    // A21 high and A17 high is I/O area
    // Currently only DUART connected
    a21 = 1'b1;
    a17 = 1'b1;
    lds = 1'b0;
    as = 1'b0;
    #1;
    as = 1'b1;
    #2;
    // /UDS down
    lds = 1'b1;
    uds = 1'b0;
    as = 1'b0;
    #1;
    as = 1'b1;
    #2;
    // Both /LDS and /UDS down
    lds = 1'b0;
    as = 1'b0;
    #1
    as = 1'b1;
    #2;
    // cleanup
    lds = 1'b1;
    uds = 1'b1;
    a21 = 1'b0;
    a17 = 1'b0;
    #5;

    $finish;
  end

endmodule
