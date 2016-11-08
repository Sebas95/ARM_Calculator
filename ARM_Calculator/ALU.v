`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:46 11/07/2016 
// Design Name: 
// Module Name:    ALU 
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


module ALU(
		input [31:0] A, B,
		input [1:0]  Func,
		output reg  C, Z, N, V,
		output reg [31:0] out 
		);


always @*
	case (Func)
		2'b00: {C,out} = A + B; 			
		2'b01: {C,out} = A - B;
		2'b10: {C,out} = A & B;
		2'b11: {C,out} = A | B;
		default: {C,out} = {1'b0,32'b0};
	endcase
	
always @*
begin
	if (out == 32'b0)
		Z = 1'b1;
	else
		Z = 1'b0;
		
	if (out[31]==1)
		N= 1'b1;
	else
		N= 1'b0;
		
	if(( A[31] == B[31] ) & ( A[31] == out[31] ))
		V = 1'b1;
	else 
		V = 1'b0;
end

		
endmodule

