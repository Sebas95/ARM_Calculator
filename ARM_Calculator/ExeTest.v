`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:52:25 11/12/2016
// Design Name:   Execution
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/ExeTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Execution
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ExeTest;

	// Inputs
	reg [31:0] RD1;
	reg [31:0] RD2;
	reg [23:0] Imm;
	reg [1:0] ALUSrc;
	reg ImmSrc;
	reg [1:0] ALUControl;

	// Outputs
	wire [3:0] ALUFlags;
	wire [31:0] ALUResult;

	// Instantiate the Unit Under Test (UUT)
	Execution uut (
		.RD1(RD1), 
		.RD2(RD2), 
		.Imm(Imm), 
		.ALUSrc(ALUSrc), 
		.ImmSrc(ImmSrc), 
		.ALUControl(ALUControl), 
		.ALUFlags(ALUFlags), 
		.ALUResult(ALUResult)
	);

	initial begin
		// Initialize Inputs
		RD1 = 0;
		RD2 = 0;
		Imm = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		ALUControl = 0;

		// Wait 100 ns for global reset to finish
		/*#100;
		
		RD1 = 32'd3298765;
		RD2 = 32'd433567;
		Imm = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		ALUControl = 2'b0;		
		
		#100;
		
		RD1 = 32'd342;
		RD2 = 32'd1;
		Imm = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		ALUControl = 2'b01;	

		#100;
		
		RD1 = 32'd55555;
		RD2 = 32'd437;
		Imm = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		ALUControl = 2'b10;	

		#100;
		
		RD1 = 32'd55555;
		RD2 = 32'd437;
		Imm = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		ALUControl = 2'b11;	*/	
		
		//Banderas
		
		//cero
		#100;
		
		RD1 = 32'd444;
		RD2 = 32'd444;
		Imm = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		ALUControl = 2'b01;		
		
		//Negativo

		#100;
		
		RD1 = 32'd444;
		RD2 = 32'd44464;
		Imm = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		ALUControl = 2'b01;				
		
		
		//Overflow
        
		#100;
		
		RD1 = {32{1'd1}};
		RD2 = 32'd44464;
		Imm = 0;
		ALUSrc = 0;
		ImmSrc = 0;
		ALUControl = 2'b01;			  
		  
		// Add stimulus here

	end
      
endmodule

