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
				32'h0: dataOutput = 32'd000111;
				32'h4: dataOutput = 32'd111222;
				32'h8: dataOutput = 32'd222333;
				32'hC: dataOutput = 32'd333333;
				32'h10: dataOutput = 32'd333444;
				32'h14: dataOutput = 32'd444555;
				32'h18: dataOutput = 32'd555666;
				32'h1C: dataOutput = 32'd666777;
				32'h20: dataOutput = 32'd777888;
				32'h24: dataOutput = 32'd888999;
				32'h28: dataOutput = 32'd999000;	 
				default: dataOutput = 32'b0;
		endcase
	 end
endmodule
