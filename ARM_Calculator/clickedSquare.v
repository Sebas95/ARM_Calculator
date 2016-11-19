`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:26:11 10/23/2016 
// Design Name: 
// Module Name:    clickedSquare 
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
module clickedSquare(
    input wire [2:0] clicked,
    input wire [9:0] Xlocation,
    input wire [8:0] Ylocation,
	 output reg newDigit,
	 output reg newOp,
    output reg [3:0] clickedMatrix = 0
    );
	 
	//Ubicacion de la calculadora	
	localparam NUMERAL_X = 175;
	localparam NUMERAL_Y = 190;
	localparam ANCHOCASILLAS = 63;
	
	always@*
	//-----------------------------------Numeros -----------------------------
	//Cuadro 7
		if(clicked && (Xlocation > NUMERAL_X) && (Xlocation < NUMERAL_X + ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y) && (Ylocation < NUMERAL_Y + ANCHOCASILLAS))
			begin clickedMatrix = 4'd7;
			newOp = 1'b0;
			newDigit = 1'b1;end
	//Cuadro 8 
		else if(clicked && (Xlocation > NUMERAL_X + ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 2*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y) && (Ylocation < NUMERAL_Y + ANCHOCASILLAS))
			begin clickedMatrix = 4'd8;	
			newOp = 1'b0;			
			newDigit = 1'b1;end
	//Cuadro 9
		else if(clicked && (Xlocation > NUMERAL_X + 2*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 3*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y) && (Ylocation < NUMERAL_Y + ANCHOCASILLAS))
			begin clickedMatrix = 4'd9;
			newOp = 1'b0;						
			newDigit = 1'b1;end
	//Cuadro 4
		else if(clicked && (Xlocation > NUMERAL_X) && (Xlocation < NUMERAL_X + ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 2*ANCHOCASILLAS))
			begin clickedMatrix = 4'd4;	
			newOp = 1'b0;			
			newDigit = 1'b1;		end	
	//Cuadro 5
		else if(clicked && (Xlocation > NUMERAL_X + ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 2*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 2*ANCHOCASILLAS))
			begin clickedMatrix = 4'd5;	
			newOp = 1'b0;						
			newDigit = 1'b1;end
	//Cuadro 6
		else if(clicked && (Xlocation > NUMERAL_X + 2*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 3*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 2*ANCHOCASILLAS))
			begin clickedMatrix = 4'd6;	
			newOp = 1'b0;						
			newDigit = 1'b1;end
	//Cuadro 1
		else if(clicked && (Xlocation > NUMERAL_X) && (Xlocation < NUMERAL_X + ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + 2*ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 3*ANCHOCASILLAS))
			begin clickedMatrix = 4'd1;	
			newOp = 1'b0;						
			newDigit = 1'b1;end
	//Cuadro 2
		else if(clicked && (Xlocation > NUMERAL_X + ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 2*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + 2*ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 3*ANCHOCASILLAS))
			begin clickedMatrix = 4'd2;	
			newOp = 1'b0;						
			newDigit = 1'b1;	end		
	//Cuadro 3
		else if(clicked && (Xlocation > NUMERAL_X + 2*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 3*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + 2*ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 3*ANCHOCASILLAS))
			begin clickedMatrix = 4'd3;
			newOp = 1'b0;						
			newDigit = 1'b1;end
	//Cuadro 0
		else if(clicked && (Xlocation > NUMERAL_X) && (Xlocation < NUMERAL_X + ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + 3*ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 4*ANCHOCASILLAS))
			begin clickedMatrix = 4'd0;	
			newOp = 1'b0;						
			newDigit = 1'b1;end
	//-------------------------------------Operaciones----------------------------------------------------
	//Cuadro + Cod: 1010
		else if(clicked && (Xlocation > NUMERAL_X + 3*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 4*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 2*ANCHOCASILLAS))
			begin clickedMatrix = 4'd2;
			newDigit = 1'b0;			
			newOp = 1'b1;end
	//Cuadro - Cod: 1011
		else if(clicked && (Xlocation > NUMERAL_X + 4*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 5*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 2*ANCHOCASILLAS))
			begin clickedMatrix = 4'd3;		
			newDigit = 1'b0;			
			newOp = 1'b1;end
	//Cuadro * Cod:1100
		else if(clicked && (Xlocation > NUMERAL_X + 3*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 4*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y) && (Ylocation < NUMERAL_Y + ANCHOCASILLAS))
			begin clickedMatrix = 4'd1;
			newDigit = 1'b0;			
			newOp = 1'b1; end
	//Cuadro / Cod:1101
		else if(clicked && (Xlocation > NUMERAL_X + 4*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 5*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y) && (Ylocation < NUMERAL_Y + ANCHOCASILLAS))
			begin clickedMatrix = 4'd4;	
			newDigit = 1'b0;
			newOp = 1'b1; end
	//Cuadro = Cod
		else if(clicked && (Xlocation > NUMERAL_X + 4*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 5*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + 2*ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 3*ANCHOCASILLAS))
			begin clickedMatrix = 4'd14;	
			newDigit = 1'b0;			
			newOp = 1'b1; end
	//Si ninguno es clickeado
		else
			begin  clickedMatrix = 4'b0;	
			newOp = 1'b0;
			newDigit = 1'b0; end
endmodule
