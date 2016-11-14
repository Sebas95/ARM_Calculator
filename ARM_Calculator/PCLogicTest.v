`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:35:13 11/14/2016
// Design Name:   PCLogic
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/PCLogicTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCLogic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCLogicTest;

	// Inputs
	reg [3:0] Rd;
	reg RegW;
	reg Branch;

	// Outputs
	wire PCS;

	// Instantiate the Unit Under Test (UUT)
	PCLogic uut (
		.Rd(Rd), 
		.RegW(RegW), 
		.Branch(Branch), 
		.PCS(PCS)
	);

	initial begin
		// Initialize Inputs
		Rd = 4'b0;
		RegW = 0;
		Branch = 0;

		//------------------------------RD = 111

		//-------RegW = 0

		#10;
		
		Rd = 4'b1111;
		RegW = 0;
		Branch = 0;

		//--------RegW = 1

		#10;	

		Rd = 4'b1111;
		RegW = 1;
		Branch = 0;		
		
		//--------Branch = 1

		#10;	

		Rd = 4'b1111;
		RegW = 1;
		Branch = 1;				


		//------------------------------RD = 1011

		//----------------RegW = 0
		
		#10;
		
		Rd = 4'b1011;
		RegW = 0;
		Branch = 0;
		
		//------Branch = 1

		#10;	

		Rd = 4'b1011;
		RegW = 0;
		Branch = 1;			

		//----------------RegW = 1

		#10;	

		Rd = 4'b1011;
		RegW = 1;
		Branch = 0;		

		//------Branch = 1

		#10;	

		Rd = 4'b1011;
		RegW = 0;
		Branch = 1;			
        

	end
      
endmodule

