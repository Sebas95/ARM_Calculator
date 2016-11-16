`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:23 11/14/2016 
// Design Name: 
// Module Name:    MicroProcessor 
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
module MicroProcessor(
	 input CLK,
	 input wire PCSrc,
	 input wire MemtoReg,
    input wire MemWrite,	 
	 input wire [1:0]ALUControl,
	 input wire [1:0]ALUSrc,
	 input wire [1:0]ImmSrc,
    input wire RegWrite, 
	 input wire [1:0]RegSrc,
	 output wire [3:0]ALUFlags,
  	 output wire [31:0]Instr,
	 output wire [31:0]ReadData,
	 output wire [31:0]RD2,
	 output wire [31:0]ALUResult,
	 output wire [31:0] SrcB,
	 output wire [31:0]RD1,
	 output wire [3:0] RA1
	 
	 );
	 wire [31:0]Result;
	 wire [31:0]PCPlus4; 
	 
	 

	 
	 
	 
	/*Control_Unit controlUnit(
		 .CLK(CLK),
		 .Cond(Instr[31:28]),
		 .ALUFlags(ALUFlags),
		 .Op(Instr[27:26]),
		 .Funct(Instr[25:20]),
		 .Rd(Instr[15:12]),
		 .PCSrc(PCSrc),
		 .RegWrite(RegWrite),
		 .MemWrite(MemWrite),
		 .MemtoReg(MemtoReg),
		 .ALUSrc(ALUSrc),
		 .ImmSrc(ImmSrc),
		 .RegSrc(RegSrc),
		 .ALUControl(ALUControl) 
    );*/
	 
	 
	 Fetch fetch(
		.PCSrc(PCSrc),
		.clk(CLK),
		.PCBranch(Result),
		//out
		.PCPlus4(PCPlus4),
		.Instr(Instr)
    );
	 
	
	 
	 Decode decode(
		.clk(CLK),
		.Rn(Instr[19:16]),
		.Rm(Instr[3:0]),
		.Rd(Instr[15:12]),
		.WD3(Result),
		.PCPlus4(PCPlus4),
		.WE3(RegWrite),
		.RegSrc(RegSrc),
		//out
		.RD1(RD1),
		.RD2(RD2),
		.RA1(RA1)
    );
	Execution execution(
		.RD1(RD1),
		.RD2(RD2),
		.Imm(Instr[23:0]),
		.ALUSrc(ALUSrc),
		.ImmSrc(ImmSrc),
		.ALUControl(ALUControl),
		//out
		.ALUFlags(ALUFlags),
		.ALUResult(ALUResult),
		.SrcB(SrcB)
    ); 
	 
	
	Mem memory(
		.clk(CLK),
		.ALUResult(ALUResult),
		.WD(RD2),
		.MemWrite(MemWrite), 
		//out
		.ReadData(ReadData)	 	 
    );
	 
	  WriteBack write_back(
		.ReadData(ReadData),
		.ALUResult(ALUResult), 
		.MemtoReg(MemtoReg),
		//out
		.Result(Result)
    );
	
	 

endmodule
