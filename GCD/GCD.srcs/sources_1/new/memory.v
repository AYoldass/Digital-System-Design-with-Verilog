`timescale 1ns / 1ps
module memory(clka,clkb,ena,enb,wea,web,addra,addrb,mem_inA,mem_inB,mem_outA,mem_outB);
    input clka,clkb,ena,enb,wea,web;
    input [3:0] addra,addrb;
    input signed[7:0] mem_inA,mem_inB;
    output signed[7:0] mem_outA,mem_outB;
    reg[7:0] ram [15:0];
    reg[7:0] mem_outA,mem_outB;
    always @(posedge clka) begin 
        if (ena)
        begin
            if (wea)
                ram[addra] <= mem_inA;
                mem_outA <= ram[addra];
        end
    end
    always @(posedge clkb) begin 
        if (enb)
        begin
            if (web)
                ram[addrb] <= mem_inB;
                mem_outB <= ram[addrb];
        end
    end
endmodule
