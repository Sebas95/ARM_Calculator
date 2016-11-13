`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:28:15 11/12/2016
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
	reg clk;
	reg [31:0] ALUResult;
	reg [31:0] WD;
	reg MemWrite;
	reg MemtoReg;

	// Outputs
	wire [31:0] Result;

	// Instantiate the Unit Under Test (UUT)
	WriteBack uut (
		.clk(clk), 
		.ALUResult(ALUResult), 
		.WD(WD), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.Result(Result)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ALUResult = 0;
		WD = 0;
		MemWrite = 0;
		MemtoReg = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

