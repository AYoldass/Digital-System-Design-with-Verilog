`timescale 1ns / 1ps


`timescale 1ns / 1ps

module testbench;

    // Declare signals
    reg clk;
    reg [7:0] temp0, temp1, temp2, temp3;
    wire [7:0] Ravg;

    // Instantiate the module under test
    temp_avg uut (
        .clk(clk),
        .temp0(temp0),
        .temp1(temp1),
        .temp2(temp2),
        .temp3(temp3),
        .Ravg(Ravg)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        temp0 = 5;
        temp1 = -10;
        temp2 = 20;
        temp3 = 15;

        // Apply inputs and observe outputs
        #10; // Wait a few clock cycles before applying inputs

        $display("Input Temperatures: temp0=%d, temp1=%d, temp2=%d, temp3=%d", temp0, temp1, temp2, temp3);

        // Apply inputs and observe outputs
        #10; temp0 = -2; temp1 = 8; temp2 = -15; temp3 = 25;

        $display("Input Temperatures: temp0=%d, temp1=%d, temp2=%d, temp3=%d", temp0, temp1, temp2, temp3);

        // ... Continue with additional test cases as needed

        // End simulation
        #10 $finish;
    end

endmodule
