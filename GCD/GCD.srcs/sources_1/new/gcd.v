`timescale 1ns / 1ps
module gcd(gcd_out,STOP,clr,clka,clkb,ena,enb,wea,web,addra,addrb,da,mem_outA,mem_outB,sort_out0, sort_out1,sort, done, state);
    input clr;
    output signed [7:0] gcd_out;
    output reg STOP;
    wire xsel, ysel, xmld, ymld, gmld, eqmflg, ltmflg;
    wire stop;

    input signed[7:0] da;
    input clka,clkb,ena,enb,wea,web;
    input [3:0] addra,addrb;
    wire signed[7:0] min_a,min_b;
    output signed[7:0] mem_outA, mem_outB;

    output signed [7:0] sort_out0, sort_out1;
    input sort;
    output done;
    input state;

    memory mem(.clka(clka),  .clkb(clkb), .ena(ena), .enb(enb), .wea(wea),
    .web(web),  .addra(addra), .addrb(addrb), .mem_inA(min_a),  .mem_inB(sort_out1),
    .mem_outA(mem_outA),  .mem_outB(mem_outB));
    
    sort srt(.clk(clka),   .sort_in0(mem_outA),  .sort_in1(mem_outB) , .sort_out0(sort_out0) , 
    .sort_out1(sort_out1),  .sort(sort),  .done(done),   .state(state));
    
    assign min_a = sort ? sort_out0:da;
    assign dia   = sort ? sort_out0:da; //mux

    gcd_datapath U1(.clk(clka),   .clr(clr),   .xmsel(xsel),    .ymsel(ysel),     .xld(xmld),
        .yld(ymld),  .gld(gmld),   .xin(mem_outA),  .yin(mem_outB),    .eqflg(eqmflg),
        .ltflg(ltmflg),    .gcd(gcd_out));

    gcd_control U2(.clk(clka),   .clr(clr),  .eqflg(eqmflg),   .ltflg(ltmflg),   .stop(stop),    .xld(xmld),
        .yld(ymld),  .xmsel(xsel),   .ymsel(ysel),   .gld(gmld));

    always @ (posedge clka) begin
        STOP <= stop;
    end

endmodule
