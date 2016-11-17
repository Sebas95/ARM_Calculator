`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:00 11/17/2016 
// Design Name: 
// Module Name:    NumberMemory 
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
module NumberMemory(
    input clk,
    output reg [3:0] numActual,
	 output reg [2:0] counterTotal = 7
    );
	 reg [2:0] counter = 4'd0;
	 
	 	//devisor de frecuencia pra el controlador VGA
	reg clk_50MHz = 0;
	always @(posedge clk)
		clk_50MHz<= ~clk_50MHz; 
	 
	 always@*
	 begin                                            
		case(counter)
				4'd0:   numActual = 4'd9;
				4'd1:   numActual = 4'd9;
				4'd2:   numActual = 4'd9;
				4'd3:   numActual = 4'd9;
				4'd4:   numActual = 4'd9;
				4'd5:   numActual = 4'd9;
				4'd6:   numActual = 4'd9;
				4'd7:   numActual = 4'd9;
				default: numActual = 32'b0;
		endcase
	 end	 
	 
	 always @(posedge clk_50MHz)
	 if(~(counterTotal == counter))
		counter = counter + 1;
	else
		counter= 0;


endmodule
