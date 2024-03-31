`timescale 1ns / 1ps
// Testhbench modülü
module testhbench;

  // Giriþ ve çýkýþ sinyalleri
  reg clk;
  reg [7:0] X;
  reg [7:0] a;
  reg [7:0] b;
  reg [7:0] c;
  wire [8:0] Y;

  // Devre örneði
  circuit_pipe uut (
    .clk(clk),
    .X(X),
    .a(a),
    .b(b),
    .c(c),
    .Y(Y)
  );

  // Saat sinyali üretimi
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 birim zaman periyodu
  end

  // Giriþ sinyalleri deðerleri
  initial begin
    X = 8'b00000000; // baþlangýç deðeri
    a = 8'b00000000; // baþlangýç deðeri
    b = 8'b00000000; // baþlangýç deðeri
    c = 8'b00000000; // baþlangýç deðeri
    #20; // 20 birim zaman bekle
    X = 8'b00000010; // yeni deðer
    a = 8'b00000001; // yeni deðer
    b = 8'b00000101; // yeni deðer
    c = 8'b00000011; // yeni deðer
    #20; // 20 birim zaman bekle
   
    #40; // 20 birim zaman bekle
    $finish; // testi bitir
  end

endmodule