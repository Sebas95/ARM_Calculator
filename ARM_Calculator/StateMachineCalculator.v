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
	 output wire leyendoResultado,
	 output wire guardandoNum1,
	 output wire guardandoNum2,
	 output wire guardandoOP,
	 output wire [31:0] address,
	 output wire [1:0] SEL_DATO,
	 output wire WE
    );
	 
	 
	 localparam INICIO = 4'd0;
	 localparam GET_1ST_NUMBER = 4'd1;
	 localparam SAVE_NUMBER = 4'd2;
	 localparam GET_2ND_NUMBER = 4'd3;
	 localparam FIN = 4'd4;
	 localparam GUARDE_OP   = 4'd5;
	 localparam GUARDE_NUM1 = 4'd6;
	 localparam GUARDE_NUM2 = 4'd7;
	 localparam GET_OP = 4'd8;
	 
	 reg entro = 1'b0;

	 
	 reg [3:0] state = 3'b0;
	 reg [3:0] nextState = 3'b0;
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
							nextState = GET_2ND_NUMBER;
						else
							nextState = GET_1ST_NUMBER;
					end
				GET_2ND_NUMBER:
					begin
						if(rec_num)
							nextState = GET_2ND_NUMBER;
						else if(rec_op && ~entro)
							nextState = GET_OP;
						else
							nextState = GET_2ND_NUMBER;
					end
				GET_OP:
					begin
						if(rec_op && ~entro)
							nextState = GUARDE_NUM1;
						else
							nextState = GET_OP;
					end					
				GUARDE_NUM1:
					nextState = GUARDE_NUM2;
				GUARDE_NUM2:
					nextState = GUARDE_OP;					
				GUARDE_OP:
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
	
assign guardandoNum1     = (state == INICIO)         ?  1'b0 :
									(state == GET_1ST_NUMBER) ?  1'b1 :
									(state == GET_2ND_NUMBER) ?  1'b0 :
									(state == GET_OP) 		  ?  1'b0 :
									(state == GUARDE_NUM1)    ?  1'b0 :
									(state == GUARDE_NUM2)    ?  1'b0 :
									(state == GUARDE_OP  )    ?  1'b0 :
									(state == FIN) 			  ?  1'b0 :
									1'b0;
									
assign guardandoNum2     = (state == INICIO)         ?  1'b0 :
									(state == GET_1ST_NUMBER) ?  1'b0 :
									(state == GET_2ND_NUMBER) ?  1'b1 :
									(state == GET_OP) 		  ?  1'b0 :
									(state == GUARDE_NUM1)    ?  1'b0 :
									(state == GUARDE_NUM2)    ?  1'b0 :
									(state == GUARDE_OP  )    ?  1'b0 :								
									(state == FIN)            ?  1'b0 :
									1'b0;
									
									
assign guardandoOP       = (state == INICIO)         ?  1'b0 :
									(state == GET_1ST_NUMBER) ?  1'b0 :
									(state == GET_2ND_NUMBER) ?  1'b0 :
									(state == GET_OP) 		  ?  1'b1 :									
									(state == GUARDE_NUM1)    ?  1'b0 :
									(state == GUARDE_NUM2)    ?  1'b0 :
									(state == GUARDE_OP  )    ?  1'b0 :							
									(state == FIN)            ?  1'b0 :
									1'b0;
									
assign address           = (state == INICIO)         ?  32'd1 :
									(state == GET_1ST_NUMBER) ?  32'd1 :
									(state == GET_2ND_NUMBER) ?  32'd1 :
									(state == GET_OP) 		  ?  1'b0 :									
									(state == GUARDE_NUM1)    ?  32'd16:
									(state == GUARDE_NUM2)    ?  32'd20:
									(state == GUARDE_OP  )    ?  32'd0 :
									(state == FIN)            ?  32'd1 :
									32'b0;
									
assign leyendoResultado  = (state == INICIO)         ?  1'b0 :
									(state == GET_1ST_NUMBER) ?  1'b0 :
									(state == GET_2ND_NUMBER) ?  1'b0 :
									(state == GET_OP) 		  ?  1'b0 :									
									(state == GUARDE_NUM1)    ?  1'b0 :
									(state == GUARDE_NUM2)    ?  1'b0 :
									(state == GUARDE_OP  )    ?  1'b0 :								
									(state == FIN)            ?  1'b1 :
									1'b0;
									
									
assign SEL_DATO		    = (state == INICIO)         ?  2'b00 :
									(state == GET_1ST_NUMBER) ?  2'b00 :
									(state == GET_2ND_NUMBER) ?  2'b00 :
									(state == GET_OP) 		  ?  2'b00  :									
									(state == GUARDE_NUM1)    ?  2'b01 :
									(state == GUARDE_NUM2)    ?  2'b10 :
									(state == GUARDE_OP  )    ?  2'b11 :								
									(state == FIN)            ?  2'b00 :
									2'b0;
									
assign WE        		    = (state == INICIO)         ?  1'b1 :
									(state == GET_1ST_NUMBER) ?  1'b1 :
									(state == GET_2ND_NUMBER) ?  1'b1 :
									(state == GET_OP) 		  ?  1'b1 :									
									(state == GUARDE_NUM1)    ?  1'b0 :
									(state == GUARDE_NUM2)    ?  1'b0 :
									(state == GUARDE_OP  )    ?  1'b0 :								
									(state == FIN)            ?  1'b1 :
									1'b0;



/*
	always @*	
			case(state)
				INICIO:
					begin
						guardeNum = 1;
						leaResult = 0;					
						address = 32'd0;
					end
				GET_1ST_NUMBER:
					begin
					if(rec_op & ~entro)
						begin
							guardeNum = 0;
							leaResult = 0;
							address = 32'd0;
						end
					else
						begin
							guardeNum = 0;
							leaResult = 0;
							address = 32'd0;							
						end
					end
				GET_2ND_NUMBER:
					begin
					if(rec_op & ~entro)
						begin
							guardeNum = 0;
							leaResult = 1;
							address = 32'd0;							
						end
					else
						begin
							guardeNum = 0;
							leaResult = 0;	
							address = 32'd0;							
						end
					end
				GUARDE_NUM1:
					begin
						guardeNum = 0;
						leaResult = 0;				
						address = 32'd16;
					end
				GUARDE_NUM2:
				begin
						guardeNum = 0;
						leaResult = 0;				
						address = 32'd20;						
				end
				GUARDE_OP: 
					begin
						guardeNum = 1;
						leaResult = 0;					
						address = 32'd0;
					end				
				FIN:
					begin 
						if(rec_op & ~entro) begin
							guardeNum = 0;
							leaResult = 0; 
							address = 32'd0;							
							end
						else 					begin
							guardeNum = 1;
							leaResult = 1; 
							address = 32'd0;							
							end
					end			
				default: 
					begin
						guardeNum = 0;
						leaResult = 0;
						address = 32'd0;						
					end
		endcase
*/
		
	
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
