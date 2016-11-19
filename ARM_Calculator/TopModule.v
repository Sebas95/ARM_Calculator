`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:43 11/19/2016 
// Design Name: 
// Module Name:    TopModule 
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
module TopModule(
	input wire CLK_100MHZ,
	input wire reset,
	inout wire ps2d, ps2c,
	output wire hsync, vsync,
   output wire [2:0] rgb,
    );
	
		wire [31:0]EntradaCalcu;
		wire [31:0]addressCalcu;
		wire writeEnableCalcu;
		wire [31:0]resultadoCalcu;
	
	Calculator interfazGrafica(
		.CLK_100MHZ(CLK_100MHZ),
		.reset(reset),
		.ps2d(ps2d), 
		.ps2c(ps2c),
		.hsync(hsync), 
		.vsync(vsync),
		.rgb(rgb),
		//.leaResult()
    );
	 
	 
	 SingleCycleuProcessor Procesador(
		.CLK(CLK_100MHZ),
		.EntradaCalcu(EntradaCalcu),
		.addressCalcu(addressCalcu),
		.writeEnableCalcu(~writeEnableCalcu),
		.resultadoCalcu(resultadoCalcu),
		
		
		//no connected
		.RD2(),
		.PCSrc(),
		.MemtoReg(),
		.MemWrite(),	 
		.ALUControl(),
		.ALUSrc(),
		.ImmSrc(),
		.RegWrite(),
		.RegSrc(),
		.ALUFlags(),
		.Instr(),
		.ALUResult(),
		.SrcB(),
		.RD1(),
		.RA1(),
		.Result()
	 
    );
	 


endmodule
