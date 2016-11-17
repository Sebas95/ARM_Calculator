`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:35:58 11/16/2016
// Design Name:   SingleCycleuProcessor
// Module Name:   C:/Users/Sebastian/Documents/GitHub/ARM_Calculator/ARM_Calculator/processor_test.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SingleCycleuProcessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module processor_test;

	// Inputs
	reg CLK;

	// Outputs
	//wire [31:0] ReadData;
	wire [31:0] RD2;
	wire PCSrc;
	wire MemtoReg;
	wire MemWrite;
	wire [1:0] ALUControl;
	wire [1:0] ALUSrc;
	wire [1:0] ImmSrc;
	wire RegWrite;
	wire [1:0] RegSrc;
	wire [3:0] ALUFlags;
	wire [31:0] Instr;
	wire [31:0]ALUResult;
	wire [31:0] SrcB;
	wire [31:0]RD1;
	wire [3:0]RA1;
	wire [31:0]Result;

	// Instantiate the Unit Under Test (UUT)
	SingleCycleuProcessor uut (
		.CLK(CLK), 
	//	.ReadData(ReadData), 
		.RD2(RD2), 
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
		.ALUResult(ALUResult),
		.SrcB(SrcB),
		.RD1(RD1),
		.RA1(RA1),
		.Result(Result)
	);
	integer x =1;
	//always #50 CLK=~CLK;
	initial begin
		// Initialize Inputs
	

		// Wait 100 ns for global reset to finish
		
      CLK=0;
		#100;

		for(x=1 ; x<111 ; x =x+1)
		begin
		CLK=1;
		#5;
		CLK=0;
		#5;
		
		end
		// Add stimulus here

	end
      
endmodule

