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
	inout wire ps2d, ps2c,
	output wire hsync, vsync,
   output wire [2:0] rgb,
	output wire leaResult
    );
	 
	wire [9:0] xm;
	wire [8:0] ym;
	wire [2:0] btn;
	
	wire [39:0] numActual;
	wire [3:0] counterTotal;

	wire newOp;
	
	//wire leaResult;
	wire guardeNum;
	wire newDigit;
	wire [3:0] digit;
	 
	NumberMemory memoriaNumeros(
		.clk(CLK_100MHZ),
		.numActual(numActual),
		.newDigit(newDigit),
		.leaResultado(leaResult),
		.counterTotal(counterTotal),
		.saveNumber(guardeNum),
		.digit(digit)
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
    .clk(CLK_100MHZ),
	 .rec_op(newOp),
	 .rec_num(newDigit),
	 .guardeNum(guardeNum),
	 .leaResult(leaResult)
    );

endmodule
