`timescale 1ns / 1ps

module top_tb();
    reg clk;
    reg rst;
    reg [31:0] seed;
    reg ld_en;
    reg shift_en;
    wire [31:0] out;

    integer i, fileout;

    lfsr32_top uut (
        .clk(clk),
        .rst(rst),
        .seed(seed),
        .ld_en(ld_en),
        .shift_en(shift_en),
        .out(out)
    );

    // Generate a clock signal with 10 ns period
    always #10 clk = ~clk;
    
    initial begin
        // Open a text file for writing 32-bit output 32-Reg LFSR system output
        fileout = $fopen("C:\\Users\\ahmet\\Desktop\\lfrs32.txt", "w");
        
        // Initialize the signals
        clk = 1;
        seed = 32'h00003039; // Adjust the seed value
        rst=1;
        ld_en = 0;
        shift_en = 0;
        #20;
        rst = 0;
        #20;
        
      for (i = 0; i < 200; i = i + 1) begin
        ld_en = 1;
        shift_en = 0;
        #20;
        ld_en = 0;
        shift_en = 1;
        #20;
      end
  
        // Write 128 bits of 32-bit output 32-Reg LFSR system output to the text file
        for (i = 0; i < 200; i = i + 1) begin
            #20;
            @(posedge clk)
            $fwrite(fileout, "%b\n", out);
        end
        
        // Close the text file and finish the simulation
        $fclose(fileout);
        $finish;
    end
endmodule