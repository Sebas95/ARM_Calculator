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
	reg CLK=0;

	// Outputs
	wire [31:0] ReadData;
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

	// Instantiate the Unit Under Test (UUT)
	SingleCycleuProcessor uut (
		.CLK(CLK), 
		.ReadData(ReadData), 
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
		.Instr(Instr)
	);
	always #5 CLK=~CLK;
	initial begin
		// Initialize Inputs
	

		// Wait 100 ns for global reset to finish
		//#100;
   //     
		// Add stimulus here

	end
      
endmodule

