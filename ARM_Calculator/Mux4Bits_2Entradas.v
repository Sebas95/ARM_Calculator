`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:12 11/12/2016 
// Design Name: 
// Module Name:    Mux4Bits_2Entradas 
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
module Mux4Bits_2Entradas(
    input [3:0] A,  //Entrada 0 de 4 bits
    input [3:0] B,  //Entrada 1 de 4 bits
    input S,		  //Entrada de seleccion de 1 bit
    output wire [3:0] Y  //Salida de data seleccionada de 4 bits
    );
	
	assign Y = (~S) ? A : B; 


endmodule
