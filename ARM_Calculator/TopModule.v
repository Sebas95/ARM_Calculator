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
	//input wire [31:0] boton,
	//input wire switch,
	inout wire ps2d, ps2c,
	output wire hsync, vsync,
   output wire [2:0] rgb
    );
	
		wire [31:0]EntradaCalcu;
		wire [31:0]addressCalcu;
		wire writeEnableCalcu;
		wire [31:0] resultadoCalcu;
		wire WE;
		
		
	reg CLK50=0;
	reg CLK25=0;
	always@(posedge CLK_100MHZ)
	begin
		CLK50=~CLK50;
	end
	
	always@(posedge CLK50)
	begin
		CLK25=~CLK25;
	end
	
	Calculator interfazGrafica(
		.CLK_100MHZ(CLK_100MHZ),
		.reset(reset),
		.ps2d(ps2d), 
		.ps2c(ps2c),
		.hsync(hsync), 
		.vsync(vsync),
		.rgb(rgb),
		.leaResult(),
		.numAGuardar(resultadoCalcu),
		.address(addressCalcu),
		.WE(WE),
		.result(EntradaCalcu)
		//.leaResult()
    );
	 
	 
	 SingleCycleuProcessor Procesador(
		.CLK(CLK25),
		.EntradaCalcu(EntradaCalcu),
		.addressCalcu(addressCalcu),
		.writeEnableCalcu(WE),
		.resultadoCalcu(resultadoCalcu)
    );
	 


endmodule
