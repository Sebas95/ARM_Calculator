`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:14:45 11/10/2016 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
	 input CLK,
    input [3:0] Cond,
    input [3:0] ALUFlags,
	 input [1:0]Op,
    input [5:0]Funct,
    input [3:0]Rd,
	 output wire PCSrc,
    output wire RegWrite,
    output wire MemWrite,
	 output wire MemtoReg,
	 output wire [1:0]ALUSrc,
	 output wire [1:0]ImmSrc,
	 output wire [1:0]RegSrc,
	 output wire [1:0]ALUControl
	 
    );
	 
	 wire [1:0]FlagW;
	 wire PCS,RegW,MemW;
	 
	ConditionalLogic Conditional_Logic (
		 .Cond(Cond),
		 .ALUFlags(ALUFlags),
		 .FlagW(FlagW),
		 .PCS(PCS),
		 .RegW(RegW),
		 .MemW(MemW),
		 .CLK(CLK),
		 //out
		 .PCSrc(PCSrc),
		 .RegWrite(RegWrite),
		 .MemWrite(MemWrite)
		 );
	 Decoder decoder(
		 .Op(Op),
		 .Funct(Funct),
		 .Rd(Rd),
		 .FlagW(FlagW),
		 .PCS(PCS),
		 .RegW(RegW),
		 .MemW(MemW),
		 //out
		 .MemtoReg(MemtoReg),
		 .ALUSrc(ALUSrc),
		 .ImmSrc(ImmSrc),
		 .RegSrc(RegSrc),
		 .ALUControl(ALUControl)
		 );



endmodule
