`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:03:42 11/11/2016
// Design Name:   Fetch
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/FetchTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FetchTest;

	// Inputs
	reg PCSrc;
	reg clk = 0;
	reg [31:0] PCBranch;

	// Outputs
	wire [31:0] PCPlus4;
	wire [31:0] Instr;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.PCSrc(PCSrc), 
		.clk(clk), 
		.PCBranch(PCBranch), 
		.PCPlus4(PCPlus4), 
		.Instr(Instr)
	);
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		PCSrc = 0;
		PCBranch = 0;

		// Wait 100 ns for global reset to finish
		#400;
		
		PCSrc = 1;
		PCBranch = 32'b0;

		// Wait 100 ns for global reset to finish
		#100;		
        
		// Add stimulus here

	end
      
endmodule

