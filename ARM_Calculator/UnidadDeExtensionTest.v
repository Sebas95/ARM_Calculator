`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:55:58 11/10/2016
// Design Name:   UnidadDeExtension
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/UnidadDeExtensionTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UnidadDeExtension
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UnidadDeExtensionTest;

	// Inputs
	reg [23:0] dataI;
	reg ExtImm;

	// Outputs
	wire [31:0] dataO;

	// Instantiate the Unit Under Test (UUT)
	UnidadDeExtension uut (
		.dataI(dataI), 
		.ExtImm(ExtImm),
		.dataO(dataO)
	);

	initial begin
		// Initialize Inputs
		dataI = 0;
		ExtImm = 1;
		// Wait 100 ns for global reset to finish
		#50;
		dataI = 24'd543;
		// Wait 100 ns for global reset to finish
		#50;
		dataI = 24'd3;
		// Wait 100 ns for global reset to finish
		#50;
		dataI = -24'd543;
		// Wait 100 ns for global reset to finish
		#50;		
		dataI = -24'd543;
		// Wait 100 ns for global reset to finish
		#50;	
		dataI = 24'd1;
		// Wait 100 ns for global reset to finish
		#50;			
      dataI = -24'd1;  
		// Add stimulus here

	end
      
endmodule

