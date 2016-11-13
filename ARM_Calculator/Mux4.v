`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:51:25 11/10/2016 
// Design Name: 
// Module Name:    Mux4 
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
module Mux32Bits_4Entradas(
    input [31:0]A,		//Entrada 0 de 32 bits
    input [31:0]B,		//Entrada 1 de 32 bits
	 input [31:0]C,		//Entrada 2 de 32 bits
	 input [31:0]D,		//Entrada 3 de 32 bits
    input [1:0]S,			//Entrada de seleccion de 1 bit
    output reg [31:0]Y	//Salida de data seleccionada de 32 bits
    );

always @*		//Seleccion de data dependiendo de valor de S 
    case(S)
		2'b00:	Y <= A;
		2'b01:   Y <= B;
		2'b10:   Y <= C;
		2'b11:   Y <= D;
	endcase
endmodule

