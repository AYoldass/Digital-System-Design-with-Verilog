`timescale 1ns / 1ps

module circuit_pipe (
  input clk, // saat sinyali
  input [7:0] X, // X giriþi
  input [7:0] a, // a giriþi
  input [7:0] b, // b giriþi
  input [7:0] c, // c giriþi
  output reg [10:0] Y // Y çýkýþý
);

  reg [7:0] w1, w2; // ara kayýtlar

  always @(posedge clk) begin // saat kenarýnda
    w1 <= X + a; // ilk XOR kapýsý
    w2 <= w1 + b; // ikinci XOR kapýsý
    Y <= {w2[7], w2} + c; // üçüncü XOR kapýsý ve taþýma bayraðý
  end

endmodule

