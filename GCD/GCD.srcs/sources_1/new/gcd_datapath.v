`timescale 1ns / 1ps
module gcd_datapath(
    input clk,
    input clr,
    input xmsel,
    input ymsel,
    input xld,
    input yld,
    input gld,
    input signed [7:0] xin,
    input signed [7:0] yin,
    output  eqflg,
    output  ltflg,
    output /*wire*/ reg [7:0] gcd);

wire signed [7:0] xmy, ymx;
wire  signed [7:0] x1, y1;
reg   signed [7:0] x, y;
assign x1 = xmsel ? xin:xmy; 
assign y1 = ymsel ? yin:ymx; 
   
always @(posedge clk) begin //xreg
            if(clr == 1) begin
                x <= 0;
                end
            else if(xld == 1) begin
                x <= x1;
                end
            else begin
                x <= x;
                end
    end
    
always @(posedge clk) begin //yreg
            if(clr == 1) begin
                y <= 0;
                end
            else if(yld == 1) begin
                y <= y1;
                end
            else begin
                y <= y;
                end
    end
//…………………
always @(posedge clk) begin //gcdreg
            if(clr == 1) begin
                gcd <= 0;
                end
            else if(gld == 1) begin
                gcd <= x;
                end
            else begin
                gcd <= gcd;
                end
    end
    
assign xmy = x - y;
assign ymx = y - x;
assign eqflg = x == y ? 1:0;
assign ltflg = x < y ? 1:0;

endmodule
