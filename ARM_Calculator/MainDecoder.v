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
	 output [1:0] ALUSrc,
	 output [1:0] ImmSrc,
	 output [1:0] RegSrc,
	 output Branch,
	 output ALUOp
    );
	 
																					                
	 assign RegW     =  (((Op == 2'b01) & ~(Funct[0])) | (Op == 2'b10) ) ? 1'b0 : 
						     1'b1;
	 
	 assign MemW     =  ((Op == 2'b01) & ~Funct[0]) ? 1'b1 : 1'b0;
	 
	 assign MemtoReg =  (Op == 2'b01) ? 1'b1 : 1'b0;
	 
	 assign ALUSrc   =  ((Op == 2'b00) & ~Funct[5]) ? 2'b0 : 
							  (Op == 2'b10) ? 2'b10 :
								2'b01;
	 
	 assign ImmSrc   =  ((Op == 2'b00) & (Funct[5]))  ? 2'b01 :
							  ((Op == 2'b01) & (Funct[5])) ?  2'b10:
							  ((Op == 2'b01) & (~Funct[5])) ?  2'b11:
							  (Op == 2'b10) ?  2'b01:
							  2'b11;
	 
	 assign RegSrc   =  ((Op == 2'b00) & ~Funct[5]) ? 2'b00 :
							  (((Op == 2'b00) & Funct[5]) | 
							  (Op == 2'b01)) ? 2'b10 :
							  2'b11;
								
	assign ALUOp  	  =  (Op == 2'b00) ? 1'b1 : 1'b0;
	
	assign Branch    =  (Op == 2'b10) ? 1'b1 : 1'b0;
					


endmodule
