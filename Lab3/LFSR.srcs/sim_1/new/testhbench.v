`timescale 1ns / 1ps

module lfsr_tb();
    reg clk;
    reg rst;
    reg [31:0] seed;
    reg ld_en;
    reg shift_en;
    wire lfsr_out;
    
    
    
    integer i, fileout;

    lfsr uut (
        .clk(clk),
        .rst(rst),
        .seed(seed),
        .ld_en(ld_en),
        .shift_en(shift_en),
        .out(lfsr_out)
    );


always #10 clk = ~clk;
    initial begin
        fileout = $fopen("C:\Users\ahmet\Desktop\lfrs.txt", "w");
        clk = 1;
        seed =32'h0003039;
        ld_en = 1;
        shift_en = 0;
        rst = 0; //reset LFSR
        #20;
        ld_en = 0;
        shift_en = 1;
      
        for(i=0;i<200;i=i+1)begin
        #20;
        @(posedge clk)

     $fwrite(fileout, "%b/n", lfsr_out);
     end
     $fclose(fileout);
     $finish;
     end

   

endmodule

   
    //C:\Users\ahmet\Desktop\lfrs.txt