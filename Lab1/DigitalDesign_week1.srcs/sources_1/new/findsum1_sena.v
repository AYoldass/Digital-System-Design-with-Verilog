`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 11:47:21
// Design Name: 
// Module Name: exercise1
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


module exercise1(a,b,c,out);

    input[1:0]a;
    input[1:0]b;
    input[1:0]c;
    output[2:0]out;
    
    wire[2:0]sum;
    wire[1:0]min;
    
    assign sum = a+b+c;
    assign min = (a<b && a<c)?a:(b<c)?b:c;
    assign out= sum - min;

endmodule
