`timescale 1ns / 1ps

// Qdiv module for fixed point division
module qdiv # (
    parameter Q = 4, // number of fractional bits
    parameter N = 8 // number of total bits
    ) (
    input clk, // clock signal
    input [N-1:0] a, // dividend
    input [N-1:0] b, // divisor
    output reg [N-1:0] c // quotient
    );
    
    // Declare intermediate variables
    reg [N-1:0] a_sign, b_sign, c_sign; // sign bits
    reg [N-1:0] a_abs, b_abs, c_abs; // absolute values
    reg [2*N-1:0] a_ext, b_ext; // extended values
    reg [2*N-1:0] quotient; // quotient before sign correction
    reg [N-1:0] remainder; // remainder
    reg [N-1:0] overflow; // overflow bit
    
    // Extract sign bits
    always @* begin
        a_sign = a[N-1];
        b_sign = b[N-1];
    end
    
    // Calculate absolute values
    always @* begin
        a_abs = a_sign ? -a : a;
        b_abs = b_sign ? -b : b;
    end
    
    // Extend absolute values
    always @* begin
        a_ext = {a_abs, {Q{1'b0}}};
        b_ext = {b_abs, {Q{1'b0}}};
    end
    
    // Perform division
    always @(posedge clk) begin
        quotient = a_ext / b_ext; // divide extended values
        remainder = a_ext % b_ext; // calculate remainder
    end
    
    // Calculate overflow bit
    always @* begin
        overflow = quotient[2*N-1]; // check if quotient exceeds range
    end
    
    // Correct sign of quotient
    always @* begin
        c_sign = a_sign ^ b_sign; // sign of quotient is XOR of signs of inputs
    end
    
    // Calculate absolute value of output
    always @* begin
        if (overflow) // overflow occurred, use maximum value
            c_abs = {1'b0, {N-1{1'b1}}};
        else if (remainder[Q-1] == 1) // remainder has half bit set, round up quotient
            c_abs = quotient[N-1:0] + 1'b1;
        else // remainder has half bit clear, truncate quotient
            c_abs = quotient[N-1:0];
    end
    
    // Combine sign and absolute value of output
    always @* begin
        c = c_sign ? -c_abs : c_abs;
    end
    
endmodule
