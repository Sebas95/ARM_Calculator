`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:21 11/01/2016 
// Design Name: 
// Module Name:    MemoriadeDatos 
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
module MemoriadeDatos(
    input clk,
    input writeEnable,
    input [31:0] dataInput,
	 input [31:0] address,
    output [31:0] dataOutput
    );
	 
	
	 //Ancho de las memorias
	 localparam ADDR_SIZE = 32;
	 localparam NWORDS = 1024;
	 reg [ADDR_SIZE-1:0] RAM [NWORDS - 1:0];

		 
	 //Inicializacion de la memoria en 1's
	 /*reg [31:0] i = 0;
	 initial 
		 begin	 
			for(i = 0; i < NWORDS; i = i + 1)
				begin
					RAM[i] = {32{1'b1}};
				end
		 end*/
	 
	 assign dataOutput = RAM[address];	 	 
	 
	 //Cada negedge si el writeEnlable está activo entonces escribe el dato
	 always@(negedge clk)
		if(~writeEnable)
			RAM[address] <= dataInput;
endmodule
