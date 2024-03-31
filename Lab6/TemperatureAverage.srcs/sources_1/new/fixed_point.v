`timescale 1ns / 1ps

module FixedPointAverage(
    input signed [5:0] temp1,
    input signed [5:0] temp2,
    input signed [5:0] temp3,
    input signed [5:0] temp4,
    output reg signed [8:0] result
);

// Fixed-point representation parameters
parameter FRAC_BITS = 3;
parameter TRUNC_BITS = 2;

// Internal variables
reg signed [8:0] sum;
reg [FRAC_BITS-1:0] frac_sum;

// Calculate the sum of the temperatures
always @(temp1, temp2, temp3, temp4)
begin
    sum = temp1 + temp2 + temp3 + temp4;
    frac_sum = sum[FRAC_BITS + 7:FRAC_BITS];
end

// Calculate the truncated average
always @(sum)
begin
    result = sum >> TRUNC_BITS;
end

endmodule

