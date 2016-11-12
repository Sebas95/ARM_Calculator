`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:40:36 11/12/2016
// Design Name:   Mux4Bits_2Entradas
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/Mux4Bits_2EntradaTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux4Bits_2Entradas
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux4Bits_2EntradaTest;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg S;

	// Outputs
	wire [3:0] Y;

	// Instantiate the Unit Under Test (UUT)
	Mux4Bits_2Entradas uut (
		.A(A), 
		.B(B), 
		.S(S), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 4'b0;
		B = 4'd5;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		A = 4'd5;
		B = 4'd7;
		S = 1;

		// Wait 100 ns for global reset to finish
		#100;


		A = 4'd14;
		B = 4'd15;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;

		A = 4'd14;
		B = 4'd15;
		S = 1;

		// Wait 100 ns for global reset to finish
		#100;		
        
		// Add stimulus here

	end
      
endmodule

