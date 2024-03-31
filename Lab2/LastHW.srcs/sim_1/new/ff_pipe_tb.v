`timescale 1ns / 1ps

module ff_pipe_tb;


  // Declare signals
  reg clk; // clock signal
  reg [7:0] X, a, b; // 8-bit inputs
  wire [7:0] Y; // 8-bit output

  // Instantiate the pipelined XOR module
  pipelined_xor uut (
    .clk(clk),
    .X(X),
    .a(a),
    .b(b),
    .Y(Y)
  );

  // Generate clock signal with 50% duty cycle and 10 ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Apply test vectors to the inputs and display the output
  initial begin
    // Initialize the inputs
    X = 8'b00000000;
    a = 8'b00000000;
    b = 8'b00000000;
    // Wait for two clock cycles
    #20;
    // Display the header
    $display("Time\tX\ta\tb\tY");
    // Display the initial values
    $display("%3d\t%b\t%b\t%b\t%b", $time, X, a, b, Y);
    // Apply the first test vector
    X = 8'b11110000;
    a = 8'b01010101;
    b = 8'b00110011;
    // Wait for one clock cycle
    #10;
    // Display the values
    $display("%3d\t%b\t%b\t%b\t%b", $time, X, a, b, Y);
    // Apply the second test vector
    X = 8'b10101010;
    a = 8'b11001100;
    b = 8'b11111111;
    // Wait for one clock cycle
    #10;
    // Display the values
    $display("%3d\t%b\t%b\t%b\t%b", $time, X, a, b, Y);
    // Apply the third test vector
    X = 8'b01100110;
    a = 8'b10011001;
    b = 8'b00001111;
    // Wait for one clock cycle
    #10;
    // Display the values
    $display("%3d\t%b\t%b\t%b\t%b", $time, X, a, b, Y);
    // Stop the simulation
    $finish;
  end

endmodule
