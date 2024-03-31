`timescale 1ns / 1ps

module temp_avg(
    input clk, // clock signal for division module
    input signed [7:0] temp0, // temperature values
    input signed [7:0] temp1,
    input signed [7:0] temp2,
    input signed [7:0] temp3,
    output reg signed [7:0] Ravg // average of four temperature values
    );
    
    // Declare intermediate variables
    reg [7:0] sum; // sum of four temperature values
    reg [7:0] sum_shift; // sum shifted by 1 bit with rounding
    wire [7:0] Ravg_shift; // Ravg shifted by 1 bit with rounding
    wire [7:0] div_out; // output of division module
    
    // Instantiate addition modules
    qadd #(4, 8) adder0 (
        .a(temp0),
        .b(temp1),
        .c(sum)
    );

    qadd #(4, 8) adder1 (
        .a(sum),
        .b(temp2),
        .c(sum)
    );

    qadd #(4, 8) adder2 (
        .a(sum),
        .b(temp3),
        .c(sum)
    );
    
    // Right shift sum by 1 bit with rounding
    always @* begin
        if (sum[0] == 1) // if LSB is 1, add 1 to sum before shifting
            sum_shift = (sum + 1'b1) >> 1;
        else // if LSB is 0, just shift sum
            sum_shift = sum >> 1;
    end
    
    // Instantiate division module
    qdiv #(4, 8) divider (
        .clk(clk),
        .a(sum_shift),
        .b(4'b0100), // divide by 4
        .c(div_out)
    );

    // Assign div_out to Ravg_shift
    assign Ravg_shift = div_out;

    // Reduce bitwidth of Ravg_shift by 1 bit with rounding
    always @* begin
        if (Ravg_shift[0] == 1) // if LSB is 1, add 1 to Ravg_shift before truncating
            Ravg = (Ravg_shift + 1'b1);//[7:1]
        else // if LSB is 0, just truncate Ravg_shift
            Ravg = Ravg_shift[7:1];
    end
    
endmodule
