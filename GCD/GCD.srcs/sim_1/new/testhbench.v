`timescale 1ns / 1ps
module gcdtest();
reg clr;
wire signed[7:0] gcd_out;
wire stop;

reg clka, clkb, ena, enb, wea, web;
    reg [3:0] addra, addrb;
    reg [7:0] da;
    wire [7:0] mou_a, mou_b;

    wire  [7:0] sou0, sou1;
    reg sort;
    integer i;
    wire done;
    reg state;
    
    wire [7:0] Y;
    
gcd uut(gcd_out,STOP,
           clr,clka,clkb,
           ena,enb,wea,web,
           addra,addrb,da,
           mou_a,mou_b,
            sou0, sou1,
             sort, done, state);
initial
    begin
        i = 0;state =0; clr = 1;
        clka = 1; clkb = 1; ena = 0; enb = 0; wea= 0; web = 0; addra = 0; addrb =1;
        ena = 1; wea = 1; sort = 0;
        addra = 0;  da = -8; #10;
        enb = 1; addrb = 0;
        addra = 1;  da = -6; #10;  addra = 2;  da = -7; #10;  addra = 3;  da = -4; #10;
        addra = 4;  da = -5; #10;  addra = 5;  da = -2; #10;  addra = 6;  da = -3; #10;
        addra = 7;  da =  0; #10;  addra = 8;  da = -1; #10;  addra = 9;  da =  2; #10;
        addra = 10; da =  1; #10; addra = 11; da =  4; #10; addra = 12; da =  3; #10;
        addra = 13; da =  6; #10; addra = 14; da =  10; #10;   addra = 15; da =  15; #10;

        sort=1;   ena = 1; enb = 1;   ena = 1; enb = 1;
        for(i=0; i<15; i = i+1)begin
            wea = 0;  web = 0; addra = i; addrb =i+1; #30;
            wea = 1;  web = 1; addra = i; addrb =i+1; #30;
        end
        state = 1;
    end

    always #5 clka = ~clka;
    always #5 clkb = ~clkb;     
initial begin
    #1300;
    clr = 0;
    end
    endmodule
