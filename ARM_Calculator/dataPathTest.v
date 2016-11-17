`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:36:01 11/16/2016
// Design Name:   MicroProcessor
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/dataPathTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MicroProcessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dataPathTest;

	// Inputs
	reg CLK;
	reg PCSrc;
	reg MemtoReg;
	reg MemWrite;
	reg [1:0] ALUControl;
	reg [1:0] ALUSrc;
	reg [1:0] ImmSrc;
	reg RegWrite;
	reg [1:0] RegSrc;

	// Outputs
	wire [3:0] ALUFlags;
	wire [31:0] Instr;
	wire [31:0] ReadData;
	wire [31:0] RD2;
	wire [31:0] ALUResult;
	wire [31:0] SrcB;
	wire [31:0] RD1;
	wire [3:0] RA1;

	// Instantiate the Unit Under Test (UUT)
	MicroProcessor uut (
		.CLK(CLK), 
		.PCSrc(PCSrc), 
		.MemtoReg(MemtoReg), 
		.MemWrite(MemWrite), 
		.ALUControl(ALUControl), 
		.ALUSrc(ALUSrc), 
		.ImmSrc(ImmSrc), 
		.RegWrite(RegWrite), 
		.RegSrc(RegSrc), 
		.ALUFlags(ALUFlags), 
		.Instr(Instr), 
		.ReadData(ReadData), 
		.RD2(RD2), 
		.ALUResult(ALUResult), 
		.SrcB(SrcB), 
		.RD1(RD1), 
		.RA1(RA1)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		PCSrc = 0;
		MemtoReg = 0;
		MemWrite = 0;
		ALUControl = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		RegWrite = 0;
		RegSrc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		CLK = 1;
		PCSrc = 0;
		MemtoReg = 0;
		MemWrite = 1;
		ALUControl = 2'b11;
		ALUSrc = 1;
		ImmSrc = 2'b00;
		RegWrite = 0;
		RegSrc = 2'b10;		
		
		#50 CLK = 0;
		
		#50 CLK = 1;
		PCSrc = 0;
		MemtoReg = 0;
		MemWrite = 1;
		ALUControl = 2'b11;
		ALUSrc = 1;
		ImmSrc = 2'b00;
		RegWrite = 0;
		RegSrc = 2'b10;		
		#50 CLK = 0;
        
		// Add stimulus here

	end
      
endmodule

