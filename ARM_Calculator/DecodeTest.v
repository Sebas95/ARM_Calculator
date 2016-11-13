`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:42:10 11/12/2016
// Design Name:   Decode
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/DecodeTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DecodeTest;

	// Inputs
	reg clk = 1;
	reg [3:0] Rn = 0;
	reg [3:0] Rm = 0;
	reg [3:0] Rd = 0;
	reg [31:0] WD3 = 0;
	reg [31:0] PCPlus4 = 0;
	reg WE3 = 0;
	reg [1:0] RegSrc = 0;

	// Outputs
	wire [31:0] RD1;
	wire [31:0] RD2;
	wire [31:0] PCPlus8;

	// Instantiate the Unit Under Test (UUT)
	Decode uut (
		.clk(clk), 
		.Rn(Rn), 
		.Rm(Rm), 
		.Rd(Rd), 
		.WD3(WD3), 
		.PCPlus4(PCPlus4), 
		.WE3(WE3), 
		.RegSrc(RegSrc), 
		.RD1(RD1), 
		.RD2(RD2), 
		.PCPlus8(PCPlus8)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		Rn = 4'd0;
		Rm = 4'd0;
		Rd = 4'd0;
		WD3 = 32'd1;
		PCPlus4 = 0;
		WE3 = 0;
		RegSrc = 2'b0;

		// Wait 100 ns for global reset to finish
		/*
		#10;
        
		Rn = 4'd0;
		Rm = 4'd0;
		Rd = 4'd1;
		WD3 = 32'd555;
		PCPlus4 = 4;
		WE3 = 0;
		RegSrc = 2'b0;

		#10
		
		Rn = 4'd0;
		Rm = 4'd1;
		Rd = 4'd5;
		WD3 = 32'd666;
		PCPlus4 = 4;
		WE3 = 0;
		RegSrc = 2'b0;		
		

		#10
		
		Rn = 4'd1;
		Rm = 4'd5;
		Rd = 4'd7;
		WD3 = 32'd666;
		PCPlus4 = 4;
		WE3 = 1;
		RegSrc = 2'b0;	

		#10
		
		Rn = 4'd7;
		Rm = 4'd0;
		Rd = 4'd5;
		WD3 = 32'd666;
		PCPlus4 = 4;
		WE3 = 1;
		RegSrc = 2'b0;			
		
		*/
		//------------------------------------Pruebas Muxes
			

		#10
		
		Rn = 4'd7;
		Rm = 4'd0;
		Rd = 4'd15;
		WD3 = 32'd666;
		PCPlus4 = 4;
		WE3 = 0;
		RegSrc = 2'b01;				
		
		#10
		
		Rn = 4'd7;
		Rm = 4'd0;
		Rd = 4'd5;
		WD3 = 32'd666;
		PCPlus4 = 4;
		WE3 = 0;
		RegSrc = 2'b10;

		#10
		
		Rn = 4'd15;
		Rm = 4'd0;
		Rd = 4'd5;
		WD3 = 32'd666;
		PCPlus4 = 4;
		WE3 = 1;
		RegSrc = 2'b11;		
		
				
		
		
				
	end
      
endmodule

