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
	inout wire ps2d, ps2c,
	input wire CLK_100MHZ,
	input wire reset,	
	input wire [31:0] numAGuardar,	
	output wire  [31:0] result,	
	output wire hsync, vsync,
   output wire [2:0] rgb,
	output wire leyendoResultado,
	output wire [32:0] address,
	output wire WE
    );
	 
	wire [9:0] xm;
	wire [8:0] ym;
	//wire [2:0] btn;
	wire [31:0] numActual;
	wire [3:0] counterTotal;
	
	wire guardeOpProcessor;
	wire newOp;
	
	 wire guardandoNum1;
	 wire guardandoNum2;
	 wire guardandoOP;
	 wire [31:0] num1; 
	 wire [31:0] num2; 
	 wire [3:0] Operation;	 
	
	//wire leaResult;

	wire newDigit;
	wire [3:0] digit;
	wire guardeNumProcessor;
	
	wire [1:0] SEL_DATO;
	
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
	
	 Mux32Bits_4Entradas MuxExe(
		 .A({32{1'b1}}),		//Entrada 0 de 32 bits
		 .B(num1),		  		//Entrada 1 de 32 bits
		 .C(num2), 				//Entrada 2 de 32 bits
		 .D(Operation),	   //Entrada 3 de 32 bits
		 .S(SEL_DATO),		   //Entrada de seleccion de 1 bit
		 .Y(result)			   //Salida de data seleccionada de 32 bits
    );	
	 
	NumberMemory memoriaNumeros(
		.clk(CLK25),
		.newDigit(newDigit),
		.counterTotal(counterTotal),
		.digit(digit),		
		.resultado(numAGuardar),
	   .guardandoReg2(guardandoNum2),
	   .guardandoReg1(guardandoNum1),
	   .guardandoOP(guardandoOP),
	   .leyendoResultado(leyendoResultado),
		//Salidas
		.numActual(numActual),		
		.num1(num1),
		.num2(num2),
		.Operation(Operation)	
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
	 .leyendoResultado(leyendoResultado),
	 .guardandoNum1(guardandoNum1),
	 .guardandoNum2(guardandoNum2),
	 .guardandoOP(guardandoOP),
	 .address(address),
	 .SEL_DATO(SEL_DATO),
	 .WE(WE)
    );
	 


endmodule
