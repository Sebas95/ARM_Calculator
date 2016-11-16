`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:37:12 11/10/2016 
// Design Name: 
// Module Name:    UnidadDeExtension 
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
module UnidadDeExtension(
	input [23:0] dataI,
	input [1:0] ExtImm,
	output [31:0] dataO
    );
	 	
	assign dataO = (ExtImm  == 2'b00) ? {{24{1'b1}},dataI[7:0]}:
//						(ExtImm  == 2'b00) ? {{8{1'b0}},dataI}:
						(ExtImm  == 2'b01) ? {{8{dataI[23]}},dataI} : 
						(ExtImm  == 2'b10) ? {{20{dataI[11]}},dataI[11:0]}:
						(ExtImm  == 2'b11) ? {32{1'b0}}:
						{32{1'b0}};
						

	//assign dataO = (~ExtImm) ? {{8'b0},dataI} : {32{1'b1}};
	
endmodule
