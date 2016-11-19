`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:41:07 11/19/2016
// Design Name:   SingleCycleuProcessor
// Module Name:   C:/Users/Sebastian/Documents/GitHub/ARM_Calculator/ARM_Calculator/interfaz_test.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SingleCycleuProcessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module interfaz_test;

	// Inputs
	reg CLK=0;
	reg [31:0] EntradaCalcu;
	reg [31:0] addressCalcu;
	reg writeEnableCalcu;

	// Outputs
	wire [31:0] resultadoCalcu;

	// Instantiate the Unit Under Test (UUT)
	SingleCycleuProcessor uut (
		.CLK(CLK), 
		.EntradaCalcu(EntradaCalcu), 
		.addressCalcu(addressCalcu), 
		.writeEnableCalcu(writeEnableCalcu), 
		.resultadoCalcu(resultadoCalcu)
	);

	always #5 CLK=~CLK;
	initial begin
		// Initialize Inputs
		EntradaCalcu = 0;
		addressCalcu = 0;
		writeEnableCalcu = 1;

		// Wait 100 ns for global reset to finish
		#100;
      EntradaCalcu = 32'd7;
		addressCalcu = 32'd16;
		writeEnableCalcu = 0; 
		
		//no hace nada
		#100;
      EntradaCalcu = 32'd7;
		addressCalcu = 32'd16;
		writeEnableCalcu = 1;

		#100;
      EntradaCalcu = 32'd8;
		addressCalcu = 32'd20;
		writeEnableCalcu = 0;

		//no hace nada
		#100;
      EntradaCalcu = 32'd6;
		addressCalcu = 32'd20;
		writeEnableCalcu = 1;	

		#100;
      EntradaCalcu = 32'd2;//codigo de operacion
		addressCalcu = 32'd0;
		writeEnableCalcu = 0;

		//no hace nada
		#100;
      EntradaCalcu = 32'd6;
		addressCalcu = 32'd20;
		writeEnableCalcu = 1;		
		  
		

	end
      
endmodule

