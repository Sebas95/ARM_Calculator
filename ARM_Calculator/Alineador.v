`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:22:17 11/10/2016 
// Design Name: 
// Module Name:    Alineador 
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
module Alineador(
    input [31:0] A,//Variable de entrada
    output wire [31:0] B//Variable de salida
    );
	 
	// assign B={A[29:0],2'b0};//Se alinea la variable de entrada
assign B[0]=1'b0;//Se alinea la variable de entrada
assign B[1]=1'b0;//Se alinea la variable de entrada
assign B[2]= A[0];
assign B[3]= A[1];
assign B[4]= A[2];
assign B[5]= A[3];
assign B[6]= A[4];
assign B[7]= A[5];
assign B[8]= A[6];
assign B[9]= A[7]; 
assign B[10]= A[8];
assign B[11]= A[9];
assign B[12]= A[10];
assign B[13]= A[11];
assign B[14]= A[12];
assign B[15]= A[13];
assign B[16]= A[14];
assign B[17]= A[15];
assign B[18]= A[16];
assign B[19]= A[17];
assign B[20]= A[18];
assign B[21]= A[19];
assign B[22]= A[20];
assign B[23]= A[21];
assign B[24]= A[22];
assign B[25]= A[23];
assign B[26]= A[24];
assign B[27]= A[25];
assign B[28]= A[26];
assign B[29]= A[27];
assign B[30]= A[28];
assign B[31]= A[29];

endmodule
