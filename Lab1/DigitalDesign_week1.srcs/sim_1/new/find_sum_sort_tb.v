`timescale 1ns / 1ps
module find_sum_sort_tb;
    reg [1:0] A, B, C;
    wire [2:0] sum;
    
    // Instantiate the module under test
    find_sum_sort uut (
        .A(A),
        .B(B),
        .C(C),
        .sum(sum)
    );
    
    // Stimulus
    initial begin
        $display("Testing Sorting Algorithm Approach");
        
        // Test case 1: A > B > C
        A = 2'b10; B = 2'b01; C = 2'b00;
        #10 $display("A=%b, B=%b, C=%b => Sum=%b", A, B, C, sum);
        
        // Test case 2: A > C > B
        A = 2'b10; B = 2'b00; C = 2'b01;
        #10 $display("A=%b, B=%b, C=%b => Sum=%b", A, B, C, sum);
        
        // Test case 3: B > A > C
        A = 2'b01; B = 2'b10; C = 2'b00;
        #10 $display("A=%b, B=%b, C=%b => Sum=%b", A, B, C, sum);
        
        // Test case 4: B > C > A
        A = 2'b00; B = 2'b10; C = 2'b01;
        #10 $display("A=%b, B=%b, C=%b => Sum=%b", A, B, C, sum);
        
        // Test case 5: C > A > B
        A = 2'b01; B = 2'b00; C = 2'b10;
        #10 $display("A=%b, B=%b, C=%b => Sum=%b", A, B, C, sum);
        
        // Test case 6: C > B > A
        A = 2'b00; B = 2'b01; C = 2'b10;
        #10 $display("A=%b, B=%b, C=%b => Sum=%b", A, B, C, sum);
        
        $finish;
    end
endmodule



