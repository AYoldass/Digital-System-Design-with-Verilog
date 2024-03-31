`timescale 1ns/1ns  // Define timescale for simulation

module FixedPointAverage_tb;

  // Parameters
  parameter FRAC_BITS = 3;
  parameter TRUNC_BITS = 1;

  // Inputs
  reg clk;
  reg rst;
  reg signed [5:0] temp1;
  reg signed [5:0] temp2;
  reg signed [5:0] temp3;
  reg signed [5:0] temp4;

  // Outputs
  wire signed [8:0] result;

  // Instantiate the module
  FixedPointAverage uut (
    .temp1(temp1),
    .temp2(temp2),
    .temp3(temp3),
    .temp4(temp4),
    .result(result)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;  // Toggle the clock every 5 time units
  end

  // Initial block for testbench
  initial begin
    // Initialize variables
    clk = 0;
    rst = 0;
    temp1 = 0;
    temp2 = 0;
    temp3 = 0;
    temp4 = 0;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Test for a number of clock cycles
    repeat (10) begin
      // Generate random values for temperature measurements
      temp1 = $random;
      temp2 = $random;
      temp3 = $random;
      temp4 = $random;

      // Wait for a clock cycle
      #1;
    end

    // End simulation
    $finish;
  end

endmodule
