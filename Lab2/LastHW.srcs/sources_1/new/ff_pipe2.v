`timescale 1ns / 1ps


// Pipeline circuit module
module ff_pipe2(
    input clk, // Clock signal
    input [7:0] X, // 8-bit input X
    input [7:0] a, // 8-bit input a
    input [7:0] b, // 8-bit input b
    output reg [7:0] Y // 8-bit output Y
);

localparam n = 2;
// Intermediate signal between the two stages
reg [7:0] Z;

// First stage: xor X with a and store in Z
always @(posedge clk) begin
    Z <= X ^ a;
end

// Second stage: shift Z left by n bits and xor with b
always @(posedge clk) begin
    Y <= Z << n ^ b;
end

endmodule
