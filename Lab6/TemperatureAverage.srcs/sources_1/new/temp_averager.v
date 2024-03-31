`timescale 1ns / 1ps



module temperature_average(
    input clk,
    input rst,
    input shift_en,
    input signed [9:0] tempvalue 
    );
    
    reg signed [9:0] Ra; 
    reg signed [9:0] Rb; 
    reg signed [9:0] Rc; 
    reg signed [9:0] Rd; 
    
    reg signed [11:0] sum; 
    reg signed [9:0] average; 
    reg signed [10:0] rounded; 
    reg signed [9:0] truncated; 
    
    always@(posedge clk) begin
        if(rst == 1'b1) begin
            Ra <= {10{1'b0}};
            Rb <= {10{1'b0}};
            Rc <= {10{1'b0}};
            Rd <= {10{1'b0}};
            average <= 'd0;
        end else begin
            Rd <= Rc;
            Rc <= Rb;
            Rb <= Ra;
            Ra <= tempvalue;
        end
    end
    
    always@(*) begin
        sum = Ra+Rb+Rc+Rd;
        if((average==1'b0) &&(rounded==1'b1))
        rounded[10] = 1'b0;
        else
        rounded[10] = rounded[9];
    end
    
    always@(*) begin
        if(shift_en == 1'b1) begin
            average = sum >>> 2'b10 ;
            
        end else begin
            average = average;
        end
    end
    
    always@(posedge clk) begin
       rounded[9:0] <=  average + 1'b1 ;//{4{4'b0100}}
       truncated <= rounded[10:1];
    end
endmodule