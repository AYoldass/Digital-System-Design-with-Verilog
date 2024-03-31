`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 12:12:34
// Design Name: 
// Module Name: method1
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


module method1(a, b, c, result);

    input [1:0] a;
    input [1:0] b;
    input [1:0] c;    
    output reg [3:0] result;
    reg [1:0] largest1, largest2;
    
    always @(a or b or c) begin
        if (a >= b && a >= c) begin
            largest1 <= a;
            if (b >= c) begin
                largest2 <= b;
            end else begin
                largest2 <= c;
            end
        end else if (b >= a && b >= c) begin
            largest1 <= b;
            if (a >= c) begin
                largest2 <= a;
            end else begin
                largest2 <= c;
            end
        end else begin
            largest1 <= c;
            if (a >= b) begin
                largest2 <= a;
            end else begin
                largest2 <= b;
            end
        end
        result <= largest1 + largest2;
    end
    
     
endmodule