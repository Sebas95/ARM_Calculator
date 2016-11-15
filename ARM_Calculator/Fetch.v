`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:15 11/11/2016 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
    input 	    PCSrc,
    input 		 clk,
    input 		 [31:0] PCBranch,
    output wire [31:0] PCPlus4,
	 output  	 [31:0] Instr
    );
	 	 
	 wire [31:0] PCprima;
	 wire [31:0] PCw;
	 
	 Mux muxFetch(
		.A(PCPlus4),		//Entrada 0 de 32 bits
		.B(PCBranch),		//Entrada 1 de 32 bits
		.S(PCSrc),				//Entrada de seleccion de 1 bit
		.Y(PCprima)	//Salida de data seleccionada de 32 bits
    );	 
	 
	 PC PCFetch(
		.Di(PCprima), //DatoEntrada
		.clk(clk), //Reloj
		.Do(PCw)  //DatoSalida
	 );
	 
	 thirtyTwoBitsFullAdder fullAdder(
		.a(PCw), 
		.b(32'd4),
		.s(PCPlus4),
		.c0(1'b0),
		.cout()
    );
	 	 	 	
	 MemoriaParaIntrucciones instructionMemoryFetch(
		.address(PCw),
		.dataOutput(Instr)
    );
	 

endmodule
