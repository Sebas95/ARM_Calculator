`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:56:52 11/12/2016 
// Design Name: 
// Module Name:    Decode 
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
module Decode(
    input clk,
    input [3:0] Rn,
    input [3:0] Rm,
    input [3:0] Rd,
    input [31:0] WD3,
    input [31:0] PCPlus4,
    input WE3,
    input [1:0] RegSrc,
	 output wire [31:0] RD1,
	 output wire [31:0] RD2
    );
	 
	 wire [3:0] RA1;
	 wire [3:0] RA2;
	 wire [31:0] PCPlus8;
	 
	BancoDeRegistros registrosDecode(
		.clk(clk),
		.WE3(WE3),
		.A1(RA1),
		.A2(RA2),
		.A3(Rd),
		.WD3(WD3),
		.r15(PCPlus8),
		.RD1(RD1),
		.RD2(RD2)
	);
		
	 Mux4Bits_2Entradas muxDecodeRA1(
		.A(Rn),		   //Entrada 0 de 32 bits
		.B(4'b1111),   //Entrada 1 de 32 bits
		.S(RegSrc[0]),	//Entrada de seleccion de 1 bit
		.Y(RA1)			//Salida de data seleccionada de 32 bits
    );
	 
	 Mux4Bits_2Entradas muxDecodeRA2(
		.A(Rm),			 //Entrada 0 de 32 bits
		.B(Rd),			 //Entrada 1 de 32 bits
		.S(RegSrc[1]),	 //Entrada de seleccion de 1 bit
		.Y(RA2)			 //Salida de data seleccionada de 32 bits
    );	

	 thirtyTwoBitsFullAdder fullAdderDecode(
		.a(PCPlus4), 
		.b(32'd4),
		.s(PCPlus8),
		.c0(1'b0),
		.cout()
    );	 
	
endmodule
