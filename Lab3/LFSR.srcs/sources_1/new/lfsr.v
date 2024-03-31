`timescale 1ns / 1ps

module lfsr(
    input clk,
    input rst,
    input ld_en,
    input shift_en,
    input [31:0] seed,
    output  out
    );
    
    wire feedback;
    reg [31:0] tmp;
   
   
    
    always@(posedge clk) begin
        if (rst) begin
            tmp <= {32{1'b0}};
        end
           else begin
            if(ld_en)begin
                tmp<=seed;
            end
            else if(shift_en) begin 
                tmp<={tmp[30:0],feedback};
            end         
        end
    end
    
    assign    feedback=tmp[0]^(tmp[1]^(tmp[31]^tmp[20]));
    assign    out=tmp[31];
   

endmodule