`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:14:06 11/14/2016 
// Design Name: 
// Module Name:    ALUDecoder 
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
module ALUDecoder(
    input [4:0] Funct,
    input ALUOp,	 
    output wire  NoWrite,
    output wire [1:0] ALUControl,
    output wire [1:0] FlagW
    );
	 
	 assign FlagW = (ALUOp && (Funct[4:1] == 4'b0100) | (Funct[4:1] == 4'b0010) & (Funct[0])) ? 2'b11 : 
						 (ALUOp && (Funct[4:1] == 4'b0000) | (Funct[4:1] == 4'b1100) & (Funct[0])) ? 2'b10 :
						  2'b0;
	
	 assign ALUControl = (ALUOp && (Funct[4:1] == 4'b0100)) ?  2'b01 :
								(ALUOp && (Funct[4:1] == 4'b0010)) ?  2'b10 :
								(ALUOp && (Funct[4:1] == 4'b1100)) ?  2'b11 : 
								2'b00;
						
								

endmodule
