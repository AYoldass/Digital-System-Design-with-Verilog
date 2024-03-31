`timescale 1ns / 1ps

module temperature_average_tb;

  // Declare signals
  reg clk;
  reg rst;
  reg shift_en;
  reg signed [9:0] tempvalue;
  integer i,f;
  
  // Instantiate the temperature_average module
  temperature_average uut (
    .clk(clk),
    .rst(rst),
    .shift_en(shift_en),
    .tempvalue(tempvalue)
  );
    always #10 clk = ~clk;
    always #10 shift_en = ~shift_en;

  
  // Initial block to initialize inputs
  initial begin
  f = $fopen("temp.txt","w");
    clk=1;
    shift_en = 0;
    rst = 1;
    #20;
    // Apply reset
    rst = 0;
    
    for(i=0; i<14; i=i+1)begin
    @(posedge clk)
    tempvalue = $random;
    $fwrite(f,"%b\n",tempvalue);
    end
    
    $fclose(f);
    #100;
    $finish;
    end
    
endmodule
