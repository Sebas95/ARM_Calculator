`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:28:15 11/12/2016
// Design Name:   WriteBack
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/WriteBackTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WriteBack
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MemTest;

	// Inputs
	reg clk = 1;
	reg [31:0] ALUResult;
	reg [31:0] WD;
	reg MemWrite;

	// Outputs
	wire [31:0] ReadData;

	// Instantiate the Unit Under Test (UUT)
	Mem uut (
		.clk(clk), 
		.ALUResult(ALUResult), 
		.WD(WD), 
		.MemWrite(MemWrite), 
		.ReadData(ReadData)
	);

	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs		
		ALUResult = 32'hC;
		WD = 32'd865486;
		MemWrite = 0;
		

		// Wait 100 ns for global reset to finish
		#10;
		
		ALUResult = 32'hC;
		WD = 32'd0;
		MemWrite = 1;
				
		
		#10;
		
		ALUResult = 32'h3E;
		WD = 32'd77777;
		MemWrite = 0;
		
		
		#10;
		
		ALUResult = 32'hC;
		WD = 32'd4554;
		MemWrite = 1;

		#10;
		
		ALUResult = 32'h3E;
		WD = 32'd4554;
		MemWrite = 1;
				
		
		
        
		// Add stimulus here

	end
      
endmodule

