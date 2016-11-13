`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:12 11/12/2016 
// Design Name: 
// Module Name:    WriteBack 
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
module WriteBack(
    input clk,
    input [31:0] ALUResult,
    input [31:0] WD,
    input MemWrite,
    input MemtoReg,
    output [31:0] Result 	 
    );
	 
	 wire [31:0] ReadData;
	 
	 MemoriadeDatos DataMemoriaWriteBack(
		.clk(clk),
		.writeEnable(MemWrite),
		.dataInput(WD),
		.address(ALUResult),
		.dataOutput(ReadData)
    );
	 
	 Mux muxWriteBack(
    .A(ALUResult),	//Entrada 0 de 32 bits
    .B(ReadData),		//Entrada 1 de 32 bits
    .S(MemtoReg),		//Entrada de seleccion de 1 bit
    .Y(Result)	      //Salida de data seleccionada de 32 bits
    );
	 
endmodule
