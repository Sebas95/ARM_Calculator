`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:11 11/18/2016 
// Design Name: 
// Module Name:    DecoHexa 
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
module DecoHexa(
			input [31:0]S,
			output wire [15:0]Y
    );
	 
	  
	 assign Y = (S == 32'h0)? 16'b0000000000000001: 
					(S == 32'h4)? 16'b0000000000000010:
					(S == 32'h8)? 16'b0000000000000100:
					(S == 32'hC)? 16'b0000000000001000:
					(S == 32'h10)? 16'b0000000000010000:
					(S == 32'h14)? 16'b0000000000100000:
					(S == 32'h18)? 16'b0000000001000000:
					(S == 32'h1C)? 16'b0000000010000000:
					(S == 32'h20)? 16'b0000000100000000:
					(S == 32'h24)? 16'b0000001000000000:
					(S == 32'h28)? 16'b0000010000000000:
					(S == 32'h2C)? 16'b0000100000000000:
					(S == 32'h30)? 16'b0001000000000000:
					(S == 32'h34)? 16'b0010000000000000:
					(S == 32'h38)? 16'b0100000000000000:
					 16'b1000000000000000;
	 

			

			
			
			
endmodule
