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
	 begin                                            
		case(address)
				32'd0:  dataOutput = 32'b11100010000010011001111100000000;
				32'd4:  dataOutput = 32'b11100011100000010001111101100011;
				32'd8:  dataOutput = 32'b11100011100000100010111101100011;
				32'd12:  dataOutput = 32'b11100010000010011001111100000000;
				32'd16: dataOutput = 32'b11100010000000000000111100000000;
				32'd20: dataOutput = 32'b11100010000000110011111100000000;
				32'd24: dataOutput = 32'b11100011100011001100111100000001;
				32'd28: dataOutput = 32'b11100010100010011001111100000000;
				/*32'd32: dataOutput = 32'b11100101101010010001000000000000;
				32'd36: dataOutput = 32'b11100101101010010010000000000100;
				32'd40: dataOutput = 32'b11100101101110010001000000000000;
				32'd44: dataOutput = 32'b11100101101110010010000000000100;
				32'd48: dataOutput = 32'b11100001010100101111000000000011;
				32'd52: dataOutput = 32'b00010000100000000000000000000001;
				32'd56: dataOutput = 32'b00010000100000110011000000001100;
				32'd60: dataOutput = 32'b00011010111111111111111111111011;
				32'd64: dataOutput = 32'b11100101101010010000000000001000;*/
				default: dataOutput = 32'b0;
		endcase
	 end
endmodule
