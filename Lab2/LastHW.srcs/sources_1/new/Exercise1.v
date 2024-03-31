`timescale 1ns / 1ps

module circuit (
  input [7:0] X,
  input [7:0] a,
  input [7:0] b,
  input [7:0] c,
  output reg [10:0] Y
);

  reg [7:0] w1;
  reg [7:0] w2;

  always @(X, a, b, c) begin
    w1 = X + a;
    w2 = w1 + b;
    Y = w2 + c;
  end

endmodule

