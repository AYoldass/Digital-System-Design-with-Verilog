`timescale 1ns / 1ps
// Testhbench mod�l�
module testhbench;

  // Giri� ve ��k�� sinyalleri
  reg clk;
  reg [7:0] X;
  reg [7:0] a;
  reg [7:0] b;
  reg [7:0] c;
  wire [8:0] Y;

  // Devre �rne�i
  circuit_pipe uut (
    .clk(clk),
    .X(X),
    .a(a),
    .b(b),
    .c(c),
    .Y(Y)
  );

  // Saat sinyali �retimi
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 birim zaman periyodu
  end

  // Giri� sinyalleri de�erleri
  initial begin
    X = 8'b00000000; // ba�lang�� de�eri
    a = 8'b00000000; // ba�lang�� de�eri
    b = 8'b00000000; // ba�lang�� de�eri
    c = 8'b00000000; // ba�lang�� de�eri
    #20; // 20 birim zaman bekle
    X = 8'b00000010; // yeni de�er
    a = 8'b00000001; // yeni de�er
    b = 8'b00000101; // yeni de�er
    c = 8'b00000011; // yeni de�er
    #20; // 20 birim zaman bekle
   
    #40; // 20 birim zaman bekle
    $finish; // testi bitir
  end

endmodule