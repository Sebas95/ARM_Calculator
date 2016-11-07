`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:54:32 11/01/2016
// Design Name:   MemoriadeDatos
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/TestMemoriaDeDatos.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoriadeDatos
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestMemoriaDeDatos;

	// Inputs
	reg clk;
	reg writeEnable;
	reg [31:0] dataInput;
	reg [31:0] address;

	// Outputs
	wire [31:0] dataOutput;

	// Instantiate the Unit Under Test (UUT)
	MemoriadeDatos uut (
		.clk(clk), 
		.writeEnable(writeEnable), 
		.dataInput(dataInput), 
		.address(address), 
		.dataOutput(dataOutput)
	);
	
	localparam DIR = 32'd65530;

	initial begin
		// Initialize Inputs
		clk = 0;
		writeEnable = 1;
		dataInput = 0;
		address = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk = 0; 
		writeEnable = 1;
		dataInput = 32'd3252;
		address = DIR;
		
		// Wait 100 ns for global reset to finish
		
		#100;
		clk = 0;		
		writeEnable = 1;
		dataInput = 32'd0;
		address = 32'd0;				
		
		#100;
		clk = 1; 
		writeEnable = 1;
		dataInput = 32'd0;
		address = 32'd0;	

		#100;
		clk = 0;		
		writeEnable = 0;
		dataInput = 32'd3252;
		address = DIR;			

		#100;
		clk = 1;		
		writeEnable = 0;
		dataInput = 32'd0;
		address = 32'd0;			
		
		#100;
		clk = 0;		
		writeEnable = 1;
		dataInput = 32'd0;
		address = DIR;					
		
       

	end
      
endmodule

