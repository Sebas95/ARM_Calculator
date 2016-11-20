`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:27:57 11/19/2016
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
	reg CLK=1;
	reg [31:0] EntradaCalcu;
	reg [31:0] addressCalcu;
	reg writeEnableCalcu;

	// Outputs
	wire [31:0] resultadoCalcu;
	wire [31:0] RD2;
	wire PCSrc;
	wire MemtoReg;
	wire MemWrite;
	wire [1:0] ALUControl;
	wire [1:0] ALUSrc;
	wire [1:0] ImmSrc;
	wire RegWrite;
	wire [1:0] RegSrc;
	wire [3:0] ALUFlags;
	wire [31:0] Instr;
	wire [31:0] ALUResult;
	wire [31:0] SrcB;
	wire [31:0] RD1;
	wire [3:0] RA1;
	wire [31:0] Result;

	// Instantiate the Unit Under Test (UUT)
	SingleCycleuProcessor uut (
		.CLK(CLK), 
		.EntradaCalcu(EntradaCalcu), 
		.addressCalcu(addressCalcu), 
		.writeEnableCalcu(writeEnableCalcu), 
		.resultadoCalcu(resultadoCalcu), 
		.RD2(RD2), 
		.PCSrc(PCSrc), 
		.MemtoReg(MemtoReg), 
		.MemWrite(MemWrite), 
		.ALUControl(ALUControl), 
		.ALUSrc(ALUSrc), 
		.ImmSrc(ImmSrc), 
		.RegWrite(RegWrite), 
		.RegSrc(RegSrc), 
		.ALUFlags(ALUFlags), 
		.Instr(Instr), 
		.ALUResult(ALUResult), 
		.SrcB(SrcB), 
		.RD1(RD1), 
		.RA1(RA1), 
		.Result(Result)
	);

	always #5 CLK=~CLK;
	initial begin
		// Initialize Inputs
		EntradaCalcu = 0;
		addressCalcu = 0;
		writeEnableCalcu = 1;

		// Wait 100 ns for global reset to finish
		#100;
      EntradaCalcu = 32'd99;
		addressCalcu = 32'd16;
		writeEnableCalcu = 0; 
		
		

		#10;
      EntradaCalcu = 32'd10;
		addressCalcu = 32'd20;
		writeEnableCalcu = 0;

		

		#10;
      EntradaCalcu = 32'd1;//codigo de operacion
		addressCalcu = 32'd0;
		writeEnableCalcu = 0;

		

	end
      
endmodule

