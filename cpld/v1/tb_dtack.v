`timescale 1 ns/1 ps  // time-unit = 1 ns, precision = 1 ps

module tb_dtack();
  reg reset, ram_evn_cs, ram_odd_cs, rom_evn_cs, rom_odd_cs, duart_cs, duart_dtack;
  wire dtack;

  reg clk;

  initial begin
    clk         = 0;
    reset       = 1;
    ram_evn_cs  = 1;
    ram_odd_cs  = 1;
    rom_evn_cs  = 1;
    rom_odd_cs  = 1;
    duart_dtack = 1;

    // Wait 100 ns for global reset to finish
    # 100;
  end

  dtack UUT (
    .clk          ( clk ),
    .reset        ( reset ),
    .ram_evn_cs   ( ram_evn_cs ),
    .ram_odd_cs   ( ram_odd_cs ),
    .rom_evn_cs   ( rom_evn_cs ),
    .rom_odd_cs   ( rom_odd_cs ),
    .duart_dtack  ( duart_dtack ),
    .dtack        ( dtack )
    );

    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

    always @(posedge(clk)) begin
      $dumpfile ("dtack.vcd");
      $dumpvars(0,UUT);

      // test rom dtack generation
      // even rom
      rom_evn_cs = 0;
      #40;
      rom_evn_cs = 1;
      #5;
      // odd rom
      rom_odd_cs = 0;
      #40;
      rom_odd_cs = 1;
      #20;

      // test ram dtack generation
      ram_evn_cs = 0;
      #40;
      ram_evn_cs = 1;
      #5;
      // odd rom
      ram_odd_cs = 0;
      #40;
      ram_odd_cs = 1;
      #20;

      // test duart dtack
      duart_dtack = 0;
      #20;
      duart_dtack = 1;
      #20
      $finish;
    end

endmodule
