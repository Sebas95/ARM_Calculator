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
    output [31:0] dataOutput
    );
	 
	localparam ADDR_SIZE = 32;
	localparam NWORDS = 65536;
	reg [ADDR_SIZE-1:0] RAM [NWORDS - 1:0];
		
	reg [31:0] i = 0;
	 initial 
		 begin			 
			RAM[32'd0]   = 32'd3432;
			RAM[32'd4]   = 32'd2;
			RAM[32'd8]   = 32'd47;
			RAM[32'd12]  = 32'd55;
			RAM[32'd16]  = 32'd878;		
			RAM[32'd100] = 32'd100;
			RAM[32'd104] = 32'd1;
			RAM[32'd108] = 32'd99;
			RAM[32'd112]  = 32'd66;
			RAM[32'd116] = 32'd777;
		end

	assign dataOutput = RAM[address];

endmodule
