`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:13 10/11/2016 
// Design Name: 
// Module Name:    TicTacToe 
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
module Calculator(
	input wire CLK_100MHZ,
	input wire reset,
	output wire  [31:0] result,
	inout wire ps2d, ps2c,
	output wire hsync, vsync,
   output wire [2:0] rgb,
	output wire leaResult,
	input wire [31:0] numAGuardar,
	output wire [32:0] address,
	output wire WE
    );
	 
	wire [9:0] xm;
	wire [8:0] ym;
	//wire [2:0] btn;
	wire [31:0]reg_op = {{28{1'b0}},digit};
	wire [31:0] numActual;
	wire [3:0] counterTotal;
	
	wire guardeOpProcessor;
	wire newOp;
	
	//wire leaResult;
	wire guardeNum;
	wire newDigit;
	wire [3:0] digit;
	wire guardeNumProcessor;
	assign WE = guardeOpProcessor | guardeNumProcessor;
	
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
	
	 Mux muxCal(
		 .A(reg_op),	//Entrada 0 de 32 bits
		 .B(numActual),		//Entrada 1 de 32 bits
		 .S(1'b0),		//Entrada de seleccion de 1 bit
		 .Y(result)	   );   //Salida de data seleccionada de 32 bits
	 
	NumberMemory memoriaNumeros(
		.clk(CLK25),
		.numActual(numActual),
		.newDigit(newDigit),
		.leaResultado(leaResult),
		.counterTotal(counterTotal),
		.saveNumber(guardeNum),
		.digit(digit),
		.resultado(numAGuardar)
    );
	 
	 


   mouseController mouseC
      (.CLK_100MHZ(CLK_100MHZ), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
       .posX(xm), .posY(ym), .buttons(btn));
				
   VGAPainterColorConfig VGAPCC (
	.clk_100MHz(CLK_100MHZ),
   .hsync(hsync),
	.vsync(vsync),
   .rgb(rgb),
	.xm(xm),
	.ym(ym),	
	.numActual(numActual),
	.counterTotal(counterTotal)	
	);
	
   clickedSquare clickedSquare(
    .clicked(btn),
    .Xlocation(xm),
    .Ylocation(ym),
    .clickedMatrix(digit),
	 .newDigit(newDigit),
	 .newOp(newOp)
    );
	 
	 StateMachineCalculator maquinaEstados(
    .clk(CLK25),
	 .rec_op(newOp),
	 .rec_num(newDigit),
	 .guardeNum(guardeNum),
	 .leaResult(leaResult),
	 .guardeNumProcessor(guardeNumProcessor),
	 .guardeOpProcessor(guardeOpProcessor),
	 .address(address)	 
    );

endmodule
