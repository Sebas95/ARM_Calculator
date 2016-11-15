`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:26 11/07/2016 
// Design Name: 
// Module Name:    MemoriaParaIntrucciones 
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
module MemoriaParaIntrucciones(
	 input [31:0] address,
    output reg [31:0] dataOutput
    );
	 
	 always@*
	 begin                                             //RD
		case(address)			                         //----// 
				32'd0:  dataOutput = 32'b11100010000000000000000000000000;
				32'd4:  dataOutput = 32'b11100010000000000001000000000000;
				32'd8:  dataOutput = 32'b11100010000000000010000000000000;
				32'd12: dataOutput = 32'b11100010000000000011000000000000;
				32'd16: dataOutput = 32'b11100010000000000100000000000000;
				32'd20: dataOutput = 32'b11100010000000000101000000000000;
				32'd24: dataOutput = 32'b11100010000000000110000000000000;
				32'd28: dataOutput = 32'b11100010000000000111000000000000;
				32'd32: dataOutput = 32'b11100010000000001000000000000000;
				32'd36: dataOutput = 32'b11100010000000001001000000000000;
				32'd40: dataOutput = 32'b11100010000000001010000000000000;
				32'd44: dataOutput = 32'b11100010000000001011000000000000;
				32'd48: dataOutput = 32'b11100010000000001100000000000000;
				32'd52: dataOutput = 32'b11100010000000001101000000000000;
				32'd56: dataOutput = 32'b11100010000000001110000000000000;
				32'd60: dataOutput = 32'b11100010000000001111000000000000;
				default: dataOutput = 32'b0;
		endcase
	 end
endmodule
