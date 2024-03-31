`timescale 1ns / 1ps
// Testhbench modülü
module testhbench3;

  // Giriþ ve çýkýþ sinyalleri
  reg clk;
  reg [7:0] X;
  reg [7:0] a;
  reg [7:0] b;
  reg [7:0] c;
  wire [8:0] Y;

  // Devre örneði
  pipe_ff uut (
    .clk(clk),
    .X(X),
    .a(a),
    .b(b),
    .c(c),
    .Y(Y)
  );

  
  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end


  initial begin
    X = 8'b00000000; 
    a = 8'b00000000; 
    b = 8'b00000000; 
    c = 8'b00000000; 
    #20; 
    X = 8'b00001111; 
    a = 8'b00001111; 
    b = 8'b00010101; 
    c = 8'b00000011; 
    #20; 
    X = 8'b00101010; 
    a = 8'b00001100; 
    b = 8'b00110000; 
    c = 8'b00001111; 
    #20; // 20 birim zaman bekle
    $finish; // testi bitir
  end

endmodule
