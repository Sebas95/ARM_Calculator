`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:11 11/12/2016 
// Design Name: 
// Module Name:    Execution 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Execution(
    input [31:0] RD1,
    input [31:0] RD2,
    input [23:0] Imm,
    input [1:0] ALUSrc,
    input [1:0] ImmSrc,
    input [1:0] ALUControl,
	 output wire [3:0] ALUFlags,
	 output wire [31:0] ALUResult,
	 output wire [31:0] SrcB
    );
	 
	 wire [31:0] ExtImm;
	 wire [31:0] ExtImmAligned;
	 
	 	 
	UnidadDeExtension extensionExe(
		.dataI(Imm),
		.ExtImm(ImmSrc),
		.dataO(ExtImm)
    );	 
	 
	Alineador alineadorExe(
		.A(ExtImm[29:0]), 		//Variable de entrada
		.B(ExtImmAligned) //Variable de salida
    );	 
	 
	 Mux32Bits_4Entradas MuxExe(
		 .A(RD2),		     //Entrada 0 de 32 bits
		 .B(ExtImm),		  //Entrada 1 de 32 bits
		 .C(ExtImmAligned), //Entrada 2 de 32 bits
		 .D({32{1'b1}}),	  //Entrada 3 de 32 bits
		 .S(ALUSrc),		  //Entrada de seleccion de 1 bit
		 .Y(SrcB)			  //Salida de data seleccionada de 32 bits
    );	 


	ALU ALUExe(
		.A(RD1), 
		.B(SrcB), 
		.Func(ALUControl),
		.C(ALUFlags[1]), .Z(ALUFlags[2]), 
		.N(ALUFlags[3]), .V(ALUFlags[0]),
		.out(ALUResult) 
	);



endmodule
