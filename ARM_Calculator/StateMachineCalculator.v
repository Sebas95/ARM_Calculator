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
    input [3:0] clickedMatrix,
	 input rec_op,
	 input rec_num,
	 input finishSave,
    output [3:0] num1,
    output [3:0] num2,
    output [3:0] op,
	 output save,
    );
	 
	 localparam INICIO = 3'd0;
	 localparam GET_1ST_NUMBER = 3'd1;
	 localparam SAVE_NUMBER = 3'd2;
	 localparam GET_2ND_NUMBER = 3'd3;
	 localparam FIN = 3'd4;
	 
	 reg [2:0] state = 3'b0;
	 reg [2:0] nextState = 3'b0;
	 
	 always @*
			case(state)
				INICIO:
					begin
						nextState <= GET_1ST_NUMBER;
					end
				GET_1ST_NUMBER:
					begin
						if(rec_num)
							nextState <= GET_1ST_NUMBER;
						else if(rec_op)
							nextState <= SAVE_NUMBER;
					end
				SAVE_NUMBER:
					begin
						if(have2)
							if(finishSave)
								nextState <= FIN;
							else 
								nextState <= SAVE_NUMBER;							
						else
							if(finishSave)
								nextState <= GET_2ND_NUMBER;
							else 
								nextState <= SAVE_NUMBER;
					end
				GET_2ND_NUMBER:
					begin
						if(rec_num)
							nextState <= GET_2ND_NUMBER;
						else if(rec_op)
							nextState <= SAVE_NUMBER;
						else
							nextState <= GET_2ND_NUMBER;
					end
				FIN:
					begin 
						if(rec_num | rec_op)
							nextState <= INICIO;
						else 
							nextState <= FIN;						
					end
			endcase
		
	always @*	
			case(state)
				INICIO:
					begin
					end
				GET_1ST_NUMBER:
					begin
					end
				SAVE_NUMBER:
					begin
					end
				GET_2ND_NUMBER:
					begin
					end
				FIN:
					begin 
					end			
		endcase


endmodule
