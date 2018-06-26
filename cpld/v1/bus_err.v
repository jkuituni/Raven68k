module bus_err (
  input as,
  input e,
  output reg berr
  );

  reg [3:0] count;
  localparam max_count = 8;

  initial
    begin
      berr <= 1'b1;
      count <= 3'b000;
    end

  always @(posedge(e))
    begin
      if (as)
        begin
          berr <= 1'b1;
          count <= 3'b000;
        end
      else if (!as)
        begin
          if (count == (max_count-1))
            berr <= 1'b0;
          else
          count = count + 1'b1;
        end
    end

endmodule
