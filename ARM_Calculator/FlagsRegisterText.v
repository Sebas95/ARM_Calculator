`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:22:53 11/10/2016
// Design Name:   FlagsRegister
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/FlagsRegisterText.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FlagsRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FlagsRegisterText;

	// Inputs
	reg [31:0] Di;
	reg clk;
	reg enable;

	// Outputs
	wire [31:0] Do;

	// Instantiate the Unit Under Test (UUT)
	FlagsRegister uut (
		.Di(Di), 
		.clk(clk), 
		.enable(enable), 
		.Do(Do)
	);

	initial begin
		// Initialize Inputs
		Di = 0;
		clk = 0;
		enable = 1;
		// Wait 100 ns for global reset to finish
		#75;

		Di = 32'd546;
		clk = 1;
		enable = 1;		        
		
		#75;

		Di = 32'd999;
		clk = 0;
		enable = 0;	
		
		#75;

		Di = 32'd777;
		clk = 1;
		enable = 0;		
		
		#75;

		Di = 32'd555;
		clk = 0;
		enable = 1;		
		
		#75;
		Di = 32'd555;
		clk = 1;
		enable = 1;	
		
		#75;

		Di = 32'd333;
		clk = 0;
		enable = 0;				
		
		#75;

		Di = 32'd333;
		clk = 1;
		enable = 0;		
		// Add stimulus here
	end      
endmodule

