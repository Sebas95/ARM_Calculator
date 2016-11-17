`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:29:31 11/16/2016
// Design Name:   BancoDeRegistros
// Module Name:   C:/Users/Sebastian/Documents/GitHub/ARM_Calculator/ARM_Calculator/banco_test.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BancoDeRegistros
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module banco_test;

	// Inputs
	reg clk=1;
	reg WE3;
	reg [3:0] A1;
	reg [3:0] A2;
	reg [3:0] A3;
	reg [31:0] WD3;
	reg [31:0] r15;

	// Outputs
	wire [31:0] RD1;
	wire [31:0] RD2;

	// Instantiate the Unit Under Test (UUT)
	BancoDeRegistros uut (
		.clk(clk), 
		.WE3(WE3), 
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.WD3(WD3), 
		.r15(r15), 
		.RD1(RD1), 
		.RD2(RD2)
	);
	
	always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		WE3 = 0;
		A1 = 0;
		A2 = 0;
		A3 = 0;
		WD3 = 0;
		r15 = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		WE3 = 0;
		A1 = 0;
		A2 = 0;
		A3 = 4'b1001;
		WD3 = 32'b00000000000000000000000000000111;
		r15 = 0;
		
		#10;
		WE3 = 0;
		A1 = 4'b1001;
		A2 = 0;
		A3 = 0;
		WD3 = 0;
		r15 = 0;
		#10;		
		// Add stimulus here
		WE3 = 0;
		A1 = 4'b1000;
		A2 = 0;
		A3 = 0;
		WD3 = 0;
		r15 = 0;

	end
      
endmodule

