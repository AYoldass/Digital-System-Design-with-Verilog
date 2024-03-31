`timescale 1ns / 1ps

module qadd # (
    parameter Q = 4, 
    parameter N = 8 
    ) (
    input signed [N-1:0] a, 
    input signed [N-1:0] b, 
    output reg signed [N-1:0] c 
    );
    
    
    reg [N-1:0] a_sign, b_sign, c_sign; // sign bits
    reg [N-1:0] a_abs, b_abs, c_abs; // absolute values
    reg [N-1:0] sum; // sum of absolute values
    reg [N-1:0] diff; // difference of absolute values
    reg [N-1:0] max, min; // maximum and minimum of absolute values
    reg [N-1:0] result; // result before sign correction
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
    
  
    always @* begin
        sum = a_abs + b_abs;
        diff = a_abs - b_abs;
    end
    
    always @* begin
        if (a_abs > b_abs) begin
            max = a_abs;
            min = b_abs;
        end else begin
            max = b_abs;
            min = a_abs;
        end
    end
    
    // Calculate result before sign correction
    always @* begin
        if (a_sign == b_sign) // same sign, add absolute values
            result = sum;
        else // different sign, subtract absolute values
            result = diff;
    end
    
    // Calculate overflow bit
    always @* begin
        if (a_sign == b_sign) // same sign, check if sum exceeds range
            overflow = result[N-1] ^ a_sign;
        else // different sign, check if difference is negative
            overflow = result[N-1];
    end
    
    // Correct sign of result
    always @* begin
        if (overflow) // overflow occurred, use maximum value with same sign as inputs
            c_sign = a_sign;
        else // no overflow, use result as is
            c_sign = result[N-1];
    end
    
    
    always @* begin
        if (overflow) // overflow occurred, use maximum value
            c_abs = {1'b0, {N-1{1'b1}}};
        else if (a_sign == b_sign) // same sign, use result as is
            c_abs = result;
        else // different sign, use maximum or minimum depending on sign
            c_abs = c_sign ? max : min;
    end
    
    
    always @* begin
        c = c_sign ? -c_abs : c_abs;
    end
    
endmodule

