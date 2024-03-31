`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2023 07:44:13 PM
// Design Name: 
// Module Name: memory_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module memory_unit 
       #(parameter WIDTH = 4,
         parameter DEPTH = 8,
         parameter IDLE = 2'd0,
         parameter FETCH = 2'd1,
         parameter CHECK = 2'd2,
         parameter FINISH = 2'd3,
         parameter ARRAY_LENGTH = 8
       )(input clk,
         input SORT,
         output DONE);
    
     
     reg [WIDTH-1:0] mem [0:DEPTH-1];
     initial $readmemh("BRAM.mem",mem);       

     reg DONE_reg = 0; 
     reg swap_flag = 0;
     reg [WIDTH-1:0] content_a;
     reg [WIDTH-1:0] content_b;
     reg [$clog2(DEPTH)-1:0] pointer_a = 0;
     reg [$clog2(DEPTH)-1:0] pointer_b = 1;
     reg [$clog2(DEPTH)-1:0] pointer_a_backup;
     reg [$clog2(DEPTH)-1:0] pointer_b_backup;
     reg backward_flag = 0;
     reg [1:0] state = IDLE;
    
     assign DONE = DONE_reg;
     
    always @(posedge clk) begin
        
        case (state) 
            IDLE: begin
                if (SORT)
                    state <= FETCH;
            end
            FETCH: begin 
                content_a <= mem[pointer_a];
                content_b <= mem[pointer_b];
                state <= CHECK;
            end
            
            CHECK: begin
                state <= FETCH;   
                if (content_b < content_a) begin
                    mem[pointer_a] <= content_b;
                    mem[pointer_b] <= content_a;
                    pointer_a <= (pointer_a != 0) ?  (pointer_a - 1) : (pointer_a + 1);
                    pointer_b <= (pointer_b != 1) ?  (pointer_b - 1) : (pointer_b + 1);
                    if ((backward_flag == 0) && (pointer_a != 0)) begin
                        backward_flag <= 1;
                        if (pointer_b != (ARRAY_LENGTH - 1)) begin
                            pointer_a_backup <= pointer_a + 1;
                            pointer_b_backup <= pointer_b + 1; end
                        else begin                       
                            pointer_a_backup <= pointer_a;
                            pointer_b_backup <= pointer_b;                        
                        end
                    end                         
                end
                
                else begin             
                    if (pointer_b == (ARRAY_LENGTH - 1)) begin
                        DONE_reg <= 1;
                        state <= FINISH;
                    end 
                   ////////////////////////////             
                    if (backward_flag == 1) begin
                        pointer_a <= pointer_a_backup;
                        pointer_b <= pointer_b_backup;
                        backward_flag <= 0;
                    end
                    else begin
                        pointer_a <= pointer_a + 1;
                        pointer_b <= pointer_b + 1;                    
                    end   
                    ///////////////////////////                                 
                end                                    
            end
            
            FINISH: begin
                state <= IDLE;   /// SORTING ENDS
                DONE_reg <= 0;
            end
        endcase
    end 
 
 endmodule
