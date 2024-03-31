`timescale 1ns / 1ps

module lfsr_top#( parameter WIDTH = 32 ) (
    input clk,
    input rst,
    input ld_en,
    input shift_en,
    input [WIDTH - 1:0] seed,
    output [WIDTH - 1:0] out
    );
    
    wire feedback;
    reg [WIDTH - 1:0] tmp;
   
   
     lfsr uut1(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[0]), .out(out[0]));
     lfsr uut2(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[1]), .out(out[1]));
     lfsr uut3(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[2]), .out(out[2]));
     lfsr uut4(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[3]), .out(out[3]));
     lfsr uut5(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[4]), .out(out[4]));
     lfsr uut6(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[5]), .out(out[5]));
     lfsr uut7(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[6]), .out(out[6]));
     lfsr uut8(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[7]), .out(out[7]));
     lfsr uut9(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[8]), .out(out[8]));
     lfsr uut10(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[9]), .out(out[9]));
     lfsr uut11(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[10]), .out(out[10]));
     lfsr uut12(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[11]), .out(out[11]));
     lfsr uut13(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[12]), .out(out[12]));
     lfsr uut14(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[13]), .out(out[13]));
     lfsr uut15(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[14]), .out(out[14]));
     lfsr uut16(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[15]), .out(out[15]));
     lfsr uut17(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[16]), .out(out[16]));
     lfsr uut18(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[17]), .out(out[17]));
     lfsr uut19(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[18]), .out(out[18]));
     lfsr uut20(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[19]), .out(out[19]));
     lfsr uut21(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[20]), .out(out[20]));
     lfsr uut22(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[21]), .out(out[21]));
     lfsr uut23(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[22]), .out(out[22]));
     lfsr uut24(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[23]), .out(out[23]));
     lfsr uut25(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[24]), .out(out[24]));
     lfsr uut26(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[25]), .out(out[25]));
     lfsr uut27(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[26]), .out(out[26]));
     lfsr uut28(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[27]), .out(out[27]));
     lfsr uut29(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[28]), .out(out[28]));
     lfsr uut30(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[29]), .out(out[29]));
     lfsr uut31(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[30]), .out(out[30]));
     lfsr uut32(.clk(clk), .rst(rst), .ld_en(ld_en), .shift_en(shift_en), .seed(seed[31]), .out(out[31]));
     
     
    assign    feedback=tmp[WIDTH - 1]^(tmp[WIDTH - 2]^(tmp[WIDTH - 21]^tmp[WIDTH - 32]));
    assign    out=tmp[WIDTH - 32];
     
     
     
     
     
     
     
     
     endmodule