`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:18:21 11/14/2016
// Design Name:   Decoder
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/ControlDecoderTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControlDecoderTest;

	// Inputs
	reg [1:0] Op;
	reg [5:0] Funct;
	reg [3:0] Rd;

	// Outputs
	wire [1:0] FlagW;
	wire PCS;
	wire RegW;
	wire MemW;
	wire MemtoReg;
	wire [1:0] ALUSrc;
	wire [1:0] ImmSrc;
	wire [1:0] RegSrc;
	wire [1:0] ALUControl;

	// Instantiate the Unit Under Test (UUT)
	Decoder uut (
		.Op(Op), 
		.Funct(Funct), 
		.Rd(Rd), 
		.FlagW(FlagW), 
		.PCS(PCS), 
		.RegW(RegW), 
		.MemW(MemW), 
		.MemtoReg(MemtoReg), 
		.ALUSrc(ALUSrc), 
		.ImmSrc(ImmSrc), 
		.RegSrc(RegSrc), 
		.ALUControl(ALUControl)
	);

	initial begin
		// Initialize Inputs
		Op = 2'b0;
		Funct = 6'b0;
		Rd = 4'b0;
		
		//AND R3,R3,#0 

		#10;
		
		Op = 2'b0;
		Funct = 6'b100000;
		Rd = 4'b0;	

		#10;
		//ORR R9,R9,#65536
		
		Op = 2'b0;
		Funct = 6'b111000;
		Rd = 4'b0;	

		#10;
		//CMP R2,R3
		
		Op = 2'b0;
		Funct = 6'b010101;
		Rd = 4'b0;		

		#10;		
		//ADDLS R0,R0,#1 (V)
		
		Op = 2'b0;
		Funct = 6'b101000;
		Rd = 4'b0;

		#10;
		//ADDNE(V) 
		
		Op = 2'b0;
		Funct = 6'b001000;
		Rd = 4'b0;	
		
		#10;
		//SUBLS(V) 
		
		Op = 2'b0;
		Funct = 6'b000100;
		Rd = 4'b0;	
		
		#10;
		//STR I = 0
		
		Op = 2'b01;
		Funct = 6'b000000;
		Rd = 4'b0;	
		
		#10;
		//STR I = 1
		
		Op = 2'b01;
		Funct = 6'b100000;
		Rd = 4'b0;	

		//LDR I = 0
		#10;
		Op = 2'b01;
		Funct = 6'b000001;
		Rd = 4'b0;	
		
		#10;
		//LDR I = 1
		
		Op = 2'b01;
		Funct = 6'b100001;
		Rd = 4'b0;	

		//BNE I = 1
		#10;
		Op = 2'b10;
		Funct = 6'b100000;
		Rd = 4'b0;			
		

		
				
	end
      
endmodule

