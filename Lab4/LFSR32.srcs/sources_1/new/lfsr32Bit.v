`timescale 1ns / 1ps

module lfsr(
    input clk,
    input rst,
    input ld_en,
    input shift_en,
    output feedback,
    output out,
    input [31:0] seed
);

    reg [31:0] tmp;

    always @(posedge clk) begin
        if (rst) begin
            tmp <= {32{1'b0}};
        end
        else begin
            if(ld_en) begin
                tmp <= seed;
            end
            else if(shift_en) begin 
                tmp <= {feedback,tmp[31:1]};
            end
        end
    end

    assign feedback = tmp[31]^(tmp[30]^(tmp[11]^tmp[0]));
    assign out = tmp[0];

endmodule