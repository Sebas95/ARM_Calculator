`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:47:45 11/14/2016
// Design Name:   ConditionalLogic
// Module Name:   C:/Users/Sebastian/Documents/GitHub/ARM_Calculator/ARM_Calculator/ConditionalLogic_test.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ConditionalLogic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ConditionalLogic_test;

	// Inputs
	reg [3:0] Cond;
	reg [3:0] ALUFlags;
	reg FlagW;
	reg PCS;
	reg RegW;
	reg MemW;
	reg CLK=1;

	// Outputs
	wire PCSrc;
	wire RegWrite;
	wire MemWrite;
	wire CondEx;
	wire [3:0]Flags;

	// Instantiate the Unit Under Test (UUT)
	ConditionalLogic uut (
		.Cond(Cond), 
		.ALUFlags(ALUFlags), 
		.FlagW(FlagW), 
		.PCS(PCS), 
		.RegW(RegW), 
		.MemW(MemW), 
		.CLK(CLK), 
		.PCSrc(PCSrc), 
		.RegWrite(RegWrite), 
		.MemWrite(MemWrite),
		.CondEx(CondEx),
		.Flags(Flags)
	);
	always #5 CLK=~CLK;
	initial begin
		// cmp
		Cond = 4'b1110;
		ALUFlags = 4'b0011;
		FlagW = 1;
		PCS = 0;
		RegW = 0;
		MemW = 0;

		// bls
		#10;
        
		// Add stimulus here
		Cond = 4'b0001;
		ALUFlags = 4'b0000;
		FlagW = 1;
		PCS = 0;
		RegW = 0;
		MemW = 0;

		#10;
		
		Cond = 4'b1110;
		ALUFlags = 4'b0100;
		FlagW = 1;
		PCS = 0;
		RegW = 0;
		MemW = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		Cond = 4'b0001;
		ALUFlags = 4'b0100;
		FlagW = 0;
		PCS = 0;
		RegW = 0;
		MemW = 0;
	end
      
endmodule

