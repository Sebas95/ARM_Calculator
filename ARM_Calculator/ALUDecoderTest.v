`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:52:13 11/14/2016
// Design Name:   ALUDecoder
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/ALUDecoderTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUDecoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUDecoderTest;

	// Inputs
	reg [4:0] Funct;
	reg ALUOp;

	// Outputs
	wire [1:0] ALUControl;
	wire [1:0] FlagW;

	// Instantiate the Unit Under Test (UUT)
	ALUDecoder uut (
		.Funct(Funct), 
		.ALUOp(ALUOp), 
		.ALUControl(ALUControl), 
		.FlagW(FlagW)
	);

	initial begin
		// Initialize Inputs
		Funct = 4'b0;
		ALUOp = 0;
		
		//---------------Parte con ALUOp = 0
		
		//--------------Add
		
		#100;
		
		Funct = 4'b0100;
		ALUOp = 0;
		
		//--------------Sub

		#100;		
		
		Funct = 4'b0010;
		ALUOp = 0;		
		
		//--------------And

		#100;		
		
		Funct = 4'b0;
		ALUOp = 0;			

		//--------------ORR

		#100;		
		
		Funct = 4'b1100;
		ALUOp = 0;				
		
		
		//---------------Parte con ALUOp = 1
		
		//--------------Add
		
		#100;
		
		Funct = 5'b01000;
		ALUOp = 1;
		
		#100;
		
		Funct = 5'b01001;
		ALUOp = 1;		
		
		//--------------Sub

		#100;		
		
		Funct = 5'b00100;
		ALUOp = 1;		
		
		#100;		
		
		Funct = 5'b00101;
		ALUOp = 1;	
		
		//--------------And

		#100;		
		
		Funct = 5'b0;
		ALUOp = 1;	

		#100;		
		
		Funct = 5'b00001;
		ALUOp = 1;			

		//--------------ORR

		#100;		
		
		Funct = 5'b11000;
		ALUOp = 1;			
		
		#100;		
		
		Funct = 5'b11001;
		ALUOp = 1;			
        
		  

	end
      
endmodule

