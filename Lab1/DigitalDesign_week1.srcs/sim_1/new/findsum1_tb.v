`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 11:57:05
// Design Name: 
// Module Name: findsum1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module findsum1_tb();

    reg[1:0]a,b,c;
    wire[2:0]out;
    
    exercise1 uut (.a(a),.b(b),.c(c),.out(out));
    initial begin
        
        a=2'b01;b=2'b00;c=2'b10;
        #10;
        a=2'b11;b=2'b10;c=2'b01;
        #10;
        a=2'b00;b=2'b01;c=2'b11;
        #10;
        a=2'b01;b=2'b10;c=2'b00;
        #10;
        a=2'b10;b=2'b11;c=2'b01;
        $finish;
    
   end
        
endmodule
