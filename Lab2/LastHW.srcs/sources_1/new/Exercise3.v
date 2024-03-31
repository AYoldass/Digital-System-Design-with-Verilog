`timescale 1ns / 1ps

// Devre modülü
module pipe_ff (
  input clk, // saat sinyali
  input [7:0] X, // X giriþi
  input [7:0] a, // a giriþi
  input [7:0] b, // b giriþi
  input [7:0] c, // c giriþi
  output reg [8:0] Y // Y çýkýþý
);

  reg [7:0] w1, w2; // ara kayýtlar
  reg [1:0] w1_0, w1_1, w1_2, w1_3; // w1 parçalarý
  reg [1:0] w2_0, w2_1, w2_2, w2_3; // w2 parçalarý
  reg [1:0] Y_0, Y_1, Y_2, Y_3; // Y parçalarý

  always @(posedge clk) begin // saat kenarýnda
    // w1 parçalarýný hesapla
    w1_0 <= X[1:0] + a[1:0];
    w1_1 <= X[3:2] + a[3:2];
    w1_2 <= X[5:4] + a[5:4];
    w1_3 <= X[7:6] + a[7:6];
    // w2 parçalarýný hesapla
    w2_0 <= w1_0 + b[1:0];
    w2_1 <= w1_1 + b[3:2];
    w2_2 <= w1_2 + b[5:4];
    w2_3 <= w1_3 + b[7:6];
    // Y parçalarýný hesapla
    Y_0 <= {w2_0[1], w2_0} + c[1:0];
    Y_1 <= {w2_1[1], w2_1} + c[3:2];
    Y_2 <= {w2_2[1], w2_2} + c[5:4];
    Y_3 <= {w2_3[1], w2_3} + c[7:6];
    // Y çýkýþýný birleþtir
    Y <= {Y_3, Y_2, Y_1, Y_0};
  end

endmodule

