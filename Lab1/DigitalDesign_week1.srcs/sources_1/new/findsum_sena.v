`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 11:47:21
// Design Name: 
// Module Name: exercise
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


module exercise(a,b,c,out);

    input[1:0]a;
    input[1:0]b;
    input[1:0]c;
    output reg[2:0]out;
    
    always@(*)begin
        if(a==2'b00)begin
            out=b+c;
        end
        else if(b==2'b00)begin
            out=a+c;
        end
        else if(c==2'b00)begin
            out=a+b;
        end
        else begin
            out=5;
        end
    end
endmodule
