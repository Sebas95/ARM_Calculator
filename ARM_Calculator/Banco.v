`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:24 11/18/2016 
// Design Name: 
// Module Name:    Banco 
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
module Banco(
	//entradas
	input clk,
	input WE3,
	input [3:0]A1,
	input [3:0]A2,
	input [3:0]A3,
	input [31:0]WD3,
	input [31:0]r15,
	//salidas
	output wire [31:0]RD1,
	output wire [31:0]RD2

	
    );

	wire [15:0]CE1;
	wire [15:0]CE2;
	wire [15:0]CE3;

	 Deco15Canales deco1(
			.S(A1),
			.Y(CE1)
    );
	 Deco15Canales deco2(
			.S(A2),
			.Y(CE2)
    );
	 Deco15Canales deco3(
			.S(A3),
			.Y(CE3)
    );

	registro32bits R0(
			.clk(clk),
			.CE1(CE1[0]),
			.CE2(CE2[0]),
			.CE3(CE3[0]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R1(
			.clk(clk),
			.CE1(CE1[1]),
			.CE2(CE2[1]),
			.CE3(CE3[1]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R2(
			.clk(clk),
			.CE1(CE1[2]),
			.CE2(CE2[2]),
			.CE3(CE3[2]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R3(
			.clk(clk),
			.CE1(CE1[3]),
			.CE2(CE2[3]),
			.CE3(CE3[3]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R4(
			.clk(clk),
			.CE1(CE1[4]),
			.CE2(CE2[4]),
			.CE3(CE3[4]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R5(
			.clk(clk),
			.CE1(CE1[5]),
			.CE2(CE2[5]),
			.CE3(CE3[5]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R6(
			.clk(clk),
			.CE1(CE1[6]),
			.CE2(CE2[6]),
			.CE3(CE3[6]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R7(
			.clk(clk),
			.CE1(CE1[7]),
			.CE2(CE2[7]),
			.CE3(CE3[7]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R8(
			.clk(clk),
			.CE1(CE1[8]),
			.CE2(CE2[8]),
			.CE3(CE3[8]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R9(
			.clk(clk),
			.CE1(CE1[9]),
			.CE2(CE2[9]),
			.CE3(CE3[9]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R10(
			.clk(clk),
			.CE1(CE1[10]),
			.CE2(CE2[10]),
			.CE3(CE3[10]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R11(
			.clk(clk),
			.CE1(CE1[11]),
			.CE2(CE2[11]),
			.CE3(CE3[11]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R12(
			.clk(clk),
			.CE1(CE1[12]),
			.CE2(CE2[12]),
			.CE3(CE3[12]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R13(
			.clk(clk),
			.CE1(CE1[13]),
			.CE2(CE2[13]),
			.CE3(CE3[13]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R14(
			.clk(clk),
			.CE1(CE1[14]),
			.CE2(CE2[14]),
			.CE3(CE3[14]),
			.WE(~WE3),
			.Di(WD3),
			.DA(RD1),
			.DB(RD2)	
    );
	 registro32bits R15(
			.clk(clk),
			.CE1(CE1[15]),
			.CE2(CE2[15]),
			.CE3(1'b1),
			.WE(1'b1),
			.Di(r15),
			.DA(RD1),
			.DB(RD2)	
    );

endmodule
