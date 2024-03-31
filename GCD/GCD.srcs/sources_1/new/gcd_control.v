`timescale 1ns / 1ps
module gcd_control(
    input clk,
	input clr,
	input eqflg,
	input ltflg,
	output reg stop,
	output reg xld,
	output reg yld,
	output reg xmsel,
	output reg ymsel,
	output reg gld);

reg [2:0] current_state, next_state;
parameter start = 3'b000, 
           input1 = 3'b001, 
           test1 = 3'b010, 
           test2 = 3'b011, 
           update1 = 3'b100, 
           update2 = 3'b101, 
           done = 3'b110;

always @(posedge clk) begin
	    if(clr) begin
	        current_state <= start;
	        stop <= 0;
	        end
	    else
	        current_state <= next_state;
	    end

always @(*) begin 
		case(current_state)
			start:
				next_state <= input1;
			input1: begin
			    next_state <= test1;
			    xmsel <= 1;
			    ymsel <= 1; 
			    xld <= 1;
			    yld <= 1; 
			    end
			test1: begin
			    xmsel <= 0;
			    ymsel <= 0; 
			    xld <= 0;
			    yld <= 0;
			    if(eqflg == 1)
					next_state <= done;
		        else
				    next_state <= test2;
				 end
			test2:begin
			    xmsel <= 0;
			    ymsel <= 0; 
			    xld <= 0;
			    yld <= 0;
			     if(eqflg == 1)
					next_state <= done;
		        else if(ltflg == 1)
				    next_state <= update1;
				else
					next_state <= update2;
					end
			update1: begin
				next_state <= test1;
				yld <= 1;
			    xld <= 0;
			    ymsel <= 0;
			    end
			update2:begin
			     xld <= 1;
			    yld <= 0;
			    xmsel <= 0;
				next_state <= test1;
				end
			done: begin
				next_state <= done;
				gld <= 1;
			    stop <= 1;
			    end
			default:
				next_state = start;
		endcase
	end
endmodule
