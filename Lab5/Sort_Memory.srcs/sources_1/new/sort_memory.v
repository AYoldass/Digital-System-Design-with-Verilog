`timescale 1ns / 1ps



module sort_memory
       #(parameter WIDTH = 4,
         parameter DEPTH = 8,
         parameter IDLE = 2'd0,
         parameter FETCH = 2'd1,
         parameter CHECK = 2'd2,
         parameter FINISH = 2'd3,
         parameter ARRAY_LENGTH = 8
       )(input clk,
         input SORT,
         input [WIDTH-1:0] content_a,
         input [WIDTH-1:0] content_b,
         output [$clog2(DEPTH)-1:0] pointer_a,
         output [$clog2(DEPTH)-1:0] pointer_b,
         output [1:0] state_wire,
         output DONE);
         
     
     reg [1:0] state = IDLE;
     reg DONE_reg = 0; 
     reg swap_flag = 0;
     reg [$clog2(DEPTH)-1:0] pointer_a_reg = 0;
     reg [$clog2(DEPTH)-1:0] pointer_b_reg = 1;
     reg [$clog2(DEPTH)-1:0] pointer_a_backup = 1;
     reg [$clog2(DEPTH)-1:0] pointer_b_backup = 2;
     reg backward_flag = 0;
     
     assign state_wire = state;
     assign DONE = DONE_reg;
     assign pointer_a = pointer_a_reg;
     assign pointer_b = pointer_b_reg;
     
     memory_unit inst0(clk, state_wire, pointer_a, pointer_b, content_a, content_b);
     
    always @(posedge clk) begin
        
        case (state) 
            IDLE: begin
                if (SORT)
                    state <= FETCH;
            end
            
            FETCH: begin
                    state <= CHECK;
            end   
            
            CHECK: begin
                state <= FETCH;   
                if (content_b < content_a) begin
                    pointer_a_reg <= (pointer_a_reg != 0) ?  (pointer_a_reg - 1) : (pointer_a_backup);
                    pointer_b_reg <= (pointer_b_reg != 1) ?  (pointer_b_reg - 1) : (pointer_b_backup);
                    if (pointer_a_reg == 0) backward_flag <= 0;
                    if ((backward_flag == 0) && (pointer_a_reg != 0)) begin
                        backward_flag <= 1;
                        if (pointer_b_reg != (ARRAY_LENGTH - 1)) begin
                            pointer_a_backup <= pointer_a_reg + 1;
                            pointer_b_backup <= pointer_b_reg + 1; end
                        else begin                       
                            pointer_a_backup <= pointer_a_reg;
                            pointer_b_backup <= pointer_b_reg;                        
                        end
                    end                         
                end
                
                else begin             
                    if (pointer_b_reg == (ARRAY_LENGTH - 1)) begin
                        DONE_reg <= 1;
                        state <= FINISH;
                    end 
                   ////////////////////////////             
                    if (backward_flag == 1) begin
                        pointer_a_reg <= pointer_a_backup;
                        pointer_b_reg <= pointer_b_backup;
                        backward_flag <= 0;
                    end
                    else begin
                        pointer_a_reg <= pointer_a_reg + 1;
                        pointer_b_reg <= pointer_b_reg + 1;                    
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
