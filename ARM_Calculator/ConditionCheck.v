`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:58 11/13/2016 
// Design Name: 
// Module Name:    ConditionCheck 
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
module ConditionCheck(
	input [3:0]Cond,
	input [3:0]Flags, //NZCV
	output reg CondEx=0
    );
	 

	always@*
		case(Cond)
			4'b0000:
				CondEx <= Flags[2]; //Z
			4'b0001:
				CondEx <= ~Flags[2]; //~Z
			4'b0010:
				CondEx <= Flags[1]; //C
			4'b0011:
				CondEx <= ~Flags[1]; //~C
			4'b0100:
				CondEx <= Flags[3]; //N
			4'b0101:
				CondEx <= ~Flags[3]; //~N
			4'b0110:
				CondEx <= Flags[0]; //V
			4'b0111:
				CondEx <= ~Flags[0]; //~V
			4'b1000:
				CondEx <= ~Flags[2] & Flags[1]; //~Z & C
			4'b1001:
				CondEx <= Flags[2] | ~Flags[1]; //Z | ~C
			4'b1010:
				CondEx <= ~(Flags[3] ^ Flags[0]); //~(N^V)
			4'b1011:
				CondEx <= Flags[3] ^ Flags[0]; //N^V
			4'b1100:
				CondEx <= ~Flags[2] & ~(Flags[3] ^ Flags[0]); //~Z & ~(N^V)
			4'b1101:
				CondEx <= Flags[2] | (Flags[3] ^ Flags[0]); //Z | (N^V)
			4'b1110:
				CondEx <= 1'b0;
			4'b1111:
				CondEx <= 1'b0;
		endcase


endmodule
