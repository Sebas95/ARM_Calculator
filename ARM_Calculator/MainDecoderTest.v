`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:37:43 11/14/2016
// Design Name:   MainDecoder
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/MainDecoderTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MainDecoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MainDecoderTest;

	// Inputs
	reg [1:0] Op;
	reg [5:0] Funct;

	// Outputs
	wire RegW;
	wire MemW;
	wire MemtoReg;
	wire [1:0] ALUSrc;
	wire [1:0] ImmSrc;
	wire [1:0] RegSrc;
	wire Branch;
	wire ALUOp;

	// Instantiate the Unit Under Test (UUT)
	MainDecoder uut (
		.Op(Op), 
		.Funct(Funct), 
		.RegW(RegW), 
		.MemW(MemW), 
		.MemtoReg(MemtoReg), 
		.ALUSrc(ALUSrc), 
		.ImmSrc(ImmSrc), 
		.RegSrc(RegSrc), 
		.Branch(Branch), 
		.ALUOp(ALUOp)
	);

	initial begin
		// Initialize Inputs
		Op = 2'b00;
		Funct = 5'b0;

		//----------------------------------------Op = 00
		#100; //------------------Funct[5] = 0
		Op = 2'b00;
		Funct = 6'b0;		
		#50  //----Funct[0] = 1
		Op = 2'b00;
		Funct = 6'b00001;		
		#50  //------------------Funct[5] = 1
		Op = 2'b00;
		Funct = 6'b100000;				
		#50  //----Funct[0] = 1
		Op = 2'b00;
		Funct = 6'b100001;						
		
		//----------------------------------------Op = 01
		#100; //------------------Funct[0] = 0
		Op = 2'b01;
		Funct = 6'b0;		
		#50  //----Funct[5] = 1
		Op = 2'b01;
		Funct = 6'b100000;		
		#50  //------------------Funct[0] = 1
		Op = 2'b01;
		Funct = 6'b000001;				
		#50  //----Funct[5] = 1
		Op = 2'b01;
		Funct = 6'b100001;								
		
		//----------------------------------------Op = 10
		#100; //------------------Funct[0] = 0
		Op = 2'b10;
		Funct = 6'b0;		
		#50  //----Funct[5] = 1
		Op = 2'b10;
		Funct = 6'b100000;				
		#50  //------------------Funct[0] = 1		
		Op = 2'b10;
		Funct = 6'b000001;				
		#50  //----Funct[5] = 1
		Op = 2'b10;
		Funct = 6'b100001;										
        

	end
      
endmodule

