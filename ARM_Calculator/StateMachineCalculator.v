`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:17 11/17/2016 
// Design Name: 
// Module Name:    StateMachineCalculator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module StateMachineCalculator(
    input clk,
	 input rec_op,
	 input rec_num,
	 output reg guardeNum,
	 output reg leaResult,
	 output reg guardeNumProcessor,
	 output reg guardeOpProcessor,
	 output reg [31:0] address = 0
    );
	 
	 localparam INICIO = 3'd0;
	 localparam GET_1ST_NUMBER = 3'd1;
	 localparam SAVE_NUMBER = 3'd2;
	 localparam GET_2ND_NUMBER = 3'd3;
	 localparam FIN = 3'd4;
	 localparam GUARDE_OP = 3'd5;
	 localparam GUARDE_NUM1 = 3'd6;
	 localparam GUARDE_NUM2 = 3'd7;
	 
	reg entro = 1'b0;

	 
	 reg [2:0] state = 3'b0;
	 reg [2:0] nextState = 3'b0;
	 //-----------------Logica de estados
	 always @*
			case(state)
				INICIO:
					begin
						nextState = GET_1ST_NUMBER;
					end
				GET_1ST_NUMBER:
					begin
						if(rec_num)
							nextState = GET_1ST_NUMBER;
						else if(rec_op && ~entro)
							nextState = GUARDE_NUM1;
						else
							nextState = GET_1ST_NUMBER;
					end
				GUARDE_NUM1:
					nextState = GUARDE_OP;
				GUARDE_OP:
					nextState = GET_2ND_NUMBER;
				GET_2ND_NUMBER:
					begin
						if(rec_num)
							nextState = GET_2ND_NUMBER;
						else if(rec_op && ~entro)
							nextState = GUARDE_NUM2;
						else
							nextState = GET_2ND_NUMBER;
					end
				GUARDE_NUM2:
					nextState = FIN;					
				FIN:
					begin 
						if(rec_op & ~entro) 
							nextState = INICIO;
						else 
							nextState = FIN;						
					end
				default: nextState = INICIO;						
			endcase
	//----------------Logica de salida
	always @*	
			case(state)
				INICIO:
					begin
						guardeNum = 1;
						leaResult = 0;					
							guardeNumProcessor = 0;
							guardeOpProcessor = 0;	
							address = 32'd0;
					end
				GET_1ST_NUMBER:
					begin
					if(rec_op & ~entro)
						begin
							guardeNum = 0;
							leaResult = 0;
							guardeNumProcessor = 0;
							guardeOpProcessor = 0;	
							address = 32'd0;
						end
					else
						begin
							guardeNum = 0;
							leaResult = 0;
							guardeNumProcessor = 0;
							guardeOpProcessor = 0;	
							address = 32'd0;							
						end
					end
				GUARDE_NUM1:
				begin
							guardeNum = 0;
							leaResult = 0;				
						guardeNumProcessor = 1;
						guardeOpProcessor = 0;	
						address = 32'd16;
				end
				GUARDE_OP: 
					begin
							guardeNum = 1;
							leaResult = 0;					
						guardeNumProcessor = 0;
						guardeOpProcessor = 1;
						address = 32'd0;
					end
				GET_2ND_NUMBER:
					begin
					if(rec_op & ~entro)
						begin
							guardeNum = 0;
							leaResult = 1;
							guardeNumProcessor = 0;
							guardeOpProcessor = 0;	
							address = 32'd0;							
						end
					else
						begin
							guardeNum = 0;
							leaResult = 0;
							guardeNumProcessor = 0;
							guardeOpProcessor = 0;	
							address = 32'd0;							
						end
					end
				GUARDE_NUM2:
				begin
							guardeNum = 0;
							leaResult = 0;				
						guardeNumProcessor = 1;
						guardeOpProcessor = 0;	
						address = 32'd20;						
				end
				FIN:
					begin 
						if(rec_op & ~entro) begin
							guardeNum = 0;
							leaResult = 0; 
							guardeNumProcessor = 0;
							guardeOpProcessor = 0;	
							address = 32'd0;							
							end
						else 					begin
							guardeNum = 1;
							leaResult = 1; 
							guardeNumProcessor = 0;
							guardeOpProcessor = 0;	
							address = 32'd0;							
							end
					end			
				default: 
					begin
						guardeNum = 0;
						leaResult = 0;
							guardeNumProcessor = 0;
							guardeOpProcessor = 0;
							address = 32'd0;							
					end
		endcase

		
	
	always @(posedge clk)	
		if(rec_op)
			begin
				state <= nextState;
				entro <= 1;
			end
		else
			begin
				state <= nextState;
				entro <= 0;
			end		

endmodule
