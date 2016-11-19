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
	 
	 input [31:0]EntradaCalcu,
	 input [31:0]addressCalcu,
	 input writeEnableCalcu,
	 output wire [31:0]resultadoCalcu,
	 
    output wire [31:0] dataOutput
    );
	
	wire [15:0]CE;
	wire [15:0]CE3;
	
	DecoHexa deco(
			.S(address),
			.Y(CE)
    );
	 
	 DecoHexa decoEscrituraCalcu(
			.S(addressCalcu),
			.Y(CE3)
    );
	
	Ram32bits ram0(.clk(clk), .CE(CE[0]), .CE2(1'b0), .CE3(CE3[0]), .WE(~writeEnable), .WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram1(.clk(clk),.CE(CE[1]), .CE2(1'b0), .CE3(CE3[1]),	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram2(.clk(clk),.CE(CE[2]), .CE2(1'b0),.CE3(CE3[2]), 	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram3(.clk(clk),.CE(CE[3]), .CE2(1'b0),.CE3(CE3[3]), 	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram4(.clk(clk),.CE(CE[4]), .CE2(1'b0),.CE3(CE3[4]), 	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram5(.clk(clk),.CE(CE[5]), .CE2(1'b0),.CE3(CE3[5]), 	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	//siempre es leído con CE2
	Ram32bits ram6(.clk(clk),.CE(CE[6]), .CE2(1'b1),.CE3(CE3[6]), 	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu));
	
	Ram32bits ram7(.clk(clk),.CE(CE[7]), .CE2(1'b0), .CE3(CE3[7]),	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram8(.clk(clk),.CE(CE[8]), .CE2(1'b0),.CE3(CE3[8]), 	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram9(.clk(clk),.CE(CE[9]), .CE2(1'b0),.CE3(CE3[9]), 	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram10(.clk(clk),.CE(CE[10]), .CE2(1'b0),.CE3(CE3[10]), 	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram11(.clk(clk),.CE(CE[11]), .CE2(1'b0), .CE3(CE3[11]),	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram12(.clk(clk),.CE(CE[12]), .CE2(1'b0), .CE3(CE3[12]),	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram13(.clk(clk),.CE(CE[13]),	 .CE2(1'b0),.CE3(CE3[13]), .WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram14(.clk(clk),.CE(CE[14]), .CE2(1'b0), .CE3(CE3[14]),	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
	Ram32bits ram15(.clk(clk),.CE(CE[15]), .CE2(1'b0), .CE3(CE3[15]),	.WE(~writeEnable),.WE3(~writeEnableCalcu),
	.Di(dataInput), .Di3(EntradaCalcu), .Do(dataOutput), .Do2(resultadoCalcu) );
	
endmodule
