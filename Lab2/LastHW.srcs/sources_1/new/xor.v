`timescale 1ns / 1ps
module dff (input D, clk, output reg Q);
  
  always @(posedge clk) // saat sinyalinin yükselen kenarýnda
    Q <= D; // çýkýþý giriþe eþitle
endmodule
