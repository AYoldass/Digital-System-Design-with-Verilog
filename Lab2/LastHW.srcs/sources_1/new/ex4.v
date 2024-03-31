`timescale 1ns / 1ps


module pipelined_xor (
  input clk, 
  input [7:0] X, a, b, 
  output reg [10:0] Y
);

  reg [7:0] temp; // intermediate register to store XOR of X and a

  always @(posedge clk) begin
    temp <= X + a; // XOR of X and a stored in temp at rising edge of clock
    Y <= temp + b; // XOR of temp and b stored in Y at rising edge of clock
  end

endmodule
