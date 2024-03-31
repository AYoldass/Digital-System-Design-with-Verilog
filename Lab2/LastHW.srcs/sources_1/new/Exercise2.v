`timescale 1ns / 1ps

module circuit_pipe (
  input clk, // saat sinyali
  input [7:0] X, // X giri�i
  input [7:0] a, // a giri�i
  input [7:0] b, // b giri�i
  input [7:0] c, // c giri�i
  output reg [10:0] Y // Y ��k���
);

  reg [7:0] w1, w2; // ara kay�tlar

  always @(posedge clk) begin // saat kenar�nda
    w1 <= X + a; // ilk XOR kap�s�
    w2 <= w1 + b; // ikinci XOR kap�s�
    Y <= {w2[7], w2} + c; // ���nc� XOR kap�s� ve ta��ma bayra��
  end

endmodule

