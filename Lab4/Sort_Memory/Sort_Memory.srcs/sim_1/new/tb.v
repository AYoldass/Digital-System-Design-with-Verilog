`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2023 10:20:49 PM
// Design Name: 
// Module Name: tb
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


module tb();

    reg clk = 0;
    always #5 clk <= ~clk;
    reg SORT = 0;
    wire DONE;
    
    memory_unit dut(clk,SORT,DONE);
    
    initial begin
        #10 SORT <= 1;
        #10 SORT <= 0;
        #750;             
        $finish;
    end
    
endmodule
