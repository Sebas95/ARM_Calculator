`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:22:02 11/14/2016
// Design Name:   Control_Unit
// Module Name:   C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/ControlUnitTest.v
// Project Name:  ARM_Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControlUnitTest;

	// Inputs
	reg CLK = 1;
	reg [3:0] Cond;
	reg [3:0] ALUFlags;
	reg [1:0] Op;
	reg [5:0] Funct;
	reg [3:0] Rd;

	// Outputs
	wire PCSrc;
	wire RegWrite;
	wire MemWrite;
	wire MemtoReg;
	wire [1:0] ALUSrc;
	wire [1:0] ImmSrc;
	wire [1:0] RegSrc;
	wire [1:0] ALUControl;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.CLK(CLK), 
		.Cond(Cond), 
		.ALUFlags(ALUFlags), 
		.Op(Op), 
		.Funct(Funct), 
		.Rd(Rd), 
		.PCSrc(PCSrc), 
		.RegWrite(RegWrite), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.ALUSrc(ALUSrc), 
		.ImmSrc(ImmSrc), 
		.RegSrc(RegSrc), 
		.ALUControl(ALUControl)
	);
	
	always #5 CLK = ~CLK;
	
	initial begin
		// Initialize Inputs
		Cond = 0;
		ALUFlags = 0;
		Op = 0;
		Funct = 0;
		Rd = 0;
		/*
		// Wait 100 ns for global reset to finish
		//AND R3,R3,#0
		#10;
		
		Cond = 4'b1110;
		ALUFlags = 4'd0;
		Op = 2'b00;
		Funct = 6'b100000;
		Rd = 4'd4;		
		
		//ORR R9,R9,#65536
		#10;
		
		Cond = 4'b1110;
		ALUFlags = 0;
		Op = 2'b00;
		Funct = 6'b111000;
		Rd = 4'd4;
		
		
		//CMP R2,R3
		#10;
		
		Cond = 4'b1110;
		ALUFlags = 0;
		Op = 2'b00;
		Funct = 6'b010101;
		Rd = 4'd4;


		//ADDLS R0,R0,#1 (V)
		#10;
		
		Cond = 4'b1001;
		ALUFlags = 0;
		Op = 2'b00;
		Funct = 6'b101000;
		Rd = 4'd4;


		//ADDNE(V) 
		#10;
		
		Cond = 4'b0001;
		ALUFlags = 4'b0010;
		Op = 2'b00;
		Funct = 6'b001000;
		Rd = 4'd4;		
		//NZCV
		//SUBLS(V)
		#10;
		
		Cond = 4'b1001;
		ALUFlags = 4'b1000;
		Op = 2'b00;
		Funct = 6'b000100;
		Rd = 4'd4;				
		
		
		//SUBLS(F)
		#10;
		
		Cond = 4'b1001;
		ALUFlags = 4'b1000;
		Op = 2'b00;
		Funct = 6'b000100;
		Rd = 4'd4;			*/	
		
		
		//-----------------Store y load word y branch
		
		//STR 
		/*
		#10;
		Cond = 4'b1110;
		ALUFlags = 4'b0000;
		Op = 2'b01;
		Funct = 6'b000000;
		Rd = 4'd4;		
		
		//LDR 
		
		#10;
		Cond = 4'b1110;
		ALUFlags = 4'b0000;
		Op = 2'b01;
		Funct = 6'b000001;
		Rd = 4'd4;		

		//BNE
		
		#10;
		Cond = 4'b0000;
		ALUFlags = 4'b0000;
		Op = 2'b10;
		Funct = 6'b000000;
		Rd = 4'd4;			
		*/
		//---------------------------------------------
		
		
		//SUBLS(V)
		#10;
		
		Cond = 4'b1110;
		ALUFlags = 4'b0010;
		Op = 2'b00;
		Funct = 6'b010101;
		Rd = 4'd4;		

		#10;
		Cond = 4'b1110;
		ALUFlags = 4'b0000;
		Op = 2'b00;
		Funct = 6'b000000;
		Rd = 4'd4;			
		
		//NZCV
		//SUBLS(F)
		#10;
		
		Cond = 4'b1001;
		ALUFlags = 4'b1000;
		Op = 2'b00;
		Funct = 6'b000100;
		Rd = 4'd4;	
        
		// Add stimulus here

	end
      
endmodule

