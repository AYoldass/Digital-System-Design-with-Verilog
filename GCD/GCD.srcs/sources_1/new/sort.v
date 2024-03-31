`timescale 1ns / 1ps
module sort(clk, sort_in0, sort_in1, sort_out0, sort_out1, sort, done, state);
    input clk;
    input state;
    output done;
    input signed [7:0]sort_in0, sort_in1;
    output reg signed [7:0] sort_out0, sort_out1;
    input sort;
    reg signed [7:0] temp [1:0];
    reg sign_of_difference;
    reg [7:0] difference;
    
    always@(posedge clk) begin
        if(sort) begin
            temp[0] <= sort_in0;
            temp[1] <= sort_in1;
            difference <= temp[1]-temp[0];
            sign_of_difference <= difference[7];
            if (sign_of_difference)begin
                sort_out0 <= temp[1];
                sort_out1 <= temp[0];
            end
            else begin
                sort_out0 <= temp[0];
                sort_out1 <= temp[1];
            end
        end
    end
    
assign done = sort && state ? 1:0;
endmodule
