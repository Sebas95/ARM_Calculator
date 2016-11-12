`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:38 11/12/2016
// Design Name:   BancoDeRegistros
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/RegisterFileTest.v
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

module RegisterFileTest;

	// Inputs
	reg clk;
	reg WE3;
	reg [3:0] A1;
	reg [3:0] A2;
	reg [3:0] A3;
	reg [31:0] WD3;
	reg [31:0] RD15;

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
		.RD1(RD1), 
		.RD2(RD2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		WE3 = 0;
		A1 = 4'd0;
		A2 = 4'd0;
		A3 = 4'd0;
		WD3 = 0;
		RD15 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk = 1;
		WE3 = 0;
		A1 = 4'd0;
		A2 = 4'd0;
		A3 = 4'd0;
		WD3 = 0;
		RD15 = 0;

		// Wait 100 ns for global reset to finish
		#100;

		clk = 0;
		WE3 = 0;
		A1 = 4'd0;
		A2 = 4'd0;
		A3 = 4'd4;
		WD3 = 32'd345;
		RD15 = 0;

		// Wait 100 ns for global reset to finish
		#100;

		clk = 1;
		WE3 = 1;
		A1 = 4'd4;
		A2 = 4'd0;
		A3 = 4'd0;
		WD3 = 0;
		RD15 = 0;

		// Wait 100 ns for global reset to finish
		#100;	
		
		clk = 0;
		WE3 = 0;
		A1 = 4'd4;
		A2 = 4'd0;
		A3 = 4'd6;
		WD3 = 32'd9999;
		RD15 = 0;

		// Wait 100 ns for global reset to finish
		#100;		
		

		clk = 1;
		WE3 = 1;
		A1 = 4'd6;
		A2 = 4'd4;
		A3 = 4'd1;
		WD3 = 32'd10;
		RD15 = 0;

		// Wait 100 ns for global reset to finish
		#100;				

		clk = 0;
		WE3 = 0;
		A1 = 4'd6;
		A2 = 4'd4;
		A3 = 4'd1;
		WD3 = 32'd10;
		RD15 = 0;

		// Wait 100 ns for global reset to finish
		#100;		

		clk = 1;
		WE3 = 1;
		A1 = 4'd1;
		A2 = 4'd4;
		A3 = 4'd1;
		WD3 = 32'd10;
		RD15 = 0;

		// Wait 100 ns for global reset to finish
		#100;				
        
		// Add stimulus here

	end
      
endmodule

