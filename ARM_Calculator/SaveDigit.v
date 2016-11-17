`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:00 11/17/2016 
// Design Name: 
// Module Name:    MakeNumber 
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
module MakeNumber(
    input clk,
    input [3:0] digit,
    input get,
    input save,
	 input complemento,
    output [31:0] resultNumber
    );
	
	reg [4:0] numMemory [15:0];
	reg [4:0] counter =  4'd0;
	reg [4:0] counterAux = 4'b0;
	always@(posedge get)
		numMemory[counter] <= digit;
		counter = counter +1;
	/*always@(posedge save)
		if(~complemento)*/
			
		
			
		
	


endmodule
