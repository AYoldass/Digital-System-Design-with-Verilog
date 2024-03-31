`timescale 1ns / 1ps
module method2( a, b, c, result);
    input [1:0] a;
     input [1:0] b;
     input [1:0] c;
    
    output reg [3:0] result;
    reg [1:0] smallest;

    always @(a or b or c) begin
        if (a < b && a < c) begin
            smallest <= a;
        end else if (b < a && b < c) begin
            smallest <= b;
        end else begin
            smallest <= c;
        end
        
        result <= a + b + c - smallest;
    end
    
    endmodule
