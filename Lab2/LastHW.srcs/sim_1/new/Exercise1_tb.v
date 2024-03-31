`timescale 1ns/1ps

`timescale 1ns/1ns

module circuit_tb;

  reg [7:0] X;
  reg [7:0] a;
  reg [7:0] b;
  reg [7:0] c;
  wire [7:0] Y;

  // Instantiate the circuit module
  circuit uut (
    .X(X),
    .a(a),
    .b(b),
    .c(c),
    .Y(Y)
  );

  // Stimulus generation
  initial begin
    $monitor("Time=%t X=%h a=%h b=%h c=%h Y=%h", $time, X, a, b, c, Y);

    // Test case 1
    X = 8'b00001010;
    a = 8'b00001100;
    b = 8'b00000011;
    c = 8'b00000001;
    #10;

    // Test case 2
    X = 8'b00001111;
    a = 8'b00000000;
    b = 8'b00000010;
    c = 8'b00000010;
    #10;

    // Add more test cases as needed

    $stop; // Stop simulation
  end

endmodule

