`timescale 1ns / 1ps

module lfsr32_top(
    input clk,
    input rst,
    input ld_en,
    input shift_en,
    input [31:0] seed,
    output [31:0] out
);

    genvar i;
    

    generate
        for (i = 0; i < 32; i = i + 1) 
        begin : lfsr_instances
            lfsr lfsr_i(
                .clk(clk),
                .rst(rst),
                .ld_en(ld_en),
                .shift_en(shift_en),
                .seed((seed*(i+1))), // Seed sıralamasını ters çevirdim
                .out(out[i])
            );
        end
    endgenerate

    

endmodule