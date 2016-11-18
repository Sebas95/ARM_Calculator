`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:42:26 11/18/2016 
// Design Name: 
// Module Name:    registro32bits 
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
module registro32bits(
			input clk,
			input CE1,
			input CE2,
			input CE3,
			input WE,
			input [31:0]Di,
			output wire [31:0]DA,
			output wire [31:0]DB
			
    );
	 
	reg [31:0]Do=0;
	
	
	
	always @(negedge clk)
	begin
		if(WE & CE3)
			Do=Di;
		else
			Do=Do;
			
	end
	
	
	assign DA = (CE1)? Do: 32'bz;
	
	assign DB = (CE2)? Do: 32'bz;
			
endmodule
