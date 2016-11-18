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
			input WE,
			input [31:0]Di,
			output wire [31:0]Do
    );
	 
	reg [31:0]registro=0;
	
	
	always @(negedge clk)
	begin
		if(WE & CE)
			registro=Di; 
		else
			registro=registro;
			
	end
	
	
	assign Do = (CE)? registro: 32'bz;
	
	

endmodule
