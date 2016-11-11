`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:17:53 11/10/2016 
// Design Name: 
// Module Name:    flagsRegister 
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
module FlagsRegister(  
	 input [31:0] Di, //entrada
	 input clk,       //reloj
	 input enable,    //enable
	 output reg [31:0] Do  //registro
	);
	
	always @(posedge clk) 
		begin
			if(~enable)
				Do=Di; //se le asigna el dato de entrada al registro de 23 bits
		end

endmodule
