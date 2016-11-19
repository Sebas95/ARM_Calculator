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
	 input newDigit,
	 input saveNumber,
	 input leaResultado,
	 input [3:0] digit,
    output reg [39:0] numActual,
	 output reg [3:0] counterTotal = 0
    );
	 
	 wire cambio = newDigit | saveNumber ;
	 reg numPrueba = 32'b0;
	 always@(posedge cambio)
		begin
			if(saveNumber)
				begin
				//Aqui se manda el dato
					if(leaResultado) begin
						numActual = 40'b1000_0010_1001;
						counterTotal = 4'd3; end
					else begin
						numActual = 40'b0;
						counterTotal = 4'b0; end
				end
			else 
				begin		
					counterTotal = counterTotal + 1;
					numActual = numActual << 4;
					numActual[3:0] = digit;					
				end
		end	

endmodule
