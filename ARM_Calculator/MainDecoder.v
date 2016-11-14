`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:39:18 11/14/2016 
// Design Name: 
// Module Name:    MainDecoder 
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
module MainDecoder(
    input [1:0] Op,
    input [5:0] Funct,
	 output RegW,
	 output MemW,
	 output MemtoReg,
	 output ALUSrc,
	 output [1:0] ImmSrc,
	 output [1:0] RegSrc
    );
	 
																					                
	 assign RegW = (Op == 2'01) ? 1'b1 : 1'b0;
	 
	 assign MemW = ((Op == 2'01) & ~Funct[0]) ? 1'b1 : 1'b0;
	 
	 assign MemtoReg = ((Op == 2'01) & Funct[0]) ? 1'b1 : 1'b0;
	 
	 assign ALUSrc = ((Op == 2'00) & ~Funct[5]) ? 1'b0 : 1'b1;
	 
	 assign ImmSrc = ((Op == 2'01)) ? 1'b0 : 
						  ((Op == 2'00)) ? 1'b0 : 
						  ((Op == 2'00)) ? 1'b1 :
							1'b0;
	 
	 assign RegSrc = ();
						


endmodule
