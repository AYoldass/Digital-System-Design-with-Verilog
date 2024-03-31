`timescale 1ns / 1ps


// Testbench module
module ff_pipe2_tb;

// Declare signals to connect to the circuit
reg clk; // Clock signal
reg [7:0] X; // 8-bit input X
reg [7:0] a; // 8-bit input a
reg [7:0] b; // 8-bit input b
wire [7:0] Y; // 8-bit output Y

// Instantiate the circuit module
ff_pipe2 pc(
    .clk(clk),
    .X(X),
    .a(a),
    .b(b),
    .Y(Y)
);

// Initialize the clock signal
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle the clock every 5 time units
end

// Apply some test inputs and display the outputs
initial begin
    // Wait for the first positive edge of the clock
    @(posedge clk);
    
    // Apply the first test input
    X = 8'b10101010;
    a = 8'b00001111;
    b = 8'b11110000;
    
    // Wait for two clock cycles and display the output
    repeat (2) @(posedge clk);
    $display("X = %b, a = %b, b = %b, Y = %b", X, a, b, Y);
    
    // Apply the second test input
    X = 8'b11001100;
    a = 8'b00110011;
    b = 8'b01010101;
    
    // Wait for two clock cycles and display the output
    repeat (2) @(posedge clk);
    $display("X = %b, a = %b, b = %b, Y = %b", X, a, b, Y);
    
    // Stop the simulation
    $finish;
end

endmodule


