`timescale 1ns / 1ps
module dff (input D, clk, output reg Q);
  
  always @(posedge clk) // saat sinyalinin y�kselen kenar�nda
    Q <= D; // ��k��� giri�e e�itle
endmodule
