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
	 input [3:0] digit,
    output wire [39:0] numActual,
	 output reg [3:0] counterTotal = 0
    );
	 
	 wire cambio = newDigit | saveNumber;
	 
	 reg [3:0] reg0 = 0;
	 reg [3:0] reg1 = 0;
	 reg [3:0] reg2 = 0;
	 reg [3:0] reg3 = 0;
	 reg [3:0] reg4 = 0;
	 reg [3:0] reg5 = 0;
	 reg [3:0] reg6 = 0;
	 reg [3:0] reg7 = 0;
	 reg [3:0] reg8 = 0;
	 reg [3:0] reg9 = 0;
	 	
	 always@(posedge cambio)
		begin
			if(saveNumber)
				begin
				//Aqui se manda el dato
					reg0 = 4'b0;
					reg1 = 4'b0;
					reg2 = 4'b0;
					reg3 = 4'b0;
					reg4 = 4'b0;
					reg5 = 4'b0;
					reg6 = 4'b0;
					reg7 = 4'b0;
					reg8 = 4'b0;
					reg9 = 4'b0;
					counterTotal = 4'b0;
				end
			else
				begin				
					if(counterTotal == 0)
						begin reg0 = digit;		
						counterTotal = counterTotal + 1; end
					else if(counterTotal == 1)
						begin reg1 = digit;
						counterTotal = counterTotal + 1; end
					else if(counterTotal == 2)
						begin reg2 = digit;
						counterTotal = counterTotal + 1; end
					else if(counterTotal == 3)
						begin reg3 = digit;
						counterTotal = counterTotal + 1;end
					else if(counterTotal == 4)
						begin reg4 = digit;
						counterTotal = counterTotal + 1;end 
					else if(counterTotal == 5)
						begin reg5 = digit;
						counterTotal = counterTotal + 1;end 
					else if(counterTotal == 6)
						begin reg6 = digit;
						counterTotal = counterTotal + 1;end
					else if(counterTotal == 7)
						begin reg7 = digit;
						counterTotal = counterTotal + 1; end
					else if(counterTotal == 8)
						begin reg8 = digit;
						counterTotal = counterTotal + 1;end
					else if(counterTotal == 9)
						begin reg9 = digit;
						counterTotal = counterTotal + 1;	end
					else	
						begin reg9 = digit;
						counterTotal = counterTotal + 1; end
						
				end
		end	
	assign numActual = {reg9,reg8,reg7,reg6,reg5,reg4,reg3,reg2,reg1,reg0};

endmodule
