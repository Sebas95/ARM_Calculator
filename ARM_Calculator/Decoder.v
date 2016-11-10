`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:11 11/10/2016 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(
    input [1:0]Op,
    input [5:0]Funct,
    input [3:0]Rd,
	 output [1:0]FlagW,
	 output PCS,
	 output RegW,
	 output MemW,
	 output MemtoReg,
	 output [1:0]ALUSrc,
	 output [1:0]ImmSrc,
	 output [1:0]RegSrc,
	 output [1:0]ALUControl
    );


endmodule
