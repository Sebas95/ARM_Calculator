`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:03:38 11/14/2016
// Design Name:   ConditionCheck
// Module Name:   C:/Users/Sebastian/Documents/GitHub/ARM_Calculator/ARM_Calculator/ConditionCheck_test.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ConditionCheck
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ConditionCheck_test;

	// Inputs
	reg [3:0] Cond;
	reg [3:0] Flags;

	// Outputs
	wire CondEx;

	// Instantiate the Unit Under Test (UUT)
	ConditionCheck uut (
		.Cond(Cond), 
		.Flags(Flags), 
		.CondEx(CondEx)
	);

	initial begin
		// Initialize Inputs
		Cond = 4'b0000;
		Flags = 4'b0000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		Cond = 4'b0001;
		Flags = 4'b0100;
		#100;
		Cond = 4'b0001;
		Flags = 4'b0000;
		#100;
	end
      
endmodule

