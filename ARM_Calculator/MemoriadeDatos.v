`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:21 11/01/2016 
// Design Name: 
// Module Name:    MemoriadeDatos 
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
module MemoriadeDatos(
    input clk,
    input writeEnable,
    input [31:0] dataInput,
	 input [31:0] address,
    output wire [31:0] dataOutput
    );
	
	wire [15:0]CE;
	
	DecoHexa deco(
			.S(address),
			.Y(CE)
    );
	
	Ram32bits ram0(.clk(clk),.CE(CE[0]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram1(.clk(clk),.CE(CE[1]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram2(.clk(clk),.CE(CE[2]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram3(.clk(clk),.CE(CE[3]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram4(.clk(clk),.CE(CE[4]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram5(.clk(clk),.CE(CE[5]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram6(.clk(clk),.CE(CE[6]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram7(.clk(clk),.CE(CE[7]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram8(.clk(clk),.CE(CE[8]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram9(.clk(clk),.CE(CE[9]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram10(.clk(clk),.CE(CE[10]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram11(.clk(clk),.CE(CE[11]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram12(.clk(clk),.CE(CE[12]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram13(.clk(clk),.CE(CE[13]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram14(.clk(clk),.CE(CE[14]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
	Ram32bits ram15(.clk(clk),.CE(CE[15]),	.WE(~writeEnable),.Di(dataInput),.Do(dataOutput) );
endmodule
