`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:11 11/10/2016 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(
    input  wire [1:0]Op,
    input  wire [5:0]Funct,
    input  wire [3:0]Rd,
	 output wire [1:0]FlagW,
	 output wire PCS,
	 output wire RegW,
	 output wire MemW,
	 output wire MemtoReg,
	 output wire [1:0]ALUSrc,
	 output wire [1:0]ImmSrc,
	 output wire [1:0]RegSrc,
	 output wire [1:0]ALUControl
    );
	 
	ALUDecoder ALUDecoder (
		.Funct(Funct[4:0]), 
		.ALUOp(ALUOp), 
		.ALUControl(ALUControl), 
		.FlagW(FlagW)
	);	
	 
	MainDecoder MainDecoder (
		.Op(Op), 
		.Funct(Funct), 
		.RegW(RegW), 
		.MemW(MemW), 
		.MemtoReg(MemtoReg), 
		.ALUSrc(ALUSrc), 
		.ImmSrc(ImmSrc), 
		.RegSrc(RegSrc), 
		.Branch(Branch), 
		.ALUOp(ALUOp)
	);	 
	
	
	PCLogic PCLogic (
		.Rd(Rd), 
		.RegW(RegW), 
		.Branch(Branch), 
		.PCS(PCS)
	);	 	
	
endmodule
