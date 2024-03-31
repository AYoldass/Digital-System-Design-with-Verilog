`timescale 1ns / 1ps



module tb();
    
    reg clk = 0;
    always #5 clk <= ~clk;
    reg SORT = 0;
    wire [3:0] content_a;
    wire [3:0] content_b;
    wire [2:0] pointer_a;
    wire [2:0] pointer_b;
    wire DONE;
    wire [1:0] state;
    
    sort_memory dut(clk,SORT,content_a,content_b,pointer_a,pointer_b,state,DONE);
    
    initial begin
        #10 SORT <= 1;
        #10 SORT <= 0;
        #750;             
        $finish;
    end
    
endmodule
