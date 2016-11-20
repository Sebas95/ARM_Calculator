`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:41 11/18/2016 
// Design Name: 
// Module Name:    Ram32bits 
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
module Ram32bits(
			input clk,
			input CE,
			input CE2,
			input CE3,
			input WE,
			input WE3,
			input [31:0]Di,
			input [31:0]Di3,
			output wire [31:0]Do,
			output wire [31:0]Do2
    );
	 
	reg [31:0]registro=32'd2;
	
	
	always @(negedge clk)
	begin
		if(WE & CE)
			registro=Di; 
		else
			registro=registro;
			
		if(WE3 & CE3)
			registro=Di3; 
		else
			registro=registro;
			
	end
	

	
	
	assign Do = (CE)? registro: 32'bz;
	assign Do2 = (CE2)? registro: 32'bz;
	

endmodule
