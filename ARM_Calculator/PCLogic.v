`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:44:06 11/14/2016 
// Design Name: 
// Module Name:    PCLogic 
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
module PCLogic(
    input [3:0] Rd,
    input RegW,
    input Branch,
    output wire PCS
    );
	 
	 assign PCS = ((Rd == 4'b1111) & RegW) | Branch;


endmodule
