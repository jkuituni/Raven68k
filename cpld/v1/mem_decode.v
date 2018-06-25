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
    input clk_in,
    input reset,
    input a7,
    input a8,
    input a9,
    input a17,
    input a21,
    input as,
    input lds,
    input uds,
    output reg ram_evn_cs,
    output reg ram_odd_cs,
    output reg rom_evn_cs,
    output reg rom_odd_cs,
    output reg duart_cs
    );

    reg [3:0] as_count;

    // Memory Map:
    // 0x000000 - 0x0FFFFF        RAM (1 MB)
    // 0x100000 - 0x10FFFF        ROM (64 KB)
    // 0x110000 - 0x11003F        DUART (64 bytes == 32 registers)
    // Additional inputs in 64 byte blocks

    initial
      begin
        ram_evn_cs <= 1'b1;
        ram_odd_cs <= 1'b1;
        rom_evn_cs <= 1'b1;
        rom_odd_cs <= 1'b1;
        duart_cs   <= 1'b1;
        as_count   <= 4'b0000;
      end

    always @(reset || as)
    begin
      if (!reset)
        as_count <= 4'b0000;

      if (!reset || as)
        begin
        ram_evn_cs <= 1'b1;
        ram_odd_cs <= 1'b1;
        rom_evn_cs <= 1'b1;
        rom_odd_cs <= 1'b1;
        duart_cs   <= 1'b1;
        end

      if (!as)
      begin
        if (reset && (as_count < 4'b1000))    // First 8 cycles
          begin
            rom_evn_cs <= 1'b0;
            rom_odd_cs <= 1'b0;
            as_count <= as_count + 1'b1;
          end
        else
          begin                               // Normal decoding
            if (a21 == 1'b1)                  // ROM || I/O devices
              begin
                if (a17 == 1'b1)              // I/O devices
                  begin
                    // for now, all we have is the DUART.
                    // fill in when we have more devices
                    duart_cs <= 1'b0;
                  end
                else                          // ROM
                  begin
                    if (uds == 1'b1)
                      rom_evn_cs <= 1'b1;
                    else
                      rom_evn_cs <= 1'b0;
                    if (lds == 1'b1)
                      rom_odd_cs <= 1'b1;
                    else
                      rom_odd_cs <= 1'b0;
                  end
              end
            else                              // RAM
              begin
                if (uds == 1'b1)
                  ram_evn_cs <= 1'b1;
                else
                  ram_evn_cs <= 1'b0;
                if (lds == 1'b1)
                  ram_odd_cs <= 1'b1;
                else
                  ram_odd_cs <= 1'b0;
              end
          end
      end
    end

endmodule
