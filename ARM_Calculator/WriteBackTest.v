`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:49:57 11/13/2016
// Design Name:   WriteBack
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/WriteBackTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WriteBack
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WriteBackTest;

	// Inputs
	reg [31:0] ReadData;
	reg [31:0] ALUResult;
	reg MemtoReg;

	// Outputs
	wire [31:0] Result;

	// Instantiate the Unit Under Test (UUT)
	WriteBack uut (
		.ReadData(ReadData), 
		.ALUResult(ALUResult), 
		.MemtoReg(MemtoReg), 
		.Result(Result)
	);

	initial begin
		// Initialize Inputs
		ReadData = 0;
		ALUResult = 0;
		MemtoReg = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		ReadData = 32'd877865;
		ALUResult = 32'd3425234235;
		MemtoReg = 0;

		// Wait 100 ns for global reset to finish
		#100;		
		
		ReadData = 32'd877865;
		ALUResult = 32'd3425234235;
		MemtoReg = 1;

		// Wait 100 ns for global reset to finish
		#100;	
		     

	end
      
endmodule

