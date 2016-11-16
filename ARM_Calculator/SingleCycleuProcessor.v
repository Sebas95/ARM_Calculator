`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:50:16 11/15/2016 
// Design Name: 
// Module Name:    SingleCycleuProcessor 
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
module SingleCycleuProcessor(
		input CLK,
		output wire [31:0]ReadData,
		output wire [31:0]RD2,
		output wire PCSrc,
		output wire MemtoReg,
		output wire MemWrite,	 
		output wire [1:0]ALUControl,
		output wire [1:0]ALUSrc,
		output wire [1:0]ImmSrc,
		output wire RegWrite,
		output wire [1:0]RegSrc,
		output wire [3:0]ALUFlags,
		output wire [31:0]Instr,
		output wire [31:0]ALUResult
	 
    );
	
	 /*wire PCSrc;
	 wire MemtoReg;
    wire MemWrite;	 
	 wire [1:0]ALUControl;
	 wire [1:0]ALUSrc;
	 wire [1:0]ImmSrc;
    wire RegWrite; 
	 wire [1:0]RegSrc;
	 wire [3:0]ALUFlags;
	 wire [31:0]Instr;*/
	 
	Control_Unit control_unit(
		.CLK(CLK),
		.Cond(Instr[31:28]),
		.ALUFlags(ALUFlags),
		.Op(Instr[27:26]),
		.Funct(Instr[25:20]),
		.Rd(Instr[15:12]),
		//out
		.PCSrc(PCSrc),
		.RegWrite(RegWrite),
		.MemWrite(MemWrite),
		.MemtoReg(MemtoReg),
		.ALUSrc(ALUSrc),
		.ImmSrc(ImmSrc),
		.RegSrc(RegSrc),
		.ALUControl(ALUControl)
    );

	MicroProcessor dataPath(
		.CLK(CLK),
		.PCSrc(PCSrc),
		.MemtoReg(MemtoReg),
		.MemWrite(MemWrite),	 
		.ALUControl(ALUControl),
		.ALUSrc(ALUSrc),
		.ImmSrc(ImmSrc),
		.RegWrite(RegWrite), 
		.RegSrc(RegSrc),
	 //out
		.ALUFlags(ALUFlags),
		.Instr(Instr),
		.ReadData(ReadData),
		.RD2(RD2),
		.ALUResult(ALUResult)
	 );
	 
	 

endmodule
