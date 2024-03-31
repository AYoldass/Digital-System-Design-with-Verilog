`timescale 1ns / 1ps




module memory_unit 
       #(parameter WIDTH = 4,
         parameter DEPTH = 8,
         parameter FETCH = 2'd1,
         parameter WRITE = 2'd2,
         parameter ARRAY_LENGTH = 8
       )(input clk,
         input [1:0] state,
         input [$clog2(DEPTH)-1:0] pointer_a,
         input [$clog2(DEPTH)-1:0] pointer_b,
         output [WIDTH-1:0] content_a,
         output [WIDTH-1:0] content_b);
    
     
     reg [WIDTH-1:0] mem [0:DEPTH-1];
     initial $readmemh("BRAM.mem",mem);  
          
     reg [WIDTH-1:0] content_a_reg;
     reg [WIDTH-1:0] content_b_reg;
     assign content_a = content_a_reg;
     assign content_b = content_b_reg;
     
    always @(posedge clk) begin
      case (state)  
            FETCH: begin
                content_a_reg <= mem[pointer_a];
                content_b_reg <= mem[pointer_b];
            end
            WRITE: begin
                if (content_b < content_a) begin
                    mem[pointer_a] <= content_b;
                    mem[pointer_b] <= content_a;
                end
            end
      endcase
    end
 
 endmodule
