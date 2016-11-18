`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:57:22 11/17/2016
// Design Name:   StateMachineCalculator
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/testMachine.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StateMachineCalculator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testMachine;

	// Inputs
	reg clk = 0;
	reg rec_op;
	reg rec_num;

	// Outputs
	wire guardeNum;
	wire leaResult;

	// Instantiate the Unit Under Test (UUT)
	StateMachineCalculator uut (
		.clk(clk), 
		.rec_op(rec_op), 
		.rec_num(rec_num), 
		.guardeNum(guardeNum), 
		.leaResult(leaResult)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		rec_op = 0;
		rec_num = 0;
		// Wait 100 ns for global reset to finish
		#10;
		
		rec_op = 0;
		rec_num = 1;		
		
		#10;
		
		rec_op = 0;
		rec_num = 1;

		#10;
		
		rec_op = 0;
		rec_num = 1;

		#10;
		
		rec_op = 1;
		rec_num = 0;		
        
		// Add stimulus here

	end
      
endmodule

